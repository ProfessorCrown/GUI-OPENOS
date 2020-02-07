-- оболочка для планшета ОК

local event = require("event")
local component = require("component")
local computer = require("computer")
local gpu = component.gpu
local term = require("term")
local shell = require("shell")
local image = require("image")
local ecs = require("ECSAPI")
local buffer = require("doubleBuffering")
local GUI = require("GUI")

-- переменные, таблицы с параметрами иконок и их ссылками на программы

--local oslogoup = image.load("ProgramFiles/IconsPic/oslogoup.pic")
--local imageLogo = image.load("ProgramFiles/IconsPic/Logo.pic")
local xScrM, yScrM = gpu.getResolution()
local xScr, yScr = gpu.getResolution()
local dop = 2
if xScr > 100 then
gpu.setResolution(100,30)
xScr = 100
end
if yScr > 30 then
gpu.setResolution(100,30)
yScr = 30
end
local xCen, yCen = math.ceil(xScr/2), math.ceil(yScr/2)

-- строка для тмп ___  iconEXIT.pic  Выключение ПК  tq.pic /ProgramFiles/tquest.lua
--desk1 = {}
--desk2 = {}
--desk3 = {}
local desk1 = {}
local desk2 = {"/ProgramFiles/nc.lua","/ProgramFiles/nanobots.lua","/ProgramFiles/nanoplus.lua","/ProgramFiles/tquest.lua","/ProgramFiles/Battleship.lua","/ProgramFiles/saper.lua","/ProgramFiles/info.lua","/ProgramFiles/chat.lua","/ProgramFiles/ops.lua","/ProgramFiles/pstb.lua","/ProgramFiles/exit.lua","/ProgramFiles/magnit.lua"}
local desk3 = {"  Менеджер","Упр.нанитами"," Наноботы-2","   TQueST","Морской бой","   Сапёр","   Инфо ПК","     Чат","Диспетчер HDD","  Pastebin","Выключение ПК","   Магнит"}
local desk4 = {}
local desk5 = {}
exityn = 1
qt = 1


-- logo 2 sec (заставка на экране, не больше 2х секунд)

local foreg = {0x000000,0x0F0F0F,0x1E1E1E,0x2D2D2D,0x3C3C3C,0x4B4B4B,0x5A5A5A,0x696969,0x787878,0x878787,0x969696,0xA5A5A5,0xB4B4B4,0xC3C3C3,0xD2D2D2,0xE1E1E1,0xF0F0F0,0xFFFFFF}
local i = xCen-25
os.sleep(0.3)
term.clear()
os.sleep(0.3)
-- image.draw(xCen-25,yCen-5,imageLogo)
local logoandroid = {
"╔╗─╔╗╔══╗╔═══╗╔═══╗╔═══╗╔═══╗",
"║║─║║╚╣─╝║╔═╗║║╔═╗║║╔══╝╚╗╔╗║",
"║╚═╝║─║║─║╚═╝║║╚═╝║║╚══╗─║║║║",
"║╔═╗║─║║─║╔══╝║╔╗╔╝║╔══╝─║║║║",
"║║─║║╔╣─╗║║───║║║╚╗║╚══╗╔╝╚╝║",
"╚╝─╚╝╚══╝╚╝───╚╝╚═╝╚═══╝╚═══╝"}

for i = 1, #logoandroid do
gpu.setForeground(0x00B600)
term.setCursor (xCen - 15, yCen - 5 + i)
print (logoandroid[i])
end



local j = 0
gpu.setBackground(0x66DB00)
while i < xCen+25 do
  term.setCursor(i,yCen+8)
  gpu.setForeground(0x000000)
  gpu.setBackground(0x66DB00)
  print(">") 
  j = j + 1
  if j > 18 then j = 18 end
  gpu.setForeground(foreg[j])
  gpu.setBackground(0x000000)
  term.setCursor(xCen-17, yCen+11)
  print ("Распространять только через дискету!")
  i=i+1
  os.sleep(0.0005)
end
--gpu.setBackground(0x1E1E1E)
os.sleep(0.01)
term.clear()

maxX, maxY = 100, 30

-- desktop (функция отрисовки рабочего стола)
function desk()
--xScr, yScr = gpu.getResolution()
if xScrM < maxX then
gpu.setResolution(xScrM, yScrM)
 maxX = xScrM
end
if yScrM < maxY then
gpu.setResolution(xScrM, yScrM)
 maxY = yScrM
end
gpu.setResolution(maxX,maxY)
xScr, yScr = gpu.getResolution()
xCen, yCen = math.ceil(xScr/2), math.ceil(yScr/2)
gpu.setBackground(0x2b2b2b)
term.clear()
ln = ""
for line = 1,xScr do
ln = ln.." "
end
--   ------------------------------- Хотбар  -------------
gpu.setBackground(0x708090)
gpu.fill(1,29,100,2," ")
gpu.setBackground(0xBEBEBE)
gpu.fill(1,29,4,2," ")
gpu.setBackground(0x778899)
gpu.fill(100,29,80,2," ")
--         ------------------------------------- иконка настроек -----------
gpu.setBackground(0x002440)
gpu.setForeground(0x00B600)
term.setCursor(xScr-27,1)
print ("║║║║║║")
gpu.setBackground(0x006DBF)
term.setCursor(xScr-27,3)
print ("║║║║║║")
term.setCursor(xScr-27,2)
gpu.setForeground(0x002440)
gpu.setBackground(0x00B600)
print ("option")
--  ------------------------------------------  текущее разрешение
gpu.setBackground(0x002440)
gpu.setForeground(0x00B600)
term.setCursor(xScr-40,1)
print ("╒═════════╕")
gpu.setBackground(0x006DBF)
term.setCursor(xScr-40,3)
print ("╘═DISPLAY═╛")
gpu.setForeground(0x00B600)
gpu.setBackground(0x004980)
term.setCursor(xScr-40,2)
print ("│         │")
term.setCursor(xScr-38,2)
gpu.setForeground(0x66FFFF)
local resdisp = ""..tostring(math.ceil(maxX)).." x "..tostring(math.ceil(maxY))
print (resdisp)
--                         ---------------------------        ---

tr1 = 1
gpu.setForeground(0xFFFFFF)
gpu.setBackground(0x334980)
--  -----  устаревшие элементы управления
--while tr1 < xScr-11 do
--term.setCursor(tr1,yScr-1)
--print (" ")
--tr1 = tr1 + 1
--end
-- gpu.setBackground(0x009240)
-- term.setCursor(1, yScr-1)
-- print ("Выход в консоль")
-- image.draw(xCen-10,2,oslogoup)
-- кнопка в углу
-- gpu.setForeground(0x000000)
-- gpu.setBackground(0x66DB00)
-- term.setCursor(1,1)
-- print ("ОПЦИИ")
-- ---------------------------        цикл отрисовки иконок и подписей к ним
local i=1
local mn = 1
  while i < #desk1+1 do
-- -----     перенос каждого следующего столбца на 15 символов вправо
if i == 1 then xtmp = 4 + dop end
if i == 4 then xtmp,mn = 18 + dop + dop,1 end
if i == 7 then xtmp,mn = 32 + dop + dop + dop,1 end
if i == 10 then xtmp,mn = 46 + dop + dop + dop + dop,1 end
ytmp = mn * 6
desk4[i] = ytmp+0
desk5[i] = xtmp+0
--print(desk4[i],desk5[i])
imgtmp = "/ProgramFiles/IconsPic/"..desk1[i]
local desktmp = image.load(imgtmp)
image.draw(xtmp,ytmp,desktmp)
term.setCursor(xtmp-2,ytmp+4)
gpu.setBackground(0x3392BF)
gpu.setForeground(0x1E1E1E)
print(desk3[i])
  mn = mn + 1
  i=i+1
  end
  
--gpu.setBackground(0x5A5A5A)
end

-- функция проверки клика по менюшке с настройками (разрешение и прочее)
function optionsm()
os.sleep(1)
local event, _, xmou2, ymou2 = event.pull(15)
   if event == "touch" then
    if ymou2 == 15 and xmou2 < 40 then

    local mainContainer2 = GUI.container(1, 1, 50, 23)
mainContainer2:addChild(GUI.panel(1, 2, 45, 22, 0x2D2D2D))

local textBox = mainContainer2:addChild(GUI.textBox(2, 2, xCen + 25, 22, 0xEEEEEE, 0x2D2D2D, {}, 1, 1, 0))
mainContainer2:addChild(GUI.button(40, 3, 8, 3, 0x336DBF, 0xEEEEEE, 0xEEEEEE, 0x336DBF, "Exit")).onTouch = function()
mainContainer2:stopEventHandling()
buffer.clear(0x0)
buffer.draw(true)
end
local vers = {
" ",
" ",
"Версия 2.0 (Андроид) ",
"- Поддержка предыдущих версий прекращена ",
"- Изменены элементы интерфейса",
"- Заменен загрузчик и инсталлятор",
"- Заменены логотипы",
"- Переделан основной исполняемый файл",
"- Убраны устаревшие программы",
"- Добавлены функции в настройках",
"- Загрузка перенесена с Pastebin на GitHub",
"- Добавлено отображение заряда батареи"}
table.insert(textBox.lines, {text = "Информация о графической оболочки", color = 0x880000})
 local v = 1
 while v < #vers+1 do 
 table.insert(textBox.lines, vers[v])
 v = v+1
 end
mainContainer2:draw()
buffer.draw(true)
mainContainer2:startEventHandling()
	elseif ymou2 == 18 and xmou2 < 40 then
	 shell.execute("cd //")
     shell.execute("/Sys64/exit.lua")
	end
   end
end

-- первоначальная функция проверки клика по объекту(далее перенесена в основное тело)

-- proverka klika
-- function touchwtf()
-- print(xmou, ymou)
-- i=1
--   while i < #desk1+1 do
--       ytou = desk4[i]+0
--       xtou = desk5[i]+0
--       --if ymou >= ytou and ymou <= ytou+4 and xmou >= xtou and xmou <= xtou+8 then
--       if ymou == 1 and xmou == 1 then
-- exityn = "exit"
--       --shell.execute("/ProgramFiles/"..desk2[i])
--       end
--   i=i+1
--   end
-- end


-- тело программы, проверка клика по иконкам, запуск 

while exityn ~= 2 do
  desk()
  if qt ~= 1 then exityn = 2 end
  ::menu::
  local event, _, xmou, ymou = event.pull(15)

  if event == "touch" then 

-- контекстное меню для настроек оболочки

   if ymou < 4 then
 gpu.setBackground(0x1E1E1E)
 gpu.setForeground(0xCCDBBF)
term.setCursor(1,1)
print ("╔═════════════════════════════════════════╗")
print ("║   OS                                    ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("║                                         ║")
print ("╠═════════════════════════════════════════╣")
print ("║Информация о GUI                         ║")
print ("║Проводник (Файловый менеджер)            ║")
print ("╠═════════════════════════════════════════╣")
print ("║Выключение компьютер                     ║")
print ("╚═════════════════════════════════════════╝")
optionsm()
  end
      i=1
       while i < #desk1+1 do
-- print (xmou,ymou)
yt = desk4[i]-0
xt = desk5[i]-0
         if ymou >= yt and ymou <= yt+4 and xmou >= xt and xmou <= xt+8 then
         shell.execute(desk2[i])
         end
       i=i+1
      end
   else goto menu
   end
end

gpu.setBackground(0x000000)
gpu.setForeground(0xFFFFFF)
term.clear()
print ("(Чтобы запустить ОС в командной строке набери ProgramFiles.lua)")
