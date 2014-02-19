function love.load()
    -- img_num = love.graphics.newImage("graphics/num.png")

    color = {"white", "black"}

    img_inf =   love.graphics.newImage("graphics/" .. color[1] .. "/info.png")
    img_col =   love.graphics.newImage("graphics/" .. color[1] .. "/t-shirt.png")
    img_sou1 =  love.graphics.newImage("graphics/" .. color[1] .. "/sound1.png")
    img_sou2 =  love.graphics.newImage("graphics/" .. color[1] .. "/sound4.png")
    img_hom =   love.graphics.newImage("graphics/" .. color[1] .. "/home.png")

    -- quad_num = {}
    -- quad_num[0] = love.graphics.newQuad()
    -- quad_num[1] = love.graphics.newQuad()
    -- quad_num[2] = love.graphics.newQuad()
    -- quad_num[3] = love.graphics.newQuad()
    -- quad_num[4] = love.graphics.newQuad()
    -- quad_num[5] = love.graphics.newQuad()
    -- quad_num[6] = love.graphics.newQuad()
    -- quad_num[7] = love.graphics.newQuad()
    -- quad_num[8] = love.graphics.newQuad()
    -- quad_num[9] = love.graphics.newQuad()

    quad_inf = love.graphics.newQuad(0,0,16,36,16,36)
    quad_col = love.graphics.newQuad(0,0,36,29,36,29)
    quad_sou1 = love.graphics.newQuad(0,0,36,33,36,33)
    quad_sou2 = love.graphics.newQuad(0,0,31,24,31,24)
    quad_hom = love.graphics.newQuad(0,0,36,33,36,33)

    gamewidth = love.graphics.getWidth()
    gameheight = love.graphics.getHeight()

    font_lit = love.graphics.newFont("fonts/FZXSHJW.TTF",13)
    font = love.graphics.newFont("fonts/FZXSHJW.TTF",19)
    font_big = love.graphics.newFont("fonts/FZXSHJW.TTF",200)
    -- font = love.graphics.newFont("fonts/FZY1JW.TTF",17)
    -- font = love.graphics.newFont("fonts/FZY4JW.TTF",17)
    -- font = love.graphics.newFont("fonts/FZZHYJW.TTF",17)
    love.graphics.setFont(font)

    require("menu")
    require("game")
    require("info")

    menu_load()
    game_type = 0 -- stand for difficut
    game_numb = 0
    sound_type = 1 -- open sound

    count_down = 3

    st = 0
    ft = 0
    wt = 0

    si = -1
    sj = -1
    show = 0

    table_sort = {}
    next_numb = 1
end

function love.draw()
    if game_state == "menu" then
        menu_draw()
    elseif game_state == "game" then
        game_draw(game_type, game_numb)
    elseif game_state == "info" then
        info_draw()
    end

end

function love.mousepressed(x, y, button)
    if game_state == "menu" then
        menu_mousepressed(x,y)
    elseif game_state == "game" then
        game_mousepressed(x,y)
    elseif game_state == "info" then
        info_mousepressed(x,y)
    end
end

function love.focus(f) gameIsPaused = not f end

function love.update(dt)
   if gameIsPaused then return end

    -- The rest of your love.update code goes here
end

function love.quit()
   print("Thanks for playing! Come back soon!")
end