# Запуск реплики Радио в одну строку:
# function dialogue:characters/radio {text:"Ваш текст"}
function dialogue:presets/radio
$data modify storage dialogue:engine text set value "$(text)"
function dialogue:engine/play
