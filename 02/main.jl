#!/usr/bin/julia
const INPUT_FILE = ARGS[1]

const games = map(eachline(INPUT_FILE)) do i
    Int(i[1])-64, Int(i[3])-87
end

function part_one(games)::Int
    sum(games) do (opponent_move, player_move)
        outcome = mod(player_move - opponent_move + 1, 3)
        player_move + 3 * outcome
    end
end

function part_two(games)::Int
    sum(games) do (opponent_move, outcome)
        player_move = mod1(opponent_move + outcome - 2, 3)
        player_move + 3 * outcome - 3
    end
end

println("PART ONE: $(part_one(games))")
println("PART TWO: $(part_two(games))")