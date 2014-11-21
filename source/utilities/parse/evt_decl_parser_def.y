--
--	grammar for an event declaration parser
--
%{
class EVT_DECL_PARSER 

inherit

	YY_PARSER_SKELETON		
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end
		
	EVT_SCANNER
		rename
			make as make_scanner
		end

create 
	make
		
feature {ANY}

%}

-- the symbol calculate is the root of the parse tree
%start	declarations

-- these are tokens that appear as part of the grammar in addition to single characters
%token<INTEGER> NUMBER		-- a integer number
%token<REAL> 	REAL      	-- a real number 
%token<STRING>  IDENT  		-- a string identifier
%token			CHAR_LIT 	-- a character literal
%token	        STR_LIT 	-- a string literal
%token 			TK_SYSTEM
%token 			TK_BOOL
%token			TK_CHAR
%token			TK_INT
%token 			TK_REAL
%token    		TK_STR
%token			TK_TUPLE
%token			TK_ARRAY
%token 			TK_TRUE
%token			TK_FALSE
%token 			TK_TRUE_LOWER
%token			TK_FALSE_LOWER
%token			TK_COMMA
%token 			TK_COLON      
%token 			TK_SEMI_COLON 
%token 			TK_LPAREN	  
%token 			TK_RPAREN     
%token 			TK_LSBRAC    
%token			TK_RSBRAC    
%token			TK_LABRAC
%token			TK_RABRAC
%token 			TK_DQUOTE
%token			TK_MINUS
%token	EOL -- an end-of-line character

%type<HASH_TABLE[ARRAY[PARAM_DECL], STRING]>	evt_decl_list 
%type<ARRAY[PARAM_DECL]> 						evt_param_list
%type<PARAM_DECL>								evt_param_decl
%type<PARAM_TYPE>								evt_param_type
%type<PRIMITIVE_PARAM_TYPE>						primitive_param_type
%type<COMPOSITE_PARAM_TYPE>						composite_param_type
%type<ARRAY[PARAM_DECL]> 						prim_simple_param_list 		-- for tuple declarations
%type<PARAM_DECL>								prim_simple_param_decl 		-- for tuple declarations
%type<PRIMITIVE_PARAM_TYPE>						primitive_simple_param_type -- for tuple declarations


%%

declarations : -- declarations of system name and events
    TK_SYSTEM IDENT evt_decl_list
    {
	  system_name := $2
	  event_declarations := $3
	}
	;

evt_decl_list :
	-- Empty rule, create an empty hash table
		{ 
		  create {HASH_TABLE[ARRAY[PARAM_DECL], STRING]} $$.make(10) 
		  $$.compare_objects
		}
	|	evt_decl_list IDENT TK_LPAREN evt_param_list TK_RPAREN
	    {
	 	  -- check that event names are unique
	      if $1.has_key($2) then
			type_error := true
			last_type_error := "event '" + $2 + "'" + " is declared multiple times"
		  end
		
		  -- check that parameter names for each event are unqiue
		  from  
		    i := $4.lower
		  until 
		    i > $4.upper
		  loop
		    from
		      j := $4.lower
		    until
		      j > $4.upper
			loop
			  if NOT (i = j) AND THEN $4[i].name ~ $4[j].name then
			    type_error := true
			    last_type_error := "parameter '" + $4[i].name + "' in event '" + $2 + "' is declared multiple times"
			  end
			  j := j + 1
			end
		    i := i + 1
		  end
		
		  $$ := $1
		  $$.extend($4, $2)
		}
		|	evt_decl_list IDENT
		    {
		 	  -- check that event names are unique
		      if $1.has_key($2) then
				type_error := true
				last_type_error := "event '" + $2 + "'" + " is declared multiple times"
			  end

			  $$ := $1
			  $$.extend(<<>>, $2)
			}
	;
	
evt_param_list : 
      evt_param_decl
      {
  	    create $$.make_empty	
        $$.force($1, $$.upper + 1)
      }
    | evt_param_list TK_SEMI_COLON evt_param_decl
	  {
	    $$ := $1
	    $$.force($3, $$.upper + 1)
	  }
	;
	
evt_param_decl :
      IDENT TK_COLON evt_param_type 
      {
        create $$.make($1, $3)
      }
	;
	
evt_param_type :
	  primitive_param_type { $$ := $1 }
	| composite_param_type { $$ := $1 }
	;

primitive_param_type :
	  primitive_simple_param_type 							{ $$ := $1 }
	| TK_TUPLE 												{ create {TUPLE_PARAM} $$.make (<<>>)}
	| TK_TUPLE TK_LSBRAC prim_simple_param_list TK_RSBRAC	{ create {TUPLE_PARAM} $$.make ($3) }
	;

primitive_simple_param_type :
   	  TK_INT  										{ create {INT_PARAM}   $$ }
    | TK_REAL 										{ create {REAL_PARAM}  $$ }
	| TK_BOOL 										{ create {BOOL_PARAM}  $$ }
	| TK_CHAR 										{ create {CHAR_PARAM}  $$ }
	| TK_STR  										{ create {STR_PARAM}   $$ }
	;
	
composite_param_type :
	  TK_ARRAY TK_LSBRAC primitive_param_type TK_RSBRAC
	  { create {ARRAY_PARAM} $$.make($3) }
	;
	
-- for tuple declarations
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

prim_simple_param_list : 
      prim_simple_param_decl
      {
  	    create $$.make_empty	
        $$.force($1, $$.upper + 1)
      }
    | prim_simple_param_list TK_SEMI_COLON prim_simple_param_decl
	  {
	    $$ := $1
	    $$.force($3, $$.upper + 1)
	  }
	;

prim_simple_param_decl :
      IDENT TK_COLON primitive_simple_param_type 
      {
        create $$.make($1, $3)
      }
	;

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%

feature -- create

	make
			-- Create a new calculator
		do
			last_string_value := ""
			make_parser_skeleton
			make_scanner
			create event_declarations.make(10)
			system_name := ""
			last_syntax_error := ""
			last_type_error := ""
		end
		
feature {NONE} -- loop counters for validity checks
	i, j : INTEGER
		
feature -- access  
    system_name : STRING
	event_declarations : HASH_TABLE[ARRAY[PARAM_DECL], STRING]
	last_syntax_error: STRING
	last_type_error: STRING
	type_error : BOOLEAN
	
feature -- parsing

	report_error(a_message: STRING)
		do
			last_syntax_error := text + " (Line " + line.out + ", " + "Column " + column.out + ")" 
		end

	parse_string(str :STRING)
			-- parse the text of this given string
		local
			buf : YY_BUFFER
		do
			create buf.make(str)
			
			reset
			set_input_buffer(buf)
			parse
		end

	parse_file(filename:STRING)
			-- parse the text of the given input file
		local
			a_file: KL_TEXT_INPUT_FILE
		do
			create a_file.make (filename)
			a_file.open_read
			
			if a_file.is_open_read then
				reset
				set_input_buffer (new_file_buffer (a_file))
				parse
				a_file.close
			else
				std.error.put_string ("event declaration parser: cannot read %'"+filename+"%'%N")
			end
		end
	
end