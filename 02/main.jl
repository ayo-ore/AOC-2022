#!/usr/bin/julia
const INPUT_FILE = ARGS[1]
const inputs = readlines(INPUT_FILE)

OPPONENT_CHARS = collect("ABC")
PLAYER_CHARS = collect("XYZ")
get_move(char, charset) = indexin([char], charset)[]

function part_one(inputs)::Int
    sum(inputs) do g
        # opponent_move = get_move(g[1], OPPONENT_CHARS)
        # outcome = mod(player_move - opponent_move + 1, 3)
        # player_move + 3 * outcome
        player_move = get_move(g[3], PLAYER_CHARS)
        player_move + 3 * mod(player_move - get_move(g[1], OPPONENT_CHARS) + 1, 3)
    end
end


function part_two(inputs)::Int
    sum(inputs) do g
        # outcome = get_move(g[3], PLAYER_CHARS)
        # opponent_move = get_move(g[1], OPPONENT_CHARS)
        # player_move = mod1(opponent_move + outcome - 2, 3)
        # player_move + 3 * outcome - 3
        outcome = get_move(g[3], PLAYER_CHARS)
        mod1(get_move(g[1], OPPONENT_CHARS) + outcome - 2, 3) + 3 * outcome - 3
    end
end
println("PART ONE: $(part_one(inputs))")
println("PART TWO: $(part_two(inputs))")

