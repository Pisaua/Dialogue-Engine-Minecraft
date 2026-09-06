# Извлекаем срез текста от 0 до $(current_index)
$data modify storage dialogue:active current_text set string storage dialogue:active text 0 $(current_index)

# Отображаем накопившийся текст в actionbar без кавычек и со стилями
execute if data storage dialogue:active {speaker:""} run function dialogue:engine/display_plain with storage dialogue:active
execute unless data storage dialogue:active {speaker:""} run function dialogue:engine/display_speaker with storage dialogue:active

# Воспроизводим звук пишущей машинки (если звук включен)
execute if score #sound dialogue_engine matches 1 as @a at @s run playsound minecraft:block.note_block.hat ambient @s ~ ~ ~ 0.25 1.9

# Если ещё не дошли до конца строки, планируем следующий символ
execute if score #idx dialogue_engine < #len dialogue_engine run function dialogue:engine/schedule_next with storage dialogue:settings
