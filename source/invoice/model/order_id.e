note
	description: "Summary description for {ORDER_ID}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

 class
	ORDER_ID

create
	make
feature {NONE} -- make
	make
	do
		counter := 0
		id := 0
		create available.make
		available.compare_objects
	end
feature
	generate_id : INTEGER
	require
		not_max : counter <= 10000
	do
		if(available.is_empty) then
			counter := counter + 1
			id := counter
			Result := id
		else
			id := available.last
			remove_tail
			Result := id
		end
	ensure
		available.is_empty implies Result = id or not available.has (Result)
		not available.is_empty implies Result /= id
		id <= 10000
	end

	add_to_list(order_id : INTEGER)
	require
		greater_than_zero: order_id >= 0
		not_in_list : not available.has (order_id)
	do
		available.put_front (order_id)
	ensure
		is_in_list : available.has (order_id)
	end

	get_OrderID : INTEGER
	do
		Result := id.twin
	ensure
		Result ~ id.twin
	end

feature  -- added routines for extended list functionality

	remove_tail
	require
		list_not_empty : not available.is_empty
	do
		available.finish
		available.remove
		available.start
	ensure
		not_in_list : available.count = old  available.count - 1
	end
feature -- attributes
counter : INTEGER
available : LINKED_LIST[INTEGER]
id : INTEGER
invariant
	id >= 0 and id <= 10000

end
