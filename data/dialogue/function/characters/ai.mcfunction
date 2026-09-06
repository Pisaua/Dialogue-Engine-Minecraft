# Запуск реплики ИИ в одну строку:
# function dialogue:characters/ai {text:"Ваш текст"}
function dialogue:presets/ai
$data modify storage dialogue:engine text set value "$(text)"
function dialogue:engine/play
