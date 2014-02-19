function game_load()
	game_state = "game"
	count_down = 3
	table_sort = {}
	st = 0
	ft = 0
end

function game_draw()


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
		if st == 0 then
			st = os.clock() -- begin time
		end

		-- result
		if ft ~= 0 then
			love.graphics.print(ft - st .. " 秒", gamewidth / 2 - 20, gameheight - 80)
		end

		if game_type == 0 then
			dif_draw(game_numb)
		else
			mem_draw(game_numb)
		end 
	end

	-- home
	if count_down == -1 then
		love.graphics.drawq(img_hom, quad_hom, gamewidth - 60, 30, 0, 1/2, 1/2)
	end

end

function game_mousepressed(x,y)
	local width = 400
	local height = 400

	if count_down == -1 then
		if game_type == 0 then
			for i=1,game_numb do
				for j=1,game_numb do
					number = table_sort[(i-1)*game_numb + j]
					local x1 = (gamewidth/2 - width/2) + width * j / (game_numb + 1) - 7
					local x2 = (gamewidth/2 - width/2) + width * (j + 1) / (game_numb + 1) - 7
					local y1 = (gameheight/2 - height/2 ) + height * i / (game_numb + 1)
					local y2 = (gameheight/2 - height/2 ) + height * (i + 1) / (game_numb + 1)
					local xavg = (x2 - x1)/2
					local yavg = (y2 - y1)/2

					if 	x1 - xavg < x and x < x1 + xavg
					and y1 - yavg < y and y < y1 + yavg then
						print(number)
						if number == next_numb then
							print("OK")
							if next_numb == game_numb * game_numb then
								ft = os.clock()
							else
								next_numb = next_numb + 1
							end
						end
					end
				end
			end
		else

		end
		if gamewidth - 60 < x and x < gamewidth -30 and 30 < y and y < 60 then
			menu_load()
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