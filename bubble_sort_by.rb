def bubble_sort_by(array)
	
	while (true)
		swapped = false
		x = 0
		while x < array.length - 1
			if yield(array[x],array[x+1]) > 0 #section where block comes into play
				array[x], array[x+1] = array[x+1], array[x] #changes position of each string within array
				swapped = true			
			end
			x += 1 #moves up the array
		end
		if swapped == false #ends program
			break #ends program
		end
	end
	print array 
end	




 bubble_sort_by(["hi","hello","hey"]) { |left, right| left.length - right.length } #block