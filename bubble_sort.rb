def bubble_sort(array)

	while(true)

	swapped = false
	
		(array.length-1).times do |x|
			if array[x] > array[x +1] #checks to see if number is greater or less than number to the right
				array[x], array[x+1] = array[x+1], array[x] #swaps numbers in array if number on left is larger
				swapped = true
			end
		end

		if swapped == false
			break #ends program
		end
	end
	print array
end

bubble_sort([1,3,2,4,5]) #array input

