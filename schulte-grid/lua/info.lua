function info_load()
	game_state = "info"
end


function info_draw()
	-- body
	local text =  {
					"      舒尔特表是全世界最简单、最有效也是最科学的注意力",
					"训练方法。在规定时间内按顺序从小到大点击数字，所用时间",
					"用时间越短，注意力水平越高。 ",
					"舒尔特表的主要作用如下： ",
					"    1. 培养注意力集中、分配、控制能力； ",
					"    2. 拓展视幅，加快视频； ",
					"    3. 提高视觉的稳定性、辨别力、定向搜索能力。 ",
					"      每天坚持练习几分钟，除了会增加注意力以外，更重要",
					"的是拓展你的视幅，该技能对英语中文的快速阅读能力的提高非",
					"常有帮助。",
					}
	love.graphics.setFont(font_lit)
	for key, value in pairs(text) do
		love.graphics.print(value, gamewidth / 8 , gameheight * (key + 1) / 14 )
	end

	-- home
	love.graphics.drawq(img_hom, quad_hom, gamewidth - 60, 30, 0, 1/2, 1/2)

end

function info_mousepressed(x,y)
	if gamewidth - 60 < x and x < gamewidth -30 and 30 < y and y < 60 then
		menu_load()
	end
end


function love.update(dt)

end