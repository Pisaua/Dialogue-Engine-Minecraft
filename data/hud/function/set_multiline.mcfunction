# Установка задачи из двух строк в HUD
# Использование: function hud:set_multiline {line1:"Главная цель", line2:"Дополнительно"}

# Очищаем старые строки
function hud:clear

# Строка заголовка "Цель"
scoreboard players display name hud_title quest_hud {"text":"  Цель","font":"bold","color":"gold"}
scoreboard players set hud_title quest_hud 15

# Первая строка задачи
$scoreboard players display name hud_task_1 quest_hud {"text":"  $(line1)","font":"bold","color":"white"}
scoreboard players set hud_task_1 quest_hud 14

# Вторая строка задачи
$scoreboard players display name hud_task_2 quest_hud {"text":"  $(line2)","font":"bold","color":"gray"}
scoreboard players set hud_task_2 quest_hud 13

# Пустые строки снизу, выталкивающие весь скорборд в верхний угол экрана
function hud:engine/apply_pads

# Включаем отображение в sidebar
scoreboard objectives setdisplay sidebar quest_hud
