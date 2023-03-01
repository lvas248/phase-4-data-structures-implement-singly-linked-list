require 'pry'
require_relative './node'

class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        if self.head.nil?
            self.head = node
        else
            node.next_node = self.head
            self.head = node
        end
    end

    def append(node)
        #case: head does not exist
        #case: one node in list
        #case: multiple nodes in list
        if self.head.nil?
            self.head = node
        elsif self.head.next_node.nil?
            self.head.next_node = node
        else
            last_node = self.head
            while !last_node.next_node.nil?
                last_node = last_node.next_node
            end
            last_node.next_node = node
        end
    end

    def delete_head

        if !self.head.nil?
            if self.head.next_node.nil?
                self.head = nil
            else
                self.head = self.head.next_node
            end
        end
    end

    def delete_tail
        if !self.head.nil?

            if self.head.next_node.nil?
                self.head = nil
            else
                second_to_last_node = self.head
                while !second_to_last_node.next_node.next_node.nil?
                    second_to_last_node = second_to_last_node.next_node
                end
                second_to_last_node.next_node = nil
            end
        end
    end

    def add_after(index, node)
        if !self.head.nil?
            curr = self.head
            index.times do
                if(!curr.next_node.nil?)
                    curr = curr.next_node
                end
            end
            if !curr.next_node.nil?
                node.next_node = curr.next_node
                curr.next_node = node
            else
                curr.next_node = node
            end
        end
    end

end


a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')

list = LinkedList.new

list.append(a)
list.append(b)
list.append(c)
list.append(d)

binding.pry