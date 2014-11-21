note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ADD_TYPE

inherit

	ADD_TYPE_INTERFACE
		redefine
			add_type
		end

create
	make

feature

	add_type (product_id: STRING)
		do
			if not product_id.is_empty then
				if not orders.types.has (orders.to_lower_s (product_id)) then
					orders.alert_msg("ok")
					orders.add_type (product_id)
				else
					orders.alert_msg("product type already in database")
					message := orders.out
				end
			else
				orders.alert_msg("product type must be non-empty string")
				message := orders.out
			end
			container.on_change.notify ([Current])
		end

end
