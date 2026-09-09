# Установка задачи в HUD с заголовком "Цель"
# Использование: function hud:set {task:"Ваш текст"}

# Очищаем старые строки
function hud:clear

# Строка заголовка "Цель" со шрифтом bold
scoreboard players display name hud_title quest_hud {"text":"  Цель","font":"bold","color":"gold"}
scoreboard players set hud_title quest_hud 15

# Строка задачи со шрифтом bold
$scoreboard players display name hud_task_1 quest_hud {"text":"  $(task)","font":"bold","color":"white"}
scoreboard players set hud_task_1 quest_hud 14

# Нижняя строка-распорка для идеального совпадения по высоте с task.png (42px)
scoreboard players display name hud_spacer quest_hud {"text":" "}
scoreboard players set hud_spacer quest_hud 13

# Пустые строки снизу, выталкивающие весь скорборд в верхний угол экрана
function hud:engine/apply_pads

# Включаем отображение в sidebar
scoreboard objectives setdisplay sidebar quest_hud
