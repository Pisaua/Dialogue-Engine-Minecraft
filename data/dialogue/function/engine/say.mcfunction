# Макрос для вызова реплики с текстом в аргументах
# Использование: function dialogue:engine/say {text:"Ваш текст"}
$data modify storage dialogue:engine text set value "$(text)"

# Запуск посимвольного вывода
function dialogue:engine/play
