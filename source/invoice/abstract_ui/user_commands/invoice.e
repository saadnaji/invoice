note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INVOICE

inherit

	INVOICE_INTERFACE
		redefine
			invoice
		end

create
	make

feature

	invoice (order_id: INTEGER)
		do
				-- perform some update on the model state
			if orders.cart.has (order_id) then
				if attached orders.cart [order_id] as t then
					if not t.state.is_equal ("invoiced") then
						orders.alert_msg("ok")
						orders.invoice (order_id)
					else
						orders.alert_msg("order already invoiced")
--						message := orders.out
					end
				else
					orders.alert_msg("order already invoiced")
--					message := orders.out
				end
			else
				orders.alert_msg("order id is not valid")
--				message := orders.out
			end
			container.on_change.notify ([Current])
		end

end
