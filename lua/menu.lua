function menu_load()
	game_state = "menu"
end

function menu_draw()
	
-- finally we don't need the frame	
	-- -- love.graphics.setColor( 255, 255, 0 ) -- pacman needs to be yellow
    -- local radius = 10
    -- poiA_X = gamewidth / 4 + 20
    -- poiA_Y = gameheight / 8
    -- poiB_X = gamewidth * 3/4 - 20
    -- poiB_Y = gameheight / 6

    -- love.graphics.arc( "line", poiA_X + radius, poiA_Y + radius, radius, math.pi,       3/2*math.pi )
    -- love.graphics.arc( "line", poiA_X + radius, poiB_Y - radius, radius, math.pi/2,     math.pi )
    -- love.graphics.arc( "line", poiB_X - radius, poiA_Y + radius, radius, math.pi*3/2,   2*math.pi )
    -- love.graphics.arc( "line", poiB_X - radius, poiB_Y - radius, radius, 0,             math.pi/2 )

    -- -- line
    -- love.graphics.setColor(255, 255, 255, 255)
    -- love.graphics.line(poiA_X + radius, poiA_Y, poiB_X - radius, poiA_Y)
    -- love.graphics.line(poiA_X + radius, poiB_Y, poiB_X - radius, poiB_Y)

    -- love.graphics.line(poiA_X, poiA_Y + radius, poiA_X, poiB_Y - radius)
    -- love.graphics.line(poiB_X, poiA_Y + radius, poiB_X, poiB_Y - radius)

    -- love.graphics.line(gamewidth / 2, gameheight / 8, gamewidth / 2, gameheight / 6)

    -- -- clear some line
    -- love.graphics.setColor(0, 0, 0, 255)
    -- love.graphics.line(poiA_X + radius, poiA_Y + 1, poiA_X + radius, poiA_Y + radius)
    -- love.graphics.line(poiA_X + 1, poiA_Y + radius, poiA_X + radius, poiA_Y + radius)
    -- love.graphics.line(poiA_X + radius, poiB_Y - 1, poiA_X + radius, poiB_Y - radius)
    -- love.graphics.line(poiA_X + 1, poiB_Y - radius, poiA_X + radius, poiB_Y - radius)

    -- love.graphics.line(poiB_X - radius, poiA_Y + 1, poiB_X - radius, poiA_Y + radius)
    -- love.graphics.line(poiB_X - 1, poiA_Y + radius, poiB_X - radius, poiA_Y + radius)
    -- love.graphics.line(poiB_X - radius, poiB_Y - 1, poiB_X - radius, poiB_Y - radius)
    -- love.graphics.line(poiB_X - 1, poiB_Y - radius, poiB_X - radius, poiB_Y - radius)

    -- love.graphics.setColor(255, 255, 255, 255)

    -- -- love.graphics.setColor(0, 255, 0, 255)
    
    if game_type == 0 then
    	love.graphics.setColor(255, 255, 255, 255)
    	love.graphics.print("复杂", gamewidth / 4 + 50, gameheight / 8)
    	love.graphics.setColor(128, 128, 128, 255)
    	love.graphics.print("记忆", gamewidth / 2 + 33, gameheight / 8)
    	love.graphics.setColor(255, 255, 255, 255)
    else
    	love.graphics.setColor(128, 128, 128, 255)
    	love.graphics.print("复杂", gamewidth / 4 + 50, gameheight / 8)
    	love.graphics.setColor(255, 255, 255, 255)
    	love.graphics.print("记忆", gamewidth / 2 + 33, gameheight / 8)
    end


    -- love.graphics.print("inf", gamewidth - 60, 30)
    love.graphics.drawq(img_inf, quad_inf, gamewidth - 60, 30, 0, 1/2, 1/2)
    love.graphics.drawq(img_col, quad_col, 30, gameheight - 60, 0, 1/2, 1/2)
    if sound_type == 1 then
    	love.graphics.drawq(img_sou1, quad_sou1, gamewidth - 60, gameheight - 60, 0, 1/2, 1/2)
    else
    	love.graphics.drawq(img_sou2, quad_sou2, gamewidth - 60, gameheight - 60, 0, 1/2, 1/2)
    end

    -- love.graphics.print("col", 30, gameheight - 60)
    -- love.graphics.print("sou", gamewidth - 60, gameheight - 60)

    local pos_X = {gamewidth / 6, 		gamewidth / 2 - 20,  gamewidth*5/6 - 40, }
    local pos_Y = {gameheight / 5 + 13, gameheight*2/5 + 13, gameheight*3/5 + 13}

    -- print(pos_X[1])

    love.graphics.print("2 * 2", pos_X[1], pos_Y[1])
    love.graphics.print("3 * 3", pos_X[2], pos_Y[1])
    love.graphics.print("4 * 4", pos_X[3], pos_Y[1])

    love.graphics.print("5 * 5", pos_X[1], pos_Y[2])
    
    love.graphics.print("6 * 6", pos_X[3], pos_Y[2])

    love.graphics.print("7 * 7", pos_X[1], pos_Y[3])
    love.graphics.print("8 * 8", pos_X[2], pos_Y[3])
    love.graphics.print("9 * 9", pos_X[3], pos_Y[3])
end



function menu_mousepressed(x,y)
	-- print(x)
	-- print(y)
 	local pos_X = {gamewidth / 6, 		gamewidth / 2 - 20,  gamewidth*5/6 - 40, }
    local pos_Y = {gameheight / 5 + 13, gameheight*2/5 + 13, gameheight*3/5 + 13}

    local length_x = 50
    local length_y = 23

    if 		pos_X[1] < x and x < pos_X[1] + length_x and pos_Y[1] < y and y < pos_Y[1] + length_y then
    	game_numb = 2
    elseif 	pos_X[2] < x and x < pos_X[2] + length_x and pos_Y[1] < y and y < pos_Y[1] + length_y then
    	game_numb = 3
    elseif 	pos_X[3] < x and x < pos_X[3] + length_x and pos_Y[1] < y and y < pos_Y[1] + length_y then
    	game_numb = 4
    elseif 	pos_X[1] < x and x < pos_X[1] + length_x and pos_Y[2] < y and y < pos_Y[2] + length_y then
    	game_numb = 5
    elseif 	pos_X[3] < x and x < pos_X[3] + length_x and pos_Y[2] < y and y < pos_Y[2] + length_y then
    	game_numb = 6
    elseif 	pos_X[1] < x and x < pos_X[1] + length_x and pos_Y[3] < y and y < pos_Y[3] + length_y then
    	game_numb = 7
    elseif 	pos_X[2] < x and x < pos_X[2] + length_x and pos_Y[3] < y and y < pos_Y[3] + length_y then
    	game_numb = 8
    elseif 	pos_X[3] < x and x < pos_X[3] + length_x and pos_Y[3] < y and y < pos_Y[3] + length_y then
    	game_numb = 9
    end

	-- gamewidth - 60, 30
 	-- 30, gameheight - 60
 	-- gamewidth - 60, gameheight - 60

 	-- info
    if gamewidth - 60 < x and x < gamewidth -30 and 30 < y and y < 60 then 
    	info_load()
    -- color
    elseif 30 < x and x < 60 and gameheight - 60 < y and y < gameheight - 30 then 
    	color_type = color_type % 5
    	color_type = color_type + 1
    -- sound
    elseif gamewidth - 60 < x and x < gamewidth - 30 and gameheight - 60 < y and y < gameheight - 30 then
    	if sound_type == 0 then
    		sound_type = 1
    	else 
    		sound_type = 0
    	end
    end

    -- gamewidth / 4 + 50, gameheight / 8
    -- gamewidth / 2 + 33, gameheight / 8
    if gamewidth / 4 + 50 < x and x < gamewidth / 4 + 90 and gameheight / 8 < y and y < gameheight / 8 + 23 then
    	game_type = 0
    elseif gamewidth / 2 + 33 < x and x < gamewidth / 2 + 73 and gameheight / 8 < y and y < gameheight / 8 + 23 then
    	game_type = 1
    end

    if 0 < game_numb and game_numb <= 9 then
    	game_load()
    end

    -- print(game_numb)
    -- game_numb = 0
end 