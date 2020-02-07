local success, reason = pcall(loadfile("start.lua")); if not success then print("Ошибка: " .. tostring(reason)) end
