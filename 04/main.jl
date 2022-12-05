#!/usr/bin/env julia
const INPUT_FILE = ARGS[1]
const pairs = map(eachline(INPUT_FILE)) do i
    eval(Meta.parse.(replace(i, "-" => ":")))
end
function part_one(pairs)::Int
    length(filter(x -> ⊆(x...) | ⊆(reverse(x)...), pairs))
end
function part_two(pairs)::Int
    length(filter(x -> !isempty(∩(x...)), pairs))
end
println("PART ONE: $(part_one(pairs))")
println("PART TWO: $(part_two(pairs))")