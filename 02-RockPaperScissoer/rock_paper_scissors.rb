input = File.readlines("input.txt").map(&:strip)

# X - Rock, Y - PAper, Z - Scissors
# A - Rock, B - Paper, C - Scissors
points = {"X" => 1, "Y" => 2, "Z" => 3 }
def match_points(opponent, you)
    {
        "A" => {"X" => 3, "Y" => 6, "Z" => 0},
        "B" => {"X" => 0, "Y" => 3, "Z" => 6},
        "C" => {"X" => 6, "Y" => 0, "Z" => 3},
    }[opponent][you]
end

silver_star =
    input.
        map {|l| l.split(" ")}.
        sum {|match| points[match.last] + match_points(*match)}
puts "Silver star: #{silver_star}"

# X: Lose, Y: Draw Z: Win
match_points = { "X" => 0, "Y" => 3, "Z" => 6}
your_choice = { # opponent => { outcome: hand choice}
        "A" => {"X" => "Z", "Y" => "X", "Z" => "Y"},
        "B" => {"X" => "X", "Y" => "Y", "Z" => "Z"},
        "C" => {"X" => "Y", "Y" => "Z", "Z" => "X"},
}
gold_star =
    input.
        map {|l| l.split(" ")}.
        sum {|match| points[your_choice[match.first][match.last]]+match_points[match.last]}

puts "Gold star: #{gold_star}"