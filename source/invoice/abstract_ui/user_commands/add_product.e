note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ADD_PRODUCT

inherit

	ADD_PRODUCT_INTERFACE
		redefine
			add_product
		end

create
	make

feature

	add_product (a_product: STRING; quantity: INTEGER)
		do
				-- perform some update on the model state
			if quantity > 0 then
				a_product.to_lower
				if orders.types.has (a_product) then
					if not a_product.is_empty then
						orders.alert_msg("ok")
						orders.add_product (a_product, quantity)
					else
						orders.alert_msg( "product not in database")
						message := orders.out
					end
				else
					orders.alert_msg( "product not in database")
					message := orders.out
				end
			else
				orders.alert_msg("quantity added must be positive")
				message := orders.out
			end
			container.on_change.notify ([Current])
		end

end
