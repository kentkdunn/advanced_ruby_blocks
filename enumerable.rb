module Enumerable

	def my_each
	    i = 0
	    while i < self.length
	      yield self[i]
	      i += 1
	    end
  	end



	def my_each_with_index
		i = 0
		while i < self.length
			yield self[i], i
			i +=1
		end
	end



	def my_select
		select = []
		for i in self
			select << i if yield(i)
		end
		select
	end



	def my_all?
		for i in self
			return false unless yield(i)
		end
		true
	end



	def my_any?
		for i in self
			return true if yield(i)
		end
		return false
		return true if self != nil
		false
	end



	def my_none?
    	for i in self
      		if block_given?
        		return false if yield(i)
      		else
        		return false if i != nil && i != false
      		end
    	end
    	true
  	end



  	def my_count &block
		count = 0
		if block_given?
			self.my_each {|i| count +=1 if yield i}
		else		
			self.my_each {|i| count +=1}			
		end
		count
	end



	def my_map
	    result = []
	    each do |item|
	      result << yield(item)
	    end
	    result
  	end

  	def my_map_proc_block(proc = nil)
		array = []
		if proc
			my_each{|i| array.push(proc.call(i))}
		elsif block_given?
			my_each{|i| array.push(yield(i))}
		else
			return self.to_enum
		end
		array
	end



  	def my_inject(initial=nil)
	    acc = initial
	    my_each do |item|
	      if acc.nil?
	        acc = item
	      else
	        acc = yield(acc, item)
	      end
	    end
	    acc
  	end


	def multiply_els
  		self.my_inject{ |x, y| x * y }
	end




end

=begin
[1,2,3,4,5].my_each {|x| puts x}
[1,2,3,4,5].my_each_with_index {|x,y| puts "#{y}" + " item is: " + "#{x}"}
puts [1,2,3,4,5].my_select {|x| x < 4}
p [1,2,3,4,5].my_all? {|x| x > 0}
p [1,2,3,4,5].my_any? {|x| x > 5}
p ["hi", "what", "huh"].my_none? {|x| x.length == 10}
p [1,2,3,4,5].my_count
puts [1,2,3].my_map {|y| y*2}
p [1,2,3,4,5].my_inject {|y, x| y + x}
puts [20,2].multiply_els

=end
