note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class NOTHING
inherit
	NOTHING_INTERFACE
	redefine nothing end
create
	make

feature
	nothing
    	do
--			io.put_string (orders.out)
			container.on_change.notify ([Current])
    	end

end
