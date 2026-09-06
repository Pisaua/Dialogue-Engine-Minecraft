# Запуск реплики Неизвестного в одну строку:
# function dialogue:characters/unknown {text:"Ваш текст"}
function dialogue:presets/unknown
$data modify storage dialogue:engine text set value "$(text)"
function dialogue:engine/play
