File = io.open("input.txt", "r")

Lines = File:read("*all")

Lines = Lines:gsub("%s+", "")

File:close()

-- Part 1 --

function Part1(input)
    local total = 0

    local regex = 'mul%(%d+,%d+%)'

    for match in string.gmatch(input, regex) do
        local x, y = match:match('(%d+),(%d+)')

        local num1 = tonumber(x)
        local num2 = tonumber(y)

        total = total + num1 * num2
    end

    return total
end

function Part2(input)
    local total = 0
    local valid = true
    local pattern = "do%(%)|don't%(%)|mul%(%d+,%d+%)"

    for match in input:gmatch(pattern) do
        if match == "do()" then
            valid = true
        elseif match == "don't()" then
            valid = false
        elseif match:match("mul%(%d+,%d+%)") and valid then
            local x, y = match:match("mul%((%d+),(%d+)%)")
            total = total + tonumber(x) * tonumber(y)
        end
    end
    return total
end

Result1 = Part1(Lines)
print(Result1)

Result2 = Part2(Lines)
print(Result2)
