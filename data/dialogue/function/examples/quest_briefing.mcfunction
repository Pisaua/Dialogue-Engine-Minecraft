# Пример реплики: квестовое задание
# Запуск одной командой: /function dialogue:examples/quest_briefing

data modify storage dialogue:engine speaker set value "Диспетчер"
data modify storage dialogue:engine speaker_color set value "gold"
data modify storage dialogue:engine text set value "Внимание! Найди терминал связи в главном ангаре."
data modify storage dialogue:engine color set value "yellow"
data modify storage dialogue:engine italic set value true
function dialogue:engine/play
