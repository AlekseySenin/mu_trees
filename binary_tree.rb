class BinaryTree
	attr_accessor :node_zero
	def initialize(val = nil)
	@node_zero = Node.new(val)
	end
	def insert(val, cont=nil)
		@node_zero.insert(val, cont)
	end
	
	def search(val, arg = val)
		if @node_zero.include?(arg)
			true
		else
			node_zero.search(val, arg )
		end
	end
	
	def walk
		walker = @node_zero.walk
		walker
	end
	
	def to_s
	"#{@node_zero}"
	end
	
	
	class Node
		attr_accessor :value, :lnode, :rnode, :walker
		def initialize(value = nil, content = nil)
			@value = value
			@content = content
			@lnode = nil
			@rnode = nil
		end
		def include?(arg)
		 arg == @value||arg == @content
		end

	def insert(new_val, new_cont)
		unless  @value
			@value = new_val
		else
			if  @value > new_val
				unless @lnode
					@lnode =Node.new(new_val, new_cont) 
				else
					@lnode.insert(new_val, new_cont) 
				end
		elsif @value <= new_val
			unless @rnode
				@rnode =Node.new(new_val, new_cont)
			else
				@rnode.insert(new_val, new_cont) 
			end
		end
		end
	end
		
		def search(val, arg)
			if @value > val && lnode != nil
				if lnode.include?(arg)
					 true
				else
					lnode.search(val, arg)
				end
			elsif @value<= val && rnode != nil
				if rnode.include?(arg)
					 true
				else
					rnode.search(val, arg)
				end
			else
				false
			end
		end
		
		def to_s
			"#{@content}\n#{@lnode}#{@rnode}"
		end
	
		def walk
		walker = []
		walker += lnode.walk if lnode
		walker << @value
		walker +=rnode.walk if rnode
		walker
		end
	
	end
end
=begin
a = BinaryTree.new

50.times {a.insert(rand(1-100)	)}
p a.search(10)
p a.search(3)
p a.search(50)
p a.walk
b = a.to_s
puts b
=end