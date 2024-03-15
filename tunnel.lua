-- Function to mine forward
function mineForward()
    while turtle.detect() do
        turtle.dig()
        sleep(0.5)  -- Wait for items to drop
    end
    turtle.forward()
end

-- Function to mine up
function mineUp()
    while turtle.detectUp() do
        turtle.digUp()
        sleep(0.5)
    end
    turtle.up()
end

-- Function to mine down
function mineDown()
    while turtle.detectDown() do
        turtle.digDown()
        sleep(0.5)
    end
    turtle.down()
end

-- Function to return to starting position
function returnToStart()
    while not turtle.detect() do
        turtle.back()
        sleep(0.5)
    end
    while not turtle.detectUp() do
        turtle.up()
        sleep(0.5)
    end
end

-- Function to eject cobble deepslate and tuff
function ejectNonOres()
    for i = 1, 16 do
        turtle.select(i)
        local item = turtle.getItemDetail()
        if item then
            local itemName = item.name
            if itemName == "minecraft:cobbled_deepslate" or itemName == "minecraft:tuff" then
                turtle.drop()
            end
        end
    end
end

-- Main mining function
function mineRoom(width, length, height)
    for y = 1, height do
        for x = 1, width do
            for z = 1, length do
                mineForward()
                ejectNonOres()
            end
            if x < width then
                if x % 2 == 0 then
                    turtle.turnRight()
                    mineForward()
                    turtle.turnRight()
                else
                    turtle.turnLeft()
                    mineForward()
                    turtle.turnLeft()
                end
            end
        end
        if y < height then
            if y % 2 == 0 then
                turtle.turnRight()
                turtle.turnRight()
                mineUp()
            else
                mineDown()
            end
        end
    end
    returnToStart()
end

-- Get dimensions from user
print("Enter room dimensions:")
print("Width:")
local width = tonumber(read())
print("Length:")
local length = tonumber(read())
print("Height:")
local height = tonumber(read())

-- Call the main mining function with user-provided dimensions
mineRoom(width, length, height)
