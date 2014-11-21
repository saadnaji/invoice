note
	description: "Reading and writing to files."
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	FILE_UTILITY
create
	read_text_from
feature -- attributes
	error: BOOLEAN
	error_string: STRING
	item: STRING

feature{NONE} -- creates

	read_text_from (a_path: STRING)
 			-- read file at `a_path'
 			-- error is false if there are errors reading the file
 			-- item is the text in the file if there are no errors
 			-- error_string is the error condition
		local
			l_file: PLAIN_TEXT_FILE
		do
			create error_string.make_empty
			create item.make_empty
			create l_file.make_with_name (a_path)
				-- Perform checks until we can make
				-- a real attempt to open the file.
			if not l_file.exists then
				error := true
				error_string := "error: '" + a_path + "' does not exist"
			else
				if not l_file.is_readable then
					error := True
					error_string := "error: '" + a_path + "' is not readable"
				else
					l_file.open_read
					l_file.read_stream (l_file.count)
					item := l_file.last_string
					check item /= Void end
					  -- implied by postcondition of `l_file.read_stream'
					l_file.close
				end
			end
		ensure
			error implies item.count = 0 and error_string.count > 0
			not error implies error_string.count = 0
		end


end