require 'open-uri'
require_relative 'binary_tree'

class LinkTree < BinaryTree
	def initialize
	super
	@fname = "sdf"
	end
	
	def save(file_name = @fname)
	a = @node_zero.to_s
	File.open("#{file_name}.txt","w"){|f|f.puts a}
	end
	
	def insert_links (url , depth, node = @node_zero)

		if depth != 0 && url

	
	openurl = open(url) 

	stak = openurl.read 
		openurl.close
		stak = stak.scan (/<a href=["'](http:\/\/.*?)["']/)
		stak.flatten!

		
			stak.each do|link|
				unless node.include?(link)
					node.insert(link.length, link)
					insert_links(link, depth-1, node)
				end
			end
		end
	end
	end
	
	

a = LinkTree.new
n = gets
a.insert_links(n,3)
puts a
n = gets
a.save()