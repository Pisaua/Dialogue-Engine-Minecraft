# Запуск реплики Доктора в одну строку:
# function dialogue:characters/doctor {text:"Ваш текст"}
function dialogue:presets/doctor
$data modify storage dialogue:engine text set value "$(text)"
function dialogue:engine/play
