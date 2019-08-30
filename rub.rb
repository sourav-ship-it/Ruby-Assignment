#!/usr/bin/ruby
require 'json'
require 'rubygems'

input = File.read("./text.txt")

obj=JSON.parse(input)

ob1 = JSON.pretty_generate(obj)
puts ob1
puts "Enter the JSON path: "
search=gets.chomp
condition=true
if(search=='.')
    puts ob1
else
    search1=search.split('.')
    search1.each do |i|
        if !(obj.is_a?(Hash) and obj.keys.include?i)
            condition=false
            if(i.match(/^\d*$/) and obj.is_a?(Array))
                val=i.to_i
                if(val<obj.length)
                    obj= obj[val]
                    condition=true
                end
            end
            break
        else
            obj=obj[i]
        end
    end
    if(condition==true)
        puts obj
    else
        puts "Invalid"
    end
end





