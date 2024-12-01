file = io.open("input.txt", "r")
lines = file:read("*all")
file:close()

-- Part 1 --
function Split(lines, sep)
    local left, right = {}, {}
    local index = 0

    for str in string.gmatch(lines, "[^" .. sep .. "]+") do
        index = index + 1
        local num = tonumber(str)

        if index % 2 == 1 then
            table.insert(left, num)
        else
            table.insert(right, num)
        end
    end
    return left, right
end

local leftList, rightList = Split(lines, "%s")

function Sort(list)
    table.sort(list)
    return list
end

local leftSortedList = Sort(leftList)
local rightSortedList = Sort(rightList)

function Tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function Part1(list1, list2)
    local length = Tablelength(list1)
    local count = 0

    for i = 1, length do
        count = count + math.abs(list1[i] - list2[i])
    end

    return count
end

local total = Part1(leftSortedList, rightSortedList)
print(total)

-- Part 2 --

function Part2(leftL, rightL)
    local length = Tablelength(leftL)
    local count = 0

    for i = 1, length do
        local num = leftL[i]
        local occur = 0

        for j = 1, length do
            if num == rightL[j] then
                occur = occur + 1
            end
        end

        count = count + (num * occur)
    end

    return count
end

local total2 = Part2(leftList, rightList)
print(total2)
