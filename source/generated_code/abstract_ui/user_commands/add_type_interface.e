note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class ADD_TYPE_INTERFACE
inherit
	COMMAND
	redefine make end

feature {NONE} -- Initialization

	make(a_name: STRING; args: TUPLE; a_container: ABSTRACT_UI_INTERFACE)
		do
			Precursor(a_name,args,a_container)
			routine := agent add_type(?)
			routine.set_operands (args)
			if
				attached {STRING} args[1] as product_id
			then
				out := "add_type(" + "%"" + product_id.out + "%"" + ")"
			else
				error := True
			end
		end

feature -- routine

	add_type(product_id: STRING)
    	deferred
    	end
end
