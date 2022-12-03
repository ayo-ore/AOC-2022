#!/usr/bin/env julia

const INPUT_FILE = ARGS[1]
const rucksacks = readlines(INPUT_FILE)

item_priority(item::Char) = item < 'a' ? Int(item) - 38 : Int(item) - 96

function part_one(rucksacks)::Int
    sum(rucksacks) do rucksack
        item_priority(intersect(
            Iterators.partition(collect(rucksack), length(rucksack)÷2)...
        )[])
    end
end

function part_two(rucksacks)::Int
    sum(Iterators.partition(rucksacks, 3)) do group
        item_priority(intersect(group...)[])
    end
end
println("PART ONE: $(part_one(rucksacks))")
println("PART TWO: $(part_two(rucksacks))")

