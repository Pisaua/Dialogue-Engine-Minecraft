# Запуск реплики Охранника в одну строку:
# function dialogue:characters/guard {text:"Ваш текст"}
function dialogue:presets/guard
$data modify storage dialogue:engine text set value "$(text)"
function dialogue:engine/play
