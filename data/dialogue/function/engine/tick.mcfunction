# Увеличиваем индекс текущего символа на 1
scoreboard players add #idx dialogue_engine 1

# Записываем текущий индекс в активный буфер для макроса step
execute store result storage dialogue:active current_index int 1 run scoreboard players get #idx dialogue_engine

# Выполняем шаг отображения с данными из dialogue:active
function dialogue:engine/step with storage dialogue:active
