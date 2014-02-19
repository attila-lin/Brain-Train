function game_load()
	game_state = "game"
	count_down = 3
	table_sort = {}
end

function game_draw(game_type, numb)


	-- count down
	if count_down ~= -1 then
		love.graphics.setFont(font_big)
		if count_down ~= 0 then
			love.graphics.print(count_down, gamewidth / 2 - 60, gameheight / 2 - 100)
		end
		count_down = count_down - 1
		love.timer.sleep(1.2)
		-- print(count_down)
	-- game begin
	else
		if game_type == 0 then
			dif_draw(numb)
		else
			mem_draw(numb)
		end 
	end



	-- home
	love.graphics.drawq(img_hom, quad_hom, gamewidth - 60, 30, 0, 1/2, 1/2)

end

function game_mousepressed(x,y)
	if count_down == -1 then
		if game_type == 0 then

		else

		end
	end
end

function random_table( numb )
	if next(table_sort) == nil then
  		for i=1,numb*numb do
			table.insert(table_sort, i)
		end
		math.randomseed( os.time() );
		for i=1,numb*numb do
			local tmp = table_sort[i]
			local random = math.random(1, numb * numb)
			table_sort[i] = table_sort[random]
			table_sort[random] = tmp
		end
		-- print(table_sort[1])
	else 
		return false
	end

end

function dif_draw(numb)
	local width = 400
	local height = 400

	love.graphics.setFont(font)
	-- not empty
	random_table( numb )

	for i=1,numb do
		for j=1,numb do
			number = table_sort[(i-1)*numb + j]
			if number < 10 then
				love.graphics.print( " " .. number , (gamewidth/2 - width/2) + width * j / (numb + 1) - 7 ,(gameheight/2 - height/2 ) + height * i / (numb + 1))
			else
				love.graphics.print( number , (gamewidth/2 - width/2) + width * j / (numb + 1) - 7 ,(gameheight/2 - height/2 ) + height * i / (numb + 1))
			end
		end
	end
end

function mem_draw(numb)
	-- body
end