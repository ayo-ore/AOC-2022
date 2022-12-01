#!/usr/bin/julia
const INPUT_FILE = ARGS[1]
inputs = split(read(INPUT_FILE, String), "\n\n")
function part_one(inputs)::Int
    maximum([
        sum(parse.(Int, split(elf_calories, "\n")))
        for elf_calories ∈ inputs]
    )
end
function part_two(inputs)::Int
    sum(sort([
        sum(parse.(Int, split(elf_calories, "\n")))
        for elf_calories ∈ inputs]
    )[end-2:end])
end
println("PART ONE: $(part_one(inputs))")
println("PART TWO: $(part_two(inputs))")