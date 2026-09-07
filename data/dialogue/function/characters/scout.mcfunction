# Запуск реплики Разведчицы (женский голос):
# function dialogue:characters/scout {text:"Ваш текст"}
function dialogue:presets/scout
$data modify storage dialogue:engine text set value "$(text)"
function dialogue:engine/play
