# 📜 Руководство по Dialogue Engine
By: Bereza Studio

---

## 🧭 Содержание
1. [Быстрый старт (Проверка в игре)](#1-быстрый-старт)
2. [Команды управления и их назначение](#2-команды-управления)
3. [Готовые персонажи (Вызов в 1 строчку)](#3-готовые-персонажи)
4. [Как создать свою реплику](#4-как-создать-свою-реплику)
5. [Как создать нового персонажа](#5-как-создать-нового-персонажа)
6. [Как создавать кат-сцены (диалог двух и более героев)](#6-диалоги-и-кат-сцены)
7. [Таблица стилей (Цвета, HEX, шрифты)](#7-таблица-стилей)

---

## 1. Быстрый старт

1. Зайдите в ваш мир в игре.
2. Введите команду обновления дата-паков:
   ```mcfunction
   /reload
   ```
3. Запустите тестовую фразу:
   ```mcfunction
   /function dialogue:test
   ```
   *Текст начнёт печататься по букве каждые 2 тика в полосе действия (actionbar) с мягким звуком щелчков клавиш и без лишних кавычек.*

---

## 2. Команды управления

Здесь перечислены все команды, которые нужны вам при создании карты. Внутренние технические файлы системы трогать не требуется.

| Команда | Что она делает |
| :--- | :--- |
| `/function dialogue:test` | Быстрый тест диалоговой системы базовым текстом. |
| `/function dialogue:engine/say {text:"Ваш текст"}` | Быстрый вывод любого текста на лету (из чата, командного блока или триггера) без создания файлов. |
| `/function dialogue:engine/stop` | Мгновенно прерывает текущую печать и очищает экран игрока. Полезно при пропуске диалога или смерти игрока. |
| `/function dialogue:engine/sound_off` | Полностью отключает звук щелчков клавиш при печати. |
| `/function dialogue:engine/sound_on` | Включает звук щелчков клавиш обратно. |
| `/function dialogue:engine/speed {delay:1}` | Сверхбыстрая печать (1 тик на букву). |
| `/function dialogue:engine/speed {delay:2}` | Стандартная комфортная скорость (2 тика на букву, стоит по умолчанию). |
| `/function dialogue:engine/speed {delay:3}` | Медленная кинематографичная печать (3 тика на букву). |

---

## 3. Готовые персонажи

Чтобы не настраивать цвета и префиксы каждый раз вручную, используйте готовые заготовки. Их можно вызывать в любом файле карты или командном блоке:

```mcfunction
# 1. Охранник (Золотое имя [Охранник], чистый белый текст)
function dialogue:characters/guard {text:"Стой! Предъяви пропуск."}

# 2. Доктор (Бирюзовое имя [Доктор], белый текст)
function dialogue:characters/doctor {text:"Тебе нужно принять антирадин, выживший."}

# 3. Радиосвязь / Диспетчер (Красное имя [Радио], жёлтый курсив)
function dialogue:characters/radio {text:"Внимание всем постам! Надвигается кислотная буря."}

# 4. Бортовой ИИ / Терминал (Темно-бирюзовое имя [ИИ], жирный бирюзовый текст)
function dialogue:characters/ai {text:"Системы жизнеобеспечения функционируют в штатном режиме."}

# 5. Мысли героя / Повествование (Без префикса, атмосферный серый курсив)
function dialogue:characters/narrator {text:"Кажется, в этой лаборатории давно никого не было..."}

# 6. Таинственный голос / Аномалия (Фиолетовое имя [???], фиолетовый курсив)
function dialogue:characters/unknown {text:"Ты не должен был сюда приходить..."}

# 7. Разведчица (Женский голос — более высокий тон щелчков клавиш)
function dialogue:characters/scout {text:"Периметр чист, мутантов не обнаружено."}
```

---

## 4. Как создать свою реплику

### Где создавать:
В папке дата-пака: `data/dialogue/function/`  
(Для порядка можно создавать подпапки, например: `data/dialogue/function/quests/` или `data/dialogue/function/chapter1/`).

### Создание файла:
1. Создайте файл с любым именем и расширением `.mcfunction`, например: `bunker_enter.mcfunction`.
2. Внутри файла напишите:

**Вариант А (Через готового персонажа — самый удобный):**
```mcfunction
function dialogue:characters/guard {text:"Добро пожаловать в бункер. Сдай оружие на входе."}
```

**Вариант Б (С индивидуальной ручной настройкой оформления):**
```mcfunction
# Имя персонажа и цвет префикса:
data modify storage dialogue:engine speaker set value "Механик"
data modify storage dialogue:engine speaker_color set value "gold"

# Настройки стиля текста:
data modify storage dialogue:engine color set value "yellow"
data modify storage dialogue:engine italic set value true
data modify storage dialogue:engine bold set value false

# Сам текст:
data modify storage dialogue:engine text set value "Генератор снова заглох, принеси мне предохранитель."

# Команда запуска анимации:
function dialogue:engine/play
```

3. В игре введите `/reload`.
4. Запустите реплику **ровно одной командой**:
   ```mcfunction
   /function dialogue:bunker_enter
   ```
   *(или `/function dialogue:quests/bunker_enter`, если файл лежит в подпапке `quests`)*.

---

## 5. Как создать нового персонажа

Если вам нужен постоянный герой (например, Торговец, Полковник, Мутант), создайте для него заготовку за 2 шага:

### Шаг 1: Создайте файл стиля
В папке `data/dialogue/function/presets/` создайте файл с именем персонажа, например `trader.mcfunction`:
```mcfunction
data modify storage dialogue:engine speaker set value "Торговец"
data modify storage dialogue:engine speaker_color set value "green"
data modify storage dialogue:engine color set value "yellow"
data modify storage dialogue:engine italic set value false
data modify storage dialogue:engine bold set value false
```

### Шаг 2: Создайте файл вызова
В папке `data/dialogue/function/characters/` создайте файл с таким же именем: `trader.mcfunction`:
```mcfunction
function dialogue:presets/trader
$data modify storage dialogue:engine text set value "$(text)"
function dialogue:engine/play
```

После однократного `/reload` новый персонаж готов! Вызывайте его где угодно:
```mcfunction
function dialogue:characters/trader {text:"У меня есть патроны и чистая вода. Что предложишь взамен?"}
```

---

## 6. Диалоги и кат-сцены

Чтобы сделать диалог между двумя и более героями, где они говорят по очереди:

1. **Создайте файл первой части сцены** (например, `scene_gate.mcfunction`):
   ```mcfunction
   # Реплика 1: говорит Охранник
   function dialogue:characters/guard {text:"Стой! Кто приближается к воротам убежища?"}

   # Пауза (90 тиков = 4.5 секунды), пока фраза печатается и игрок её читает, затем запуск ответа:
   schedule function dialogue:scene_gate_reply 90t replace
   ```

2. **Создайте файл второй части** (`scene_gate_reply.mcfunction`):
   ```mcfunction
   # Реплика 2: отвечает Доктор
   function dialogue:characters/doctor {text:"Опусти оружие, боец! Это доктор Браун, со мной раненый."}
   ```

3. **Запуск всей сцены**:
   ```mcfunction
   /function dialogue:scene_gate
   ```

---

## 7. Таблица стилей

Вы можете использовать следующие параметры при ручной настройке:

| Параметр | Возможные значения | Описание |
| :--- | :--- | :--- |
| `color` | `"white"`, `"yellow"`, `"gold"`, `"aqua"`, `"red"`, `"green"`, `"gray"`, либо HEX: `"#FF5555"`, `"#38B6FF"` | Цвет букв субтитров |
| `bold` | `true` / `false` | Жирный шрифт |
| `italic` | `true` / `false` | Курсив |
| `underlined` | `true` / `false` | Подчёркнутый текст |
| `font` | `"minecraft:default"`, `"minecraft:uniform"` (тонкий сглаженный шрифт), `"minecraft:alt"` (руны) | Шрифт текста |
| `speaker` | Любой текст: `"Командир"`, `"Диспетчер"`, `"Система"` | Имя персонажа в квадратных скобках перед репликой |
| `speaker_color` | Любой цвет/HEX (`"gold"`, `"red"`, `"#FFAA00"`) | Цвет имени персонажа |
| `gender` | `"male"` (по умолчанию) / `"female"` | Пол персонажа. `"male"` — обычный щелчок клавиш, `"female"` — высокий тон щелчков |


Рекомендую ознакомиться с проектом тщательно перед использованием во избежание ошибок при работе с дата-паком.