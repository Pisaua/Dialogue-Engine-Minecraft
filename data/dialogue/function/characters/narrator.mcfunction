# Запуск мыслей/повествования в одну строку:
# function dialogue:characters/narrator {text:"Ваш текст"}
function dialogue:presets/narrator
$data modify storage dialogue:engine text set value "$(text)"
function dialogue:engine/play
