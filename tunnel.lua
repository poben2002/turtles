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

-- Function to place torch
function placeTorch()
    if turtle.getItemCount(16) > 0 then
        turtle.select(16)
        turtle.place()
    end
end

-- Main tunneling function
function tunnel()
    for _ = 1, 3 do
        for _ = 1, 2 do
            mineForward()
            ejectNonOres()
            placeTorch()
        end
        if _ % 2 == 0 then
            turtle.turnRight()
            mineForward()
            turtle.turnRight()
        else
            turtle.turnLeft()
            mineForward()
            turtle.turnLeft()
        end
    end
    returnToStart()
end

-- Call the main tunneling function
tunnel()
