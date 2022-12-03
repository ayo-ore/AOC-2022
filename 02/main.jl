#!/usr/bin/julia
const INPUT_FILE = ARGS[1]
const games = readlines(INPUT_FILE)

const OPPONENT_CHARS = collect("ABC")
const PLAYER_CHARS = collect("XYZ")

get_move(char, charset) = indexin([char], charset)[]

function part_one(games)::Int
    sum(games) do g
        opponent_move = get_move(g[1], OPPONENT_CHARS)
        outcome = mod(player_move - opponent_move + 1, 3)
        player_move + 3 * outcome
    end
end

function part_two(games)::Int
    sum(games) do g
        outcome = get_move(g[3], PLAYER_CHARS)
        opponent_move = get_move(g[1], OPPONENT_CHARS)
        player_move = mod1(opponent_move + outcome - 2, 3)
        player_move + 3 * outcome - 3
    end
end
println("PART ONE: $(part_one(games))")
println("PART TWO: $(part_two(games))")

