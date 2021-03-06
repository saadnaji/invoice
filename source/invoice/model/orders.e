note
	description: "Summary description for {MODEL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ORDERS

inherit
	ANY
	redefine out end

create {ORDERS_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			create cart.make (10000)
			create types.make(10000)
			create stock.make(10000)
			create unordered_id.make(10000)
			create order_id.make
			create sort.make
			string_msg := "ok"
			init := false
			cart.compare_objects
			types.compare_objects
			stock.compare_objects

		end

feature -- commands

	add_type(type :STRING)
		require
			string_not_empty : not type.is_empty
			not_in_db : not types.has (to_lower_s(type))
		do
			types.extend (type)
			sort.sort_strings (types)
		ensure
			size_in:types.count = old types.count + 1
			added: types.has (to_lower_s(type))

		end


	add_product(a_product:STRING; quantity:INTEGER)
		require
			string_not_empty : not a_product.is_empty
			in_db : types.has (to_lower_s(a_product))
			quan_pos_not_zer : quantity > 0
		do
			a_product.to_lower
			if stock.has (a_product) then
				check attached 	stock[a_product] as prod then
				prod.add_stock (quantity)
				end
			else
				stock.force (create {PRODUCT}.make (to_lower_s(a_product),quantity),to_lower_s(a_product))
			end

		ensure
			stock.has(to_lower_s(a_product)) implies (stock.count = old stock.count + 1 or
			(attached stock[to_lower_s(a_product)]as prod implies prod.is_equal (create {PRODUCT}.make (to_lower_s(a_product),quantity)))) --might not work


		end
	add_order(a_array:ARRAY[TUPLE[p_id:STRING;quantity:INTEGER]])
	require
		a_array.for_all (agent order_prd_exists(?))
		a_array.for_all (agent not_exceed_quan(?))
		a_array.for_all (agent order_quantity_pos(?))
		array_not_empty : not a_array.is_empty
		no_dup_orders : no_duplicate_orders(a_array)
		not_no_more_id :  not order_id.no_more_id
	local
		prod_arr : ARRAYED_LIST[PRODUCT]
	do

		across a_array as  a loop
			check attached stock[a.item.p_id] as r  then
				r.deduct_stock (a.item.quantity)
				if r.is_zero then -- new thing added , if prod quan is zero then remove it from stock
					stock.remove (a.item.p_id)
				end
			end
		end
		create prod_arr.make (a_array.count)
		across a_array as  a loop prod_arr.extend (create {PRODUCT}.make_from_tuple(a.item)) end
		cart.extend ([prod_arr,"pending"],order_id.generate_id)
		-- add unordered id
		unordered_id.extend (order_id.get_orderid)

	ensure
		order_added : cart.count = old cart.count + 1
--		stocks_dec : across a_array as  a some  i  attached stock[a.item.p_id] as r implies  r.getQuantity = old r.getQuantity - a.item.quantity  end

	end

	invoice( id : INTEGER)

	require
		present_in_cart: cart.has (id)
		not_invoiced : attached cart[id] as t implies not t.state.is_equal ("invoiced")
	do
		check  attached cart[id] as tuple then
			tuple.state := "invoiced"
		end

	ensure
		attached cart[id] as t implies  t.state.is_equal ("invoiced")
	end

	cancel_order(id : INTEGER)
	require
		present_in_cart: cart.has (id)
	do
		check  attached cart[id] as tuple then -- check if tuple is attached
			across tuple.li_pr as a  loop -- loop over the product list
					if stock.has (a.item.getProductName) then
						check attached 	stock[a.item.getProductName] as p_stock then -- check if the product in stock aka inventory is attached
							p_stock.add_stock (a.item.getquantity)
						end
					else
						stock.extend (a.item,a.item.getProductName)
					end

			end
		end
		cart.remove (id) -- remove from cart so now id along with its order are removed
		order_id.add_to_list (id) -- add to the id list so that it can be re used again
		---------- remove also from unordered lisr
		unordered_id := remove_from_unordered ( id , unordered_id)
	ensure
		id_removed : not cart.has (id)
	end
feature -- queries
	out : STRING
		do
			----------sort--------------
			stock := sort.sort_stock (stock) -- check here
			sort.sort_prod (cart)
			------------------------------------------------
			io.put_string ("  report:      " + string_msg + "%N")
			io.put_string ("  id:          ")
			io.put_string (order_id.get_OrderID.out)
			io.put_new_line
			io.put_string ("  products:   ")
			types_out
			io.put_new_line
			io.put_string ("  stock:       ")
			stock_out
			io.put_new_line
			io.put_string ("  orders:      ")
			orders_out
			io.put_new_line
			io.put_string ("  carts:       ")
			carts_out
			io.put_new_line
			io.put_string ("  order_state: ")
			order_state_out

			if not init then
				io.put_new_line
			end
			init := true
			Result := ""



		end

   wipe
   do

   end

   alert_msg( str : STRING)
   do
		string_msg := str
	ensure
		string_msg ~ str
   end

   types_out
   	local
   		i : INTEGER
   		do

   			if not types.is_empty then
   				io.put_string (" ")
   				from
   					i := 1
   				until
   					i  > types.count -1
   				loop
   					io.put_string (types[i].out +",")
   					i := i + 1
   				end
   			io.put_string (types[types.count])
   			end
   		end

   stock_out
   local
   		i : INTEGER
   		array : ARRAY[STRING]
   		do

   			if not stock.is_empty then
   				array := stock.current_keys
   				from
   					i := array.lower
   				until
   					i > array.count - 1
   				loop
   					check attached stock[array[i]]as value then
   							io.put_string ( value.out +",")
   				 	end
   				i := i + 1
   				end
   				check attached stock[array[array.count]] as last_val then
							io.put_string ( last_val.out)

   			end
   			end

   		end
   	orders_out
   		local
   			i : INTEGER
   			keys : ARRAY[INTEGER]
   		do

   			if not cart.is_empty then
				from
					i := 1
				until
					i > unordered_id.count - 1
				loop

					io.put_string (unordered_id.at(i).out + ",")
					i := i + 1
				end

				io.put_string (unordered_id.at(unordered_id.count).out)
   			end


   		end

   	carts_out
   		local
   			i: INTEGER
   			keys : ARRAY[INTEGER]
   			cursor : like cart.new_cursor
   		do

   			if not cart.is_empty then

   				from
   					i := 1

   				until
   					i > unordered_id.count

   				loop

						io.put_string (unordered_id.at (i).out + ": ")
   					check attached cart[unordered_id.at (i)] as tuple then	-- this visits and check if tuple is attached
   						check attached tuple.li_pr as pr_li then -- this check if list of products is attached
   							if pr_li.count > 1 then
									across 1 |..| (pr_li.count-1) as  j loop  io.put_string (pr_li.at(j.item).out +",")   end -- concat all the products for this key	
   							end


							io.put_string (pr_li.last.out)
   						end

   					end
   					if  i  <  unordered_id.count then

   						io.put_string ("%N               ")
   					end


   					i := i + 1
   				end


   		  end

   		end
   	order_state_out
   	 	local
   			i: INTEGER
   			keys : ARRAY[INTEGER]
   		do

   			if not  cart.is_empty  then
   				from
   					i := 1
   				until
   					i >  unordered_id.count - 1
   				loop
					check attached  cart[ unordered_id.at (i)] as tuple then
						io.put_string ( unordered_id.at (i).out + "->" + tuple.state +",")
					end
					i := i + 1
   				end
   				check attached cart[ unordered_id.at (unordered_id.count)] as last_tuple then -- cart's last tuple

   						io.put_string ( unordered_id.at (unordered_id.count).out + "->" +last_tuple.state)
   				end
   			end
   		end


feature -- extra routines
	to_lower_s (str : STRING) : STRING
	do
		str.to_lower
		Result := str

	end
	stock_product (a_product: STRING): PRODUCT
			-- return attached PRODUCT
		require
			stock.has (	to_lower_s(a_product))
		do
			check attached stock [to_lower_s(a_product)] as a then
				Result := a
			end
		ensure
			attached   stock [to_lower_s(a_product)] as prod implies Result = prod
		end

feature -- helpers routines
		order_prd_exists(t: TUPLE[ p_id:STRING; quantity:INTEGER]): BOOLEAN
			-- check if the tuple exists
		do
				Result := stock.has (to_lower_s(t.p_id))

		end

		not_exceed_quan(t: TUPLE[ p_id:STRING; quantity:INTEGER]): BOOLEAN
				-- check if the tuple exists in stock and the quantity of  will not be negative after tuple's quantity is being dedcuted from it
			do
				Result := false
				check attached stock.at (to_lower_s(t.p_id)) as product  then
					Result :=   ( product.getQuantity - t.quantity ) >= 0
				end

			end
		order_quantity_pos(t: TUPLE[ p_id:STRING; quantity:INTEGER]): BOOLEAN
			-- check if the quantity is positive
		do
				Result :=  t.quantity > 0
			ensure
				Result = (t.quantity > 0)
		end

	 no_duplicate_orders (a_array:ARRAY[TUPLE[p_id:STRING;quantity:INTEGER]] ) : BOOLEAN
	 	-- return true if products is duplicate
	 require
	 	not_empty: not a_array.is_empty
	 local
	 	i, j : INTEGER
	 do
	 	from
	 		i := 1 ; result := false
	 	until
	 		i >  a_array.count -1 or result
	 	loop
	 		from
	 			j := i + 1
	 		until
	 			j > a_array.count or result
	 		loop
	 			a_array[i].p_id.to_lower
	 			a_array[j].p_id.to_lower
	 			Result := a_array[i].p_id.is_equal (a_array[j].p_id)
				j := j + 1
	 		end
	 		i := i + 1
	 	end

	 end

	 remove_from_unordered ( id : INTEGER ; un_id : ARRAYED_LIST[INTEGER]) : ARRAYED_LIST[INTEGER]
	 require
	 	un_id.has (id)
	 local
	 	i : INTEGER
	 	temp : ARRAYED_LIST[INTEGER]
	 do
	 	create temp.make (10000)
	 	from
	 		i := 1
	 	until
	 		i > un_id.count
	 	loop
			if not (un_id.at (i) = id) then
				temp.extend (un_id.at (i))
			end

			i:= i+1

	 	end
			Result := temp
	ensure
		not result.has (id)
		result.count = un_id.count - 1
	 end

--		not_duplicate
feature -- class helpers
order_id : ORDER_ID
string_msg : STRING
sort : SORT
feature --attribtes
cart:  HASH_TABLE[TUPLE[ li_pr:ARRAYED_LIST[PRODUCT]; state :STRING],INTEGER]
unordered_id : ARRAYED_LIST[INTEGER]
types : ARRAYED_LIST[STRING]
stock : HASH_TABLE[PRODUCT,STRING]
init : BOOLEAN


end
