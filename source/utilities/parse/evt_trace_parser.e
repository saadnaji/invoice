class EVT_TRACE_PARSER 

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


feature {NONE} -- Implementation

	yy_build_parser_tables
			-- Build parser tables.
		do
			yytranslate := yytranslate_template
			yyr1 := yyr1_template
			yytypes1 := yytypes1_template
			yytypes2 := yytypes2_template
			yydefact := yydefact_template
			yydefgoto := yydefgoto_template
			yypact := yypact_template
			yypgoto := yypgoto_template
			yytable := yytable_template
			yycheck := yycheck_template
		end

	yy_create_value_stacks
			-- Create value stacks.
		do
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
			create yyspecial_routines4
			yyvsc4 := yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.make (yyvsc4)
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
			yyvsp6 := -1
			yyvsp7 := -1
			yyvsp8 := -1
			yyvsp9 := -1
			yyvsp10 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
			yyvs4.keep_head (0)
			yyvs5.keep_head (0)
			yyvs6.keep_head (0)
			yyvs7.keep_head (0)
			yyvs8.keep_head (0)
			yyvs9.keep_head (0)
			yyvs10.keep_head (0)
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
				end
				yyspecial_routines1.force (yyvs1, last_detachable_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs2")
					end
					yyvsc2 := yyvsc2 + yyInitial_yyvs_size
					yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
				end
				yyspecial_routines2.force (yyvs2, last_integer_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_real_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_string_value, yyvsp4)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: detachable ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				debug ("GEYACC")
					std.error.put_line ("Resize yyvs1")
				end
				yyvsc1 := yyvsc1 + yyInitial_yyvs_size
				yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
			end
			yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER)
			-- Pop semantic value from stack when in state `yystate'.
		local
			yy_type_id: INTEGER
		do
			yy_type_id := yytypes1.item (yystate)
			inspect yy_type_id
			when 1 then
				yyvsp1 := yyvsp1 - 1
			when 2 then
				yyvsp2 := yyvsp2 - 1
			when 3 then
				yyvsp3 := yyvsp3 - 1
			when 4 then
				yyvsp4 := yyvsp4 - 1
			when 5 then
				yyvsp5 := yyvsp5 - 1
			when 6 then
				yyvsp6 := yyvsp6 - 1
			when 7 then
				yyvsp7 := yyvsp7 - 1
			when 8 then
				yyvsp8 := yyvsp8 - 1
			when 9 then
				yyvsp9 := yyvsp9 - 1
			when 10 then
				yyvsp10 := yyvsp10 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_run_geyacc
			-- You must run geyacc to regenerate this class.
		do
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		local
			yyval1: detachable ANY
			yyval5: ARRAY [TUPLE [name: STRING; args: ARRAY [EVT_ARG]]]
			yyval6: ARRAY [EVT_ARG]
			yyval7: EVT_ARG
			yyval8: PRIMITIVE_ARG
			yyval9: COMPOSITE_ARG
			yyval10: ARRAY [PRIMITIVE_ARG]
		do
				inspect yy_act
when 1 then
--|#line 73 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 73")
end

	  event_trace := yyvs5.item (yyvsp5)
	
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 80 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 80")
end

		  create {ARRAY[TUPLE[name: STRING; args: ARRAY[EVT_ARG]]]} yyval5.make_empty
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp5 := yyvsp5 + 1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 3 then
--|#line 85 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 85")
end

		  yyval5 := yyvs5.item (yyvsp5)
		  yyval5.force([yyvs4.item (yyvsp4), yyvs6.item (yyvsp6)], yyval5.upper + 1)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 4 then
--|#line 90 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 90")
end

		  yyval5 := yyvs5.item (yyvsp5)
		  yyval5.force([yyvs4.item (yyvsp4), <<>>], yyval5.upper + 1)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 5 then
--|#line 97 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 97")
end

		create yyval6.make_empty	
		yyval6.force(yyvs7.item (yyvsp7), yyval6.upper + 1)
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 6 then
--|#line 103 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 103")
end

	    yyval6 := yyvs6.item (yyvsp6) 
	    yyval6.force(yyvs7.item (yyvsp7), yyval6.upper + 1)
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 7 then
--|#line 110 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 110")
end

yyval7 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 8 then
--|#line 112 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 112")
end

yyval7 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 9 then
--|#line 115 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 115")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 10 then
--|#line 117 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 117")
end

	  	create {TUPLE_ARG} yyval8.make(yyvs10.item (yyvsp10))
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 11 then
--|#line 123 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 123")
end

		create {BOOL_ARG} yyval8.make(true) 
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 12 then
--|#line 128 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 128")
end

		create {BOOL_ARG} yyval8.make(false) 
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 13 then
--|#line 132 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 132")
end

		create {BOOL_ARG} yyval8.make(true) 
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 14 then
--|#line 136 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 136")
end

		create {BOOL_ARG} yyval8.make(false) 
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 15 then
--|#line 140 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 140")
end

		create {CHAR_ARG} yyval8.make(last_character)
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 16 then
--|#line 144 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 144")
end

		create {STR_ARG}  yyval8.make(last_string_value) 
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 17 then
--|#line 148 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 148")
end

		create {INT_ARG}  yyval8.make(last_integer_value)  
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 18 then
--|#line 152 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 152")
end

	 	create {INT_ARG}  yyval8.make(-last_integer_value)  
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 19 then
--|#line 156 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 156")
end

		create {REAL_ARG} yyval8.make(last_real_value) 
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 20 then
--|#line 160 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 160")
end

	  	create {REAL_ARG} yyval8.make(-last_real_value) 
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 21 then
--|#line 166 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 166")
end

		create {ARRAY_ARG} yyval9.make(yyvs10.item (yyvsp10)) 
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp10 := yyvsp10 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 22 then
--|#line 173 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 173")
end

create yyval10.make_empty 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp10 := yyvsp10 + 1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 23 then
--|#line 176 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 176")
end

	    yyval10 := <<yyvs8.item (yyvsp8)>>
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 24 then
--|#line 180 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 180")
end

		yyval10 := yyvs10.item (yyvsp10)
		yyval10.force(yyvs8.item (yyvsp8), yyval10.upper + 1)
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp8 := yyvsp8 -1
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 25 then
--|#line 187 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 187")
end

create yyval10.make_empty 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp10 := yyvsp10 + 1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 26 then
--|#line 190 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 190")
end

	    yyval10 := <<yyvs8.item (yyvsp8)>>
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 27 then
--|#line 194 "evt_trace_parser_def.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'evt_trace_parser_def.y' at line 194")
end

		yyval10 := yyvs10.item (yyvsp10)
		yyval10.force(yyvs8.item (yyvsp8), yyval10.upper + 1)
	  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp8 := yyvsp8 -1
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
				else
					debug ("GEYACC")
						std.error.put_string ("Error in parser: unknown rule id: ")
						std.error.put_integer (yy_act)
						std.error.put_new_line
					end
					abort
				end
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 37 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER]
			-- Template for `yytranslate'
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   40,   32,   32,   32,   33,   33,   34,   34,   35,
			   35,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   36,   37,   37,   37,   38,   38,   38, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    5,    4,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    3,    2,    6,    7,    8,    9,    8,
			    3,    2,    1,   10,    8,    1,    1,    8,   10,    1,
			    1,    7,    1,    1,    8,    1,    8,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    1,    4,    0,    0,    0,   25,   14,   13,   12,
			   11,   16,   15,   19,   17,    0,    5,    7,    8,    9,
			   20,   18,   22,    0,   26,    3,    0,   23,    0,   10,
			    0,    6,    0,    0,   27,   21,   24,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    1,   15,   16,   17,   18,   28,   23,   19,   37, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,   36,    0,   -3,    3,   13,   31, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,    5, -32768, -32768, -32768, -32768,
			 -32768, -32768,   14,  -15, -32768, -32768,   -3, -32768,    8, -32768,
			   31, -32768,  -16,   14, -32768, -32768, -32768,   10,    9, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768,   16,  -14, -32768, -32768, -32768,   -4, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   14,   13,   24,   12,   11,   30,   21,   20,   27,   39,
			   38,   29,   35,   10,    9,    8,    7,   14,   13,   36,
			   12,   11,    6,    3,    5,   26,   34,    4,   33,   25,
			   10,    9,    8,    7,   14,   13,   32,   12,   11,    6,
			   22,    2,   31,    0,    4,    0,    0,   10,    9,    8,
			    7,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    4, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    3,    4,    6,    6,    7,   20,    3,    4,   22,    0,
			    0,   26,   28,   16,   17,   18,   19,    3,    4,   33,
			    6,    7,   25,   23,   27,   20,   30,   30,   20,   24,
			   16,   17,   18,   19,    3,    4,   28,    6,    7,   25,
			   27,    5,   26,   -1,   30,   -1,   -1,   16,   17,   18,
			   19,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   30, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [detachable ANY]
			-- Stack for semantic values of type detachable ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [detachable ANY]
			-- Routines that ought to be in SPECIAL [detachable ANY]

	yyvs2: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs3: SPECIAL [REAL]
			-- Stack for semantic values of type REAL

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [REAL]
			-- Routines that ought to be in SPECIAL [REAL]

	yyvs4: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

	yyvs5: SPECIAL [ARRAY [TUPLE [name: STRING; args: ARRAY [EVT_ARG]]]]
			-- Stack for semantic values of type ARRAY [TUPLE [name: STRING; args: ARRAY [EVT_ARG]]]

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [ARRAY [TUPLE [name: STRING; args: ARRAY [EVT_ARG]]]]
			-- Routines that ought to be in SPECIAL [ARRAY [TUPLE [name: STRING; args: ARRAY [EVT_ARG]]]]

	yyvs6: SPECIAL [ARRAY [EVT_ARG]]
			-- Stack for semantic values of type ARRAY [EVT_ARG]

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [ARRAY [EVT_ARG]]
			-- Routines that ought to be in SPECIAL [ARRAY [EVT_ARG]]

	yyvs7: SPECIAL [EVT_ARG]
			-- Stack for semantic values of type EVT_ARG

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [EVT_ARG]
			-- Routines that ought to be in SPECIAL [EVT_ARG]

	yyvs8: SPECIAL [PRIMITIVE_ARG]
			-- Stack for semantic values of type PRIMITIVE_ARG

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [PRIMITIVE_ARG]
			-- Routines that ought to be in SPECIAL [PRIMITIVE_ARG]

	yyvs9: SPECIAL [COMPOSITE_ARG]
			-- Stack for semantic values of type COMPOSITE_ARG

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [COMPOSITE_ARG]
			-- Routines that ought to be in SPECIAL [COMPOSITE_ARG]

	yyvs10: SPECIAL [ARRAY [PRIMITIVE_ARG]]
			-- Stack for semantic values of type ARRAY [PRIMITIVE_ARG]

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [ARRAY [PRIMITIVE_ARG]]
			-- Routines that ought to be in SPECIAL [ARRAY [PRIMITIVE_ARG]]

feature {NONE} -- Constants

	yyFinal: INTEGER = 39
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 32
			-- Number of tokens

	yyLast: INTEGER = 61
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 286
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 41
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- create

	make
			-- Create a new calculator
		do
			last_string_value := ""
			make_parser_skeleton
			make_scanner
			create event_trace.make_empty	
			last_error := ""
		end
		
feature -- access  

	event_trace : ARRAY[TUPLE[name: STRING; args: ARRAY[EVT_ARG]]]
	last_error : STRING

feature -- parsing

	report_error(a_message: STRING)
		do
			last_error := text + " (Line " + line.out + ", " + "Column " + column.out + ")" 
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