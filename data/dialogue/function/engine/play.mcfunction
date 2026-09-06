# Очищаем предыдущую запланированную задачу, если предыдущий диалог ещё печатался
schedule clear dialogue:engine/tick

# Убеждаемся, что задача скорборда существует и базовые настройки заданы
scoreboard objectives add dialogue_engine dummy
execute unless data storage dialogue:settings delay run data modify storage dialogue:settings delay set value 2
execute unless data storage dialogue:settings sound run data modify storage dialogue:settings sound set value 1
execute unless data storage dialogue:settings color run data modify storage dialogue:settings color set value "white"
execute unless data storage dialogue:settings bold run data modify storage dialogue:settings bold set value false
execute unless data storage dialogue:settings italic run data modify storage dialogue:settings italic set value false
execute unless data storage dialogue:settings underlined run data modify storage dialogue:settings underlined set value false
execute unless data storage dialogue:settings font run data modify storage dialogue:settings font set value "minecraft:default"
execute unless data storage dialogue:settings speaker_color run data modify storage dialogue:settings speaker_color set value "gold"
execute store result score #sound dialogue_engine run data get storage dialogue:settings sound

# Копируем текст в активный буфер
data modify storage dialogue:active text set from storage dialogue:engine text

# Вычисляем длину текста из активного буфера
execute store result score #len dialogue_engine run data get storage dialogue:active text

# Если текста нет или он пустой — выходим
execute if score #len dialogue_engine matches ..0 run return 0

# Подготавливаем стили для текущей реплики
execute if data storage dialogue:engine color run data modify storage dialogue:active color set from storage dialogue:engine color
execute unless data storage dialogue:engine color run data modify storage dialogue:active color set from storage dialogue:settings color

execute if data storage dialogue:engine bold run data modify storage dialogue:active bold set from storage dialogue:engine bold
execute unless data storage dialogue:engine bold run data modify storage dialogue:active bold set from storage dialogue:settings bold

execute if data storage dialogue:engine italic run data modify storage dialogue:active italic set from storage dialogue:engine italic
execute unless data storage dialogue:engine italic run data modify storage dialogue:active italic set from storage dialogue:settings italic

execute if data storage dialogue:engine underlined run data modify storage dialogue:active underlined set from storage dialogue:engine underlined
execute unless data storage dialogue:engine underlined run data modify storage dialogue:active underlined set from storage dialogue:settings underlined

execute if data storage dialogue:engine font run data modify storage dialogue:active font set from storage dialogue:engine font
execute unless data storage dialogue:engine font run data modify storage dialogue:active font set from storage dialogue:settings font

execute if data storage dialogue:engine speaker run data modify storage dialogue:active speaker set from storage dialogue:engine speaker
execute unless data storage dialogue:engine speaker run data modify storage dialogue:active speaker set value ""

execute if data storage dialogue:engine speaker_color run data modify storage dialogue:active speaker_color set from storage dialogue:engine speaker_color
execute unless data storage dialogue:engine speaker_color run data modify storage dialogue:active speaker_color set from storage dialogue:settings speaker_color

# Очищаем входные параметры в dialogue:engine
data remove storage dialogue:engine text
data remove storage dialogue:engine color
data remove storage dialogue:engine bold
data remove storage dialogue:engine italic
data remove storage dialogue:engine underlined
data remove storage dialogue:engine font
data remove storage dialogue:engine speaker
data remove storage dialogue:engine speaker_color

# Сбрасываем счетчик символов
scoreboard players set #idx dialogue_engine 0

# Настройка времени actionbar: мгновенное появление символа (0t), удержание (80t = 4с), плавное исчезновение (10t)
title @a times 0 80 10

# Запускаем первый тик
function dialogue:engine/tick
