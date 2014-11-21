note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class INVOICE_INTERFACE
inherit
	COMMAND
	redefine make end

feature {NONE} -- Initialization

	make(a_name: STRING; args: TUPLE; a_container: ABSTRACT_UI_INTERFACE)
		do
			Precursor(a_name,args,a_container)
			routine := agent invoice(?)
			routine.set_operands (args)
			if
				attached {INTEGER} args[1] as order_id
			then
				out := "invoice(" + order_id.out + ")"
			else
				error := True
			end
		end

feature -- routine

	invoice(order_id: INTEGER)
    	deferred
    	end
end
