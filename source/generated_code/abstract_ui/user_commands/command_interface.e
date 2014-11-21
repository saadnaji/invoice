note
	description: "Summary description for {COMMAND_INTERFACE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COMMAND_INTERFACE
	inherit
		ANY
		redefine out end

feature {NONE}
	make(a_name: STRING; a_args: TUPLE; a_container: ABSTRACT_UI_INTERFACE)
		do
			create message.make_empty
			name := a_name
			container := a_container
			out := ""
		end

feature -- attributes

	message: STRING

	container: ABSTRACT_UI_INTERFACE
		--allows a command to be observable
		-- container.on_change.notify ([Current])

	routine: ROUTINE[ANY, TUPLE]

	name: STRING

	out : STRING

	error: BOOLEAN

	debug_output: STRING
		do
			Result := out
		end

feature {NONE} -- queries

	array_arg_out (arg: ARRAY[ANY]): STRING
		local
			i : INTEGER
		do
			from
				create Result.make_empty
				Result.append ("<<")
				i := arg.lower
			until
				i > arg.upper
			loop
				if attached {TUPLE} arg[i] as tup then
					Result.append (tuple_arg_out (tup))
				else
					Result.append (quote(arg[i]))
				end

				if i < arg.upper then
					Result.append (", ")
				end
				i := i + 1
			end
			Result.append (">>")
		end

	tuple_arg_out (arg: TUPLE): STRING
		local
			i : INTEGER
		do
			from
				create Result.make_empty
				Result.append ("[")
				i := 1
			until
				i > arg.count
			loop
				if attached {ANY} arg[i] as arg_val then
					Result.append (quote(arg_val))
				else
					Result.append ("")
				end

				if i < arg.upper then
					Result.append (", ")
				end
				i := i + 1
			end
			Result.append ("]")
		end

	quote(v: ANY): STRING
		do
			create Result.make_empty
			if attached {STRING} v then
				Result.append ("%"" + v.out + "%"")
			elseif attached {CHARACTER} v then
				Result.append ("'" + v.out + "'")
			else
				Result.append (v.out)
			end
		end
end