--[[
introvert1337's jailbreak numberlink solver - edited with chatgpt 🔥🔥🔥 (because i suck at algorithm)
original file from: https://github.com/Introvert1337/RobloxReleases/blob/main/Scripts/Jailbreak/NumberlinkSolver.lua
--]]
local matrixList, chosenPaths, usedPaths, pathGroups = {}, {}, {}, {}
local columns, rows

local function traverseMatrix(startingNode, direction)
    if direction == "r" then
        return startingNode + 1
    elseif direction == "l" then
        return startingNode - 1
    elseif direction == "u" then
        return startingNode - rows
    elseif direction == "d" then
        return startingNode + rows
    end
end

local function manhattan(a, b)
    local ax = ((a - 1) % rows) + 1
    local ay = math.ceil(a / rows)
    local bx = ((b - 1) % rows) + 1
    local by = math.ceil(b / rows)
    return math.abs(ax - bx) + math.abs(ay - by)
end

function getPossiblePaths(node, target, visited, path, correctPaths)
    visited[node] = true
    path[#path + 1] = node
    if #path > rows * columns then
        visited[node] = nil
        path[#path] = nil
        return
    end

    if matrixList[node] == target and #path > 1 then
        table.insert(correctPaths, table.clone(path))
    else
        local possibleDirections = {
            l = node % rows ~= 1,
            r = node % rows ~= 0,
            u = node > rows,
            d = node <= rows * (columns - 1)
        }
        local ordered = {}
        for dir, allowed in pairs(possibleDirections) do
            if allowed then
                local nextNode = traverseMatrix(node, dir)
                local dist = math.abs(
                    ((nextNode - 1) % rows) - ((target - 1) % rows)
                ) + math.abs(
                    math.ceil(nextNode / rows) - math.ceil(target / rows)
                )
                ordered[#ordered + 1] = { dir = dir, node = nextNode, dist = dist }
            end
        end

        table.sort(ordered, function(a, b)
            return a.dist < b.dist
        end)

        for _, data in ipairs(ordered) do
            local nextNode = data.node

            if not visited[nextNode] and
               (matrixList[nextNode] == 0 or matrixList[nextNode] == target) then
                if data.dist <= (rows * columns - #path) then
                    getPossiblePaths(nextNode, target, visited, path, correctPaths)
                end
            end
        end
    end

    visited[node] = nil
    path[#path] = nil

    if not path[1] then
        return correctPaths
    end
end

local function hasOverlap(setA, setB)
    for value in pairs(setB) do
        if setA[value] then
            return true
        end
    end
    return false
end

local function removeOrUnion(setA, setB, union)
    for value in pairs(setB) do
        setA[value] = union
    end
end

local function selectNonOverlapping(groupIndex)
    if groupIndex > #pathGroups then
        return true
    end
    
    for candidateIndex, candidate in pairs(pathGroups[groupIndex]) do
        if not hasOverlap(usedPaths, candidate.set) then
            removeOrUnion(usedPaths, candidate.set, true)
            chosenPaths[groupIndex] = candidate
            
            if selectNonOverlapping(groupIndex + 1) then
                return true
            end

            removeOrUnion(usedPaths, candidate.set)
            chosenPaths[groupIndex] = nil
        end
    end

    return false
end

solver = function(matrix)
    table.clear(matrixList)
    table.clear(chosenPaths)
    table.clear(usedPaths)
    table.clear(pathGroups)

    columns = #matrix
    rows = #matrix[1]

    local uniqueNodeValues = {}

    for _, row in matrix do
        for _, node in row do
            table.insert(matrixList, node)
        end
    end

    for _, nodeValue in matrixList do
        if nodeValue ~= 0 and not uniqueNodeValues[nodeValue] then
            uniqueNodeValues[nodeValue] = table.find(matrixList, nodeValue)
        end
    end

    for nodeValue, nodeIndex in uniqueNodeValues do
        pathGroups[nodeValue] = {}

        local visited, path, correctPaths = {}, {}, {}
    
        for pathIndex, path in getPossiblePaths(nodeIndex, nodeValue, visited, path, correctPaths) do
            local set = {}
    
            for _, node in path do
                set[node] = true
            end
    
            pathGroups[nodeValue][pathIndex] = {
                original = path,
                set = set
            }
        end
    end

    if selectNonOverlapping(1) then
        for pathNumber, path in chosenPaths do
            for _, nodeValue in path.original do
                matrixList[nodeValue] = pathNumber
            end
        end
    else
        return print("No combination of non-overlapping tables found.")
    end
    
    local solvedMatrix = {}
    
    for _ = 1, columns do
        table.insert(solvedMatrix, {})
    end
    
    for nodeIndex, nodeValue in matrixList do
        table.insert(solvedMatrix[math.ceil(nodeIndex / rows)], nodeValue)
    end

    return solvedMatrix
end
return solver
