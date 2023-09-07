-- Create a Metatable
SummaryMetaTable = {
    __add = function (left, right)
        local newSummary = {super=0, good=0, middle=0, low=0}
        for k, v in pairs(left) do
            newSummary[k] = v + right[k]
        end
        return newSummary
    end
}

-- Read data from `data4.txt`
local lines = {}
<<<<<<< HEAD
for line in io.lines("../fulldata/data4.txt") do
=======
for line in io.lines("../testdata/data4.txt") do
>>>>>>> e205d47199e02ff93658bf627dc070a4c48eb870
    table.insert(lines, line)
end

-- Skip header
table.remove(lines, 1)

-- Initialize empty table to hold summary counts for each person
local people = {}

-- Process each line and collect data
for _, line in ipairs(lines) do
    local name, tech, soft, bus, creative, academic = line:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")
    local summary = {super=0, good=0, middle=0, low=0}
    setmetatable(summary, SummaryMetaTable)

    for _, skill in ipairs({tech, soft, bus, creative, academic}) do
        summary[skill] = (summary[skill] or 0) + 1
    end

    local finalSummary
    if summary.super > 0 then
        finalSummary = "super"
    elseif summary.good >= 2 then
        finalSummaries = "good"
    elseif summary.middle >= 3 then
        finalSummary = "middle"
    else
        finalSummary = "low"
    end

    table.insert(people, {name, tech, soft, bus, creative, academic, finalSummary})
end

-- Write data to `data5.txt`
<<<<<<< HEAD
local out = io.open("../fulldata/data5.txt", "w")
=======
local out = io.open("../testdata/data5.txt", "w")
>>>>>>> e205d47199e02ff93658bf627dc070a4c48eb870
out:write("Name,Technical Skills,Soft Skills,Business Skills,Creative Skills,Academic Skills,Summary\n")
for _, entry in ipairs(people) do
    out:write(table.concat(entry, ',') .. "\n")
end
out:close()
