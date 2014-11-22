note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ADD_ORDER

inherit

	ADD_ORDER_INTERFACE
		redefine
			add_order
		end

create
	make

feature

	add_order (a_order: ARRAY [TUPLE [pid: STRING; no: INTEGER]])
		do
			if orders.order_id.get_orderid <= 10000 then
				if not a_order.is_empty then
					if a_order.for_all (agent orders.order_quantity_pos(?)) then
						if a_order.for_all (agent orders.order_prd_exists(?)) then -- prod
							if not orders.no_duplicate_orders (a_order) then
								if a_order.for_all (agent orders.not_exceed_quan(?)) then -- not exceed quantity
									orders.alert_msg("ok")
									orders.add_order (a_order)
								else
									orders.alert_msg("not enough in stock")
--									message := orders.out
								end
							else
								orders.alert_msg( "duplicate products in order array")
--								message := orders.out
							end
						else
							if  a_order.for_all (agent prd_name_exists(?)) then
								orders.alert_msg("not enough in stock")
							else
								orders.alert_msg("some products in order not valid")
							end

--							message := orders.out
						end
					else
						orders.alert_msg( "quantity added must be positive")
--						message := orders.out
					end
				else
					orders.alert_msg( "cart must be non-empty")
--					message := orders.out
				end
			else
				orders.alert_msg( "no more order ids left")
--				message := orders.out
			end
			container.on_change.notify ([Current])
		end
	prd_name_exists(t: TUPLE[ p_id:STRING; quantity:INTEGER]): BOOLEAN
			-- check if the product name exists in db even though it has no product object
		do
				t.p_id.to_lower
				Result := orders.types.has (t.p_id)

		end
end
