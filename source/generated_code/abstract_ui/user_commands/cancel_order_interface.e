note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class CANCEL_ORDER_INTERFACE
inherit
	COMMAND
	redefine make end

feature {NONE} -- Initialization

	make(a_name: STRING; args: TUPLE; a_container: ABSTRACT_UI_INTERFACE)
		do
			Precursor(a_name,args,a_container)
			routine := agent cancel_order(?)
			routine.set_operands (args)
			if
				attached {INTEGER} args[1] as order_id
			then
				out := "cancel_order(" + order_id.out + ")"
			else
				error := True
			end
		end

feature -- routine

	cancel_order(order_id: INTEGER)
    	deferred
    	end
end
