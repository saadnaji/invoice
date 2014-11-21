note
	description: "Summary description for {TUPLE_ARG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TUPLE_ARG
inherit
	PRIMITIVE_ARG
	redefine
		out
	end
create
	make

feature
	make (v : ARRAY[EVT_ARG])
		do
			value := v
		end

feature -- attributes

	value : ARRAY[EVT_ARG]

feature -- queries

	out : STRING
		local
			i: INTEGER
		do
			create Result.make_empty
			Result.append ("[")
			from
				i := value.lower
			until
				i > value.upper
			loop

				Result.append (value[i].out)
				if i < value.upper then
					Result.append (", ")
				end
				i := i + 1
			end
			Result.append ("]")
		end
end