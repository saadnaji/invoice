note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CANCEL_ORDER

inherit

	CANCEL_ORDER_INTERFACE
		redefine
			cancel_order
		end

create
	make

feature

	cancel_order (order_id: INTEGER)
		do
			if orders.cart.has (order_id) then
				orders.alert_msg("ok")
				orders.cancel_order (order_id)
			else
				orders.alert_msg("order id is not valid")
--				message := orders.out
			end
			container.on_change.notify ([Current])
		end

end
