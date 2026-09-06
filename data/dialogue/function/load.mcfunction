# Инициализация скорборда
scoreboard objectives add dialogue_engine dummy

# Настройки по умолчанию (если ещё не заданы)
execute unless data storage dialogue:settings delay run data modify storage dialogue:settings delay set value 2
execute unless data storage dialogue:settings sound run data modify storage dialogue:settings sound set value 1
execute unless data storage dialogue:settings color run data modify storage dialogue:settings color set value "white"
execute unless data storage dialogue:settings bold run data modify storage dialogue:settings bold set value false
execute unless data storage dialogue:settings italic run data modify storage dialogue:settings italic set value false
execute unless data storage dialogue:settings underlined run data modify storage dialogue:settings underlined set value false
execute unless data storage dialogue:settings font run data modify storage dialogue:settings font set value "minecraft:default"
execute unless data storage dialogue:settings speaker_color run data modify storage dialogue:settings speaker_color set value "gold"

# Синхронизация значений
execute store result score #sound dialogue_engine run data get storage dialogue:settings sound
execute store result score #speed dialogue_engine run data get storage dialogue:settings delay
