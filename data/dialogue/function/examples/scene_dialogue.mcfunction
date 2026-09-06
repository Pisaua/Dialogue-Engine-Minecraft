# Пример сцены диалога между двумя персонажами
# Запуск одной командой: /function dialogue:examples/scene_dialogue

# Шаг 1: Говорит Охранник
function dialogue:characters/guard {text:"Стой! Кто приближается к воротам убежища?"}

# Шаг 2: Через 90 тиков (4.5 секунды) запускается ответ Доктора
schedule function dialogue:examples/scene_dialogue_p2 90t replace
