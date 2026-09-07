# Отмена запланированного тика
schedule clear dialogue:engine/tick

# Очистка полосы действия
title @a actionbar ""

# Сброс индекса и очистка активного текста
scoreboard players set #idx dialogue_engine 0
data remove storage dialogue:active text
data remove storage dialogue:active current_text
data remove storage dialogue:active gender
