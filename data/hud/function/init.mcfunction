# Создание и инициализация HUD скорборда задач
scoreboard objectives add quest_hud dummy

# Установка заголовка скорборда в виде текстуры-бэкграунда \uA033
scoreboard objectives modify quest_hud displayname {"text":"\uA033"}

# Полное скрытие красных цифр справа
scoreboard objectives modify quest_hud numberformat blank

# Скрытие боковой панели при входе в мир (HUD появится только при установке задачи)
scoreboard objectives setdisplay sidebar
