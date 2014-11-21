note
	description: "Summary description for {MODEL_ACCESS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	ORDERS_ACCESS

feature
	m: ORDERS
		once
			create Result.make
		end

  wipe_order
  do
  m.wipe
  end

invariant
	m = m
end
