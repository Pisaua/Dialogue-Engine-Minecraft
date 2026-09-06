# Настройка скорости печати (задержка в тиках между символами)
# Использование: function dialogue:engine/speed {delay:2}
$data modify storage dialogue:settings delay set value $(delay)
$scoreboard players set #speed dialogue_engine $(delay)
