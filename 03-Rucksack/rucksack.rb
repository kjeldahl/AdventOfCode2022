require "set"
input = File.readlines("input.txt").map(&:strip)

rucksacks = input.map {|l| [l[0...l.size/2], l[l.size/2..]]}
commons = rucksacks.map{|r| (Set.new(r.first.chars) & Set.new(r.last.chars)).first}

priorities = ("a".."z").map{|l| [l, l.ord - "a".ord + 1]}.to_h
priorities.merge!(("A".."Z").map{|l| [l, l.ord - "A".ord + 27]}.to_h)
silver_star = commons.map{|c| priorities[c]}.sum
puts "First star #{silver_star}"

gold_star = rucksacks.
    each_slice(3).
    map {|group| group.map{|g| Set.new(g.join.chars)}.reduce(&:&)}.
    sum{|b| priorities[b.first]}
puts "Gold star #{gold_star}"