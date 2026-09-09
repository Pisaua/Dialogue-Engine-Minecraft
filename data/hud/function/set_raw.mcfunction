# Установка строки задания БЕЗ слова "Цель"
# Использование: function hud:set_raw {task:"Ваш текст"}

function hud:clear

$scoreboard players display name hud_task_1 quest_hud {"text":"  $(task)","font":"bold","color":"white"}
scoreboard players set hud_task_1 quest_hud 1

scoreboard objectives setdisplay sidebar quest_hud
