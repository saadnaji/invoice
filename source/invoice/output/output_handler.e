note
	description: "Summary description for {OUTPUT_HANDLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OUTPUT_HANDLER
inherit
	OUTPUT_HANDLER_INTERFACE
	redefine
		make, log_command
	end
create
	make

feature {NONE} -- Initialization

	make
		-- Initialization for `Current'.
	local
		m_access : ORDERS_ACCESS
	do
		Precursor
		-- may also override the string 'initial_state'
		model := m_access.m
	end

feature -- queries

	model : ORDERS

	model_state : STRING
		do
			Result := model.out + "%N"
		end

	initial_state : STRING
	local
		do

			Result := model.out
--			Result := ""
		end

feature -- Log to 'output'

	log_command (a_cmd: COMMAND)
			-- Log the effect of 'a_cmd' to 'output'
		local
			l_command_name: STRING
		do
			l_command_name := "->" + a_cmd.out + "%N"
			if a_cmd.message.count = 0 then
--				io.put_string ("IF helloooooooooooooooooooo")
--				output := output + l_command_name
					io.put_string (l_command_name)
					io.put_string (model_state)
				-- also append model state to 'output'
--				output.append (model_state)
			else
--				io.put_string ("helloooooooooooooooooooo")
				output := output + l_command_name + " " + a_cmd.message
			end
		end
end
