input = File.readlines("input.txt").map(&:strip)

silver_star = 
    input.
     chunk_while {|line| line != "" }.
     map { |lines| lines.map(&:to_i).sum }.
     max

puts "Silver star: #{silver_star}"

gold_star = 
    input.
     chunk_while {|line| line != "" }.
     map { |lines| lines.map(&:to_i).sum }.
     sort.
     last(3).
     sum

puts "Gold star: #{gold_star}"