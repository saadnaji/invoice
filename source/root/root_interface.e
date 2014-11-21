note
	description : "root class"
	date        : "$Date$"
	revision    : "$Revision$"
deferred class
	ROOT_INTERFACE
inherit
	ARGUMENTS

feature {NONE} -- init

	debug_mode : BOOLEAN = false

	make
		-- initialise and execute commands
	  local
		flag, msg, cmd: STRING
		input_path: STRING
	  do
	  	create exec_log.make_empty

	  	if debug_mode then
			handle_interactive_mode
	  	else

		cmd  := argument_array[0]

		-- ===================================================
		if argument_count >= 1 and argument_count <= 2 then
		  flag := argument_array[1]
		  -- %%%%%%%%%%%%%% Help Mode %%%%%%%%%%%%%%%%%%
		  if flag ~ "-help"  and argument_count = 1 then
		    msg := usage_msg (cmd)

		  -- %%%%%%%%%%%% Interactive Mode %%%%%%%%%%%%%
		  elseif flag ~ "-i" and argument_count = 1 then
		    msg := ""
		    is_init := true
		    handle_interactive_mode

		  -- %%%%%%%%%%%%%%%% Batch Mode %%%%%%%%%%%%%%%%
		  elseif flag ~ "-b" and argument_count = 2 then
		  	input_path := argument_array[2]
		  	is_init := true
			msg := handle_batch_mode (input_path)

		  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		  else
		    msg := invalid_flag_msg_or_num_args (flag) + "%N"
		    msg.append (ref_msg (cmd))
		  end
		  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		-- ===================================================
		else
		  msg := wrong_num_args_msg + "%N"
		  msg.append (ref_msg (cmd))
		end
		-- ===================================================
		if NOT msg.is_empty then
			io.print (msg)
			if NOT (msg[msg.count] = '%N') then
			io.print ("%N")
		end
		end
		end
	end

feature {NONE} -- queries

    wrong_defns_file_chosen_msg : STRING =
      	"Application quit: please choose the right file with event declaratons"

	ref_msg (cmd: STRING) : STRING
		do
			Result := "Run '" + cmd + " -help' to see more details"
		end

	invalid_flag_msg_or_num_args (f: STRING): STRING
		do
			Result := "Error: either " + f + " is not a valid option, or " +
					f + " is not specified with the correct number of arguments"
		end

	usage_msg (cmd: STRING) : STRING
		do
			Result :=
				"The executable " + cmd + " may be invoked as: %N" +
				"%T" + cmd + " -help %N" +
				"%T" + cmd + " -i %N" +
				"%T" + cmd + " -b input.txt %N" +
				"where %N" +
				" ====================================%N" +
				"  Option %N" +
				"    -i  interactive mode: read the event trace from console %N" +
				"    -b  batch mode: read the event trace from file 'input.txt' %N" +
				" ===================================="
	end

	wrong_num_args_msg: STRING
		do
			Result := "Error: wrong number of arguments"
		end

feature {NONE} -- attributes

	-- used in both interactive and batch mode, making sure
	-- 'init' is displayed only once	
	is_init : BOOLEAN

	interactive_mode : STRING = "interactive"
	batch_mode 		 : STRING = "batch"

	exec_log : STRING

feature {NONE} -- procedures

	handle_interactive_mode
	  local
	    user_input: STRING
	    to_quit: BOOLEAN
	    prompt : STRING
	  do
	  -- ===========================================
	  -- check 1: 'defns' file exists
	    prompt := "Enter an event, 'man' for the list of declared events, or 'quit' to terminate... %N"
	    from
	  	  to_quit := false
	    until
	  	  to_quit
	    loop
		  io.print (prompt)
		  io.read_line
		  user_input := io.last_string

		  if user_input ~ "quit" then
		    to_quit := true
		  elseif user_input ~ "man" then
		  	io.print (man_page + "%N")
		  else
			-- tasks of syntax check and event type validation
	      	-- are delegated to 'sys : SOFTWARE_OPERATION'
	      	exec (user_input, interactive_mode)
	      	io.print (exec_log)
	  	  end
	  	end
	end

	handle_batch_mode (input_path: STRING): STRING
	  local
	    input_file: FILE_UTILITY
	  do
		  create Result.make_empty
		  -- ===========================================
		  -- check 1: 'input' file exists and is readable
		  create input_file.read_text_from (input_path)

		  if NOT input_file.error then
	      	-- tasks of syntax check and event type validation
	      	-- are delegated to 'sys : SOFTWARE_OPERATION'
		    exec (input_file.item, batch_mode)
		    Result := exec_log
		  else
		    Result := input_file.error_string
		  end
	  end

	exec (input_cmds: STRING; mode: STRING)
			-- Log the execution of 'input_cmds' to 'exec_log'.
		require
			mode ~ interactive_mode or mode ~ batch_mode
		local
			sys : SOFTWARE_OPERATION
		do
			create sys.make
		    sys.execute (input_cmds, is_init)

		    if sys.error then
		      exec_log := sys.output.error_message + "%N"
		    else
		      exec_log := sys.output.output
		      is_init := false
		    end
		end

	man_page : STRING = "[
  nothing
  add_type(product_id: STRING)
  add_product(a_product: STRING ; quantity: INTEGER)
  add_order(a_order: ARRAY[TUPLE[pid: STRING; no: INTEGER]])
  invoice(order_id: INTEGER)
  cancel_order(order_id: INTEGER)
]"
 end