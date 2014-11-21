note
	description: "Summary description for {PRODUCT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PRODUCT
	inherit ANY
	redefine is_equal , out end

create
	make,
	make_from_tuple
feature -- make

	make ( prod_id : STRING ; quantity: INTEGER)
	require
		positive_quan: quantity >= 0
		string_not_empty : not prod_id.is_empty
		prod_id_not_void : prod_id /= void
	do
		create product.default_create
		prod_id.to_lower
		product := [prod_id,quantity]
	ensure
		product.is_equal ([prod_id,quantity])
	end

	make_from_tuple (t :TUPLE[p_id: STRING; quantity : INTEGER])
	require
		not_empty : not t.is_empty
	do
		make(t.p_id,t.quantity)
	end

	is_equal (other : like current) :  BOOLEAN
		-- check if the product are equal
		-- equal means that name and the quantity are exactly the same
	 do
	 	Result := false
	 	if attached product.prod as str  and attached other.product.prod as str_2  then
	 		Result := str.is_equal(str_2) and getQuantity.is_equal (other.getquantity)
	 	end
	end

	same_product (other : like current) :  BOOLEAN
		-- check if the product is the same
		-- same means that the product name matched but quantity might not
	 do
	 	Result := false
	 	if attached product.prod as str  and attached other.product.prod as str_2  then
	 		Result := str.is_equal(str_2)
	 	end
	end

	deduct_stock(amount: INTEGER)
	require
		stock_not_empty : product.quan - amount >= 0
	do
			product.quan := product.quan - amount
		ensure
			product.quan = old 	product.quan - amount

	end

	add_stock(amount: INTEGER)
	require
		amount_positive :amount >= 0
	do
			product.quan := product.quan + amount
		ensure
			product.quan = old 	product.quan + amount

	end

	is_zero : BOOLEAN
	do
		Result := product.quan = 0
	ensure
		Result = product.quan.is_equal (0)
	end

	getQuantity : INTEGER
	do
		Result := product.quan.twin
	ensure
		Result = product.quan.twin
	end

	getProductName : STRING
	do
		Result := product.prod.twin
	ensure
		Result = product.prod.twin
	end

	out : STRING
	do
		Result := product.prod + "->" + product.quan.out
	end

feature -- attributes

	product : TUPLE[prod : STRING; quan:INTEGER]

invariant
	getQuantity >= 0 and not getProductName.is_empty
end
