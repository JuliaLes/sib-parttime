# for the numbers 1-100 print fiz for every multiple of 3. 
# print bang for every multiple of 5 
# print fizbang for every multiple of 3 and 5


def fizbang

	for i in 1..100

		if (i % 3 == 0) && (i % 5 == 0) # or could do i % 15 == 0
			puts "fizbang"
		elsif i % 3 == 0
			puts "fiz"
		elsif i % 5 == 0
			puts "bang"
		else
			puts ""
		end

	end
end