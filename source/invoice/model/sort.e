note
	description: "Summary description for {SORT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SORT
create
	make

feature
	make
	do
		create str_array.make (0)
		create stock.make (0)
		create cart.make (0)
		create prod_array.make(0)
	end

sort_strings ( array : ARRAYED_LIST[STRING])
	local
		i , j : INTEGER
		temp : STRING
	do
		str_array := array
		quick_sort_string(1,array.count)
		from
			i := str_array.count ; j := 1
		until
			j > i
		loop
			temp := str_array[j]
			str_array[j] := str_array[i]
			str_array[i] := temp
			i := i - 1
			j := j  + 1
		end

	end



	---------------------------------------------------------

quick_sort_string ( lower_index , upper_index : INTEGER)
	local
		i , j   : INTEGER
		pivot : STRING -- dont come here
		temp : STRING
	do
		i := lower_index
		j := upper_index
		pivot := str_array[(lower_index+(upper_index-lower_index)/2).floor]

		from
			i := i ; j :=j
		until
					not (i <= j)
		loop


			from
				i := i
			until
			      (str_array[i] <= pivot)
			loop

				i := i + 1

			end
--			-------------------

			from
				j := j
			until
			    (str_array[j] >= pivot)
			loop
				j := j  - 1

			end

			if i <= j then
				temp := str_array[i]
				str_array[i] := str_array[j]
				str_array[j] := temp
				i := i +1
				j := j - 1

			end

			if lower_index < j then
				quick_sort_string(lower_index,j)
			end
			if i < upper_index then
				quick_sort_string(i,upper_index)
			end
--		 bigger loop end here


		end

	end


	---------------------------------------------------------------------------------------------
	sort_prod(cart_t : HASH_TABLE[TUPLE[ li_pr:ARRAYED_LIST[PRODUCT]; state :STRING],INTEGER])
	do

		across cart_t.current_keys
		 as c
		loop
			check attached cart_t[c.item] as tuple then
				check attached  tuple.li_pr  as pr_li  then
					sort_prod_arr(pr_li)
				end

			end

		end
	end

	sort_prod_arr ( product : ARRAYED_LIST[PRODUCT])
	local
		i , j   : INTEGER
		pivot : PRODUCT -- dont come here
		temp : PRODUCT
	do
		prod_array := product
		quick_sort_prod(1,product.count)
		from
				i := prod_array.count ; j := 1
			until
				j > i
			loop
				temp := prod_array[j]
				prod_array[j] := prod_array[i]
				prod_array[i] := temp
				i := i - 1
				j := j  + 1
			end

	end

	quick_sort_prod ( lower_index , upper_index : INTEGER)
	local
		i , j   : INTEGER
		pivot : PRODUCT -- prod here
		temp : PRODUCT
	do
		i := lower_index
		j := upper_index
		pivot := prod_array[(lower_index+(upper_index-lower_index)/2).floor]

		from
			i := i ; j :=j
		until
					not (i <= j)
		loop


			from
				i := i
			until
			      (prod_array[i].getproductname <= pivot.getproductname)
			loop

				i := i + 1

			end
--			-------------------

			from
				j := j
			until
			    (prod_array[j].getproductname >= pivot.getproductname)
			loop
				j := j  - 1

			end

			if i <= j then
				temp := prod_array[i]
				prod_array[i] := prod_array[j]
				prod_array[j] := temp
				i := i +1
				j := j - 1

			end

			if lower_index < j then
				quick_sort_prod(lower_index,j)
			end
			if i < upper_index then
				quick_sort_prod(i,upper_index)
			end
--		 bigger loop end here


		end

	end


	----------------------------------------------------------------------------------------------------
	sort_stock ( stock_t : HASH_TABLE[PRODUCT,STRING]) : HASH_TABLE[PRODUCT,STRING]
	local
		temp : STRING
		keys : ARRAY[STRING]

	do
		stock := stock_t
		result := quick_sort_stock -- check here

	end

	quick_sort_stock : HASH_TABLE[PRODUCT,STRING]
	local
		temp : PRODUCT
		keys : ARRAYED_LIST[STRING]
		stock_new : HASH_TABLE[PRODUCT,STRING]

	do
		create keys.make_from_array (stock.current_keys)
		create stock_new.make (0)
		sort_strings(keys)
		across keys as k loop
		check attached stock[k.item] as prod  then
			stock_new.extend (prod, k.item)  end
		end
		Result := stock_new

	end






feature --attribute	
str_array : ARRAYED_LIST[STRING]
prod_array : ARRAYED_LIST[PRODUCT]
stock : HASH_TABLE[PRODUCT,STRING]
cart:  HASH_TABLE[TUPLE[ li_pr:ARRAYED_LIST[PRODUCT]; state :STRING],INTEGER]

end
