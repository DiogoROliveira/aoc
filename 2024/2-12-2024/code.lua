file = io.open("input.txt", "r")

lines = file:read("*all")
file:close()

--print(lines)

List = {}

for line in string.gmatch(lines, "[^\n]+") do
    local row = {}
    for num in string.gmatch(line, "%S+") do
        table.insert(row, tonumber(num))
    end
    table.insert(List, row)
end


function Part1(list)
    local total = 0

    for _, row in pairs(list) do
        local lineLength = #row
        local bool = row[1] > row[2]
        local valid = true

        for j = 2, lineLength do
            if (row[j - 1] - row[j] > 0) ~= bool then
                valid = false
                break
            end

            local diff = math.abs(row[j - 1] - row[j])
            if diff > 3 or diff == 0 then
                valid = false
                break
            end
        end

        if valid then
            total = total + 1
        end
    end
    return total
end

Total = Part1(List)

print(Total)


function Part2(list)
    local total = 0

    local function Part1(row)
        local lineLength = #row
        local bool = row[1] > row[2]
        for j = 2, lineLength do
            if (row[j - 1] - row[j] > 0) ~= bool then
                return false
            end
            local diff = math.abs(row[j - 1] - row[j])
            if diff > 3 or diff == 0 then
                return false
            end
        end
        return true
    end

    for _, row in pairs(list) do
        if Part1(row) then
            total = total + 1
        else
            local bool = false
            for i = 1, #row do
                local tempRow = {}
                for j = 1, #row do
                    if j ~= i then
                        table.insert(tempRow, row[j])
                    end
                end

                if Part1(tempRow) then
                    bool = true
                    break
                end
            end

            if bool then
                total = total + 1
            end
        end
    end

    return total
end

Total2 = Part2(List)

print(Total2)
