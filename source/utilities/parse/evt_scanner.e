deferred class EVT_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end
		
	EVT_TOKENS

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (sc = INITIAL)
		end

feature {NONE} -- Implementation

	yy_build_tables
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 59 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 59")
end
-- ignore whitespaces
else
yy_set_line_column
--|#line 61 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 61")
end
-- ignore new lines
end
else
	yy_column := yy_column + 6
--|#line 63 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 63")
end
last_token := TK_SYSTEM
end
else
if yy_act = 4 then
	yy_column := yy_column + 7
--|#line 64 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 64")
end
last_token := TK_BOOL
else
	yy_column := yy_column + 9
--|#line 65 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 65")
end
last_token := TK_CHAR
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
	yy_column := yy_column + 7
--|#line 66 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 66")
end
last_token := TK_INT
else
	yy_column := yy_column + 4
--|#line 67 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 67")
end
last_token := TK_REAL
end
else
if yy_act = 8 then
	yy_column := yy_column + 6
--|#line 68 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 68")
end
last_token := TK_STR
else
	yy_column := yy_column + 5
--|#line 69 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 69")
end
last_token := TK_TUPLE
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
	yy_column := yy_column + 5
--|#line 70 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 70")
end
last_token := TK_ARRAY
else
	yy_column := yy_column + 5
--|#line 71 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 71")
end
last_token := TK_FALSE
end
else
if yy_act = 12 then
	yy_column := yy_column + 4
--|#line 72 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 72")
end
last_token := TK_TRUE
else
	yy_column := yy_column + 5
--|#line 73 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 73")
end
last_token := TK_false
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
	yy_column := yy_column + 4
--|#line 74 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 74")
end
last_token := TK_true
else
	yy_column := yy_column + 1
--|#line 76 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 76")
end
last_token := TK_COMMA
end
else
if yy_act = 16 then
	yy_column := yy_column + 1
--|#line 77 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 77")
end
last_token := TK_COLON
else
	yy_column := yy_column + 1
--|#line 78 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 78")
end
last_token := TK_SEMI_COLON
end
end
end
end
else
if yy_act <= 25 then
if yy_act <= 21 then
if yy_act <= 19 then
if yy_act = 18 then
	yy_column := yy_column + 1
--|#line 79 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 79")
end
last_token := TK_LPAREN
else
	yy_column := yy_column + 1
--|#line 80 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 80")
end
last_token := TK_RPAREN
end
else
if yy_act = 20 then
	yy_column := yy_column + 1
--|#line 81 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 81")
end
last_token := TK_LSBRAC
else
	yy_column := yy_column + 1
--|#line 82 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 82")
end
last_token := TK_RSBRAC
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
	yy_column := yy_column + 1
--|#line 83 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 83")
end
last_token := TK_LABRAC
else
	yy_column := yy_column + 1
--|#line 84 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 84")
end
last_token := TK_RABRAC
end
else
if yy_act = 24 then
	yy_column := yy_column + 1
--|#line 85 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 85")
end
last_token := TK_DQUOTE
else
	yy_column := yy_column + 1
--|#line 86 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 86")
end
last_token := TK_MINUS
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 89 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 89")
end
 -- return a digit token and store the integer value in last_integer_value, which the parser will use
			last_integer_value := text.to_integer
			last_token := NUMBER
		
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 94 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 94")
end

		                 last_real_value := text.to_real
		                 last_token := REAL
        
end
else
if yy_act = 28 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 99 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 99")
end
 -- return an identifier and store the value in last_string_value, which the parser will use
			last_string_value := text
			last_token := IDENT
		
else
	yy_column := yy_column + 3
--|#line 104 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 104")
end

				last_character := text.item(2)
				last_token := CHAR_LIT
			
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
yy_set_line_column
--|#line 109 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 109")
end

				last_string_value := text.substring(2, text.count - 1)
				last_token := STR_LIT
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 114 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 114")
end
-- Ignore comments
end
else
if yy_act = 32 then
	yy_column := yy_column + 1
--|#line 116 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 116")
end
-- DO NOT REMOVE THIS!!!!! 
        -- return the character code for a character, which are reserved tokens that the parser uses
		-- The character code for '+' is a value token and is used by the parser by writing
		-- '+' as a token in a rule
		last_token := text_item (1).code
		
else
yy_set_line_column
--|#line 0 "evt_scanner_def.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'evt_scanner_def.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		once
			Result := yy_fixed_array (<<
			    0,    4,    5,    6,    7,    8,    9,   10,   11,   12,
			   13,    4,   14,   15,   16,   17,   18,   19,   20,   21,
			   22,   23,   23,   24,   23,   23,   25,   23,   23,   23,
			   23,   26,   27,   28,   23,   23,   29,    4,   30,    4,
			   23,   23,   31,   23,   23,   23,   32,   33,   23,   23,
			   34,   34,   34,   34,   36,   40,   41,   50,   36,   34,
			   51,   34,   55,   40,   41,   36,   35,   35,   35,   35,
			   38,   99,   38,   38,   42,   42,   39,   98,   39,   39,
			   97,   96,   95,   94,   93,   92,   37,   91,   90,   89,
			   37,   88,   87,   86,   37,   85,   84,   37,   83,   82,

			   81,   80,   79,   78,   77,   76,   75,   74,   73,   72,
			   71,   70,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   40,   56,   54,   53,   52,
			   49,   48,   47,   46,   45,   44,   43,   39,  100,    3,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    5,    7,    5,    7,    8,   14,   14,   28,   35,   34,
			   28,   34,   37,   41,   41,   55,  101,  101,  101,  101,
			  102,   98,  102,  102,  103,  103,  104,   96,  104,  104,
			   92,   91,   90,   89,   86,   85,    8,   83,   82,   79,
			   35,   78,   77,   75,   37,   73,   72,   55,   71,   70,

			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   54,   53,   52,   51,   50,   49,   48,
			   47,   46,   45,   44,   43,   40,   38,   33,   32,   31,
			   27,   26,   25,   24,   22,   21,   20,   13,    3,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,  138,  139,   48,  139,   49,   49,    0,
			  139,  139,  139,  127,   44,  139,  139,  139,  139,  139,
			  105,  106,  109,    0,  115,  104,  109,   97,   26,  139,
			  139,   89,   79,   82,   57,   53,  139,   57,  120,    0,
			  113,   52,    0,   93,   94,  104,   94,   87,  101,   87,
			   83,   86,   72,   68,   65,   60,  139,   94,   84,   79,
			   77,   86,   80,   80,   83,   77,   57,   55,   60,   65,
			   77,   80,   74,   71,    0,   65,    0,   70,   50,   48,
			    0,    0,   70,   67,    0,   63,   60,    0,    0,   39,
			   54,   48,   49,    0,    0,    0,   55,    0,   40,    0,

			  139,   65,   69,   71,   75, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  100,    1,  100,  100,  100,  100,  100,  101,  102,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  100,
			  100,  103,  103,  103,  100,  101,  100,  101,  100,  104,
			  100,  100,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  101,  100,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,

			    0,  100,  100,  100,  100, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    1,    1,    1,    1,    6,
			    7,    8,    1,    1,    9,   10,   11,    1,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   13,   14,
			   15,    1,   16,   17,    1,   18,   19,   20,   21,   22,
			   23,   24,   25,   26,   21,   21,   27,   21,   28,   29,
			   30,   21,   31,   32,   33,   34,   21,   21,   21,   35,
			   21,   36,   37,   38,    1,   39,    1,   40,   21,   21,

			   21,   41,   42,   21,   21,   21,   21,   21,   43,   44,
			   21,   21,   21,   21,   45,   46,   47,   48,   21,   21,
			   21,   49,   21,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    1,    1,    1,    1,    1,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    4,    1,    1,    1,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   34,   32,    1,    2,    1,   24,   32,
			   18,   19,   15,   25,   26,   16,   17,   22,   23,    2,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   20,
			   21,   28,   28,   28,    1,    0,   30,    0,    0,   31,
			   27,   26,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   30,   29,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,    7,   28,   12,   28,   28,   28,
			   14,   10,   28,   28,   11,   28,   28,    9,   13,   28,
			   28,   28,   28,    8,    3,    4,   28,    6,   28,    5,

			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 139
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 100
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 101
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 33
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 34
			-- End of buffer rule code

	yyLine_used: BOOLEAN = true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make 
		do
			make_compressed_scanner_skeleton
		end

feature -- reset

	reset 
		do
			reset_compressed_scanner_skeleton
		end

end