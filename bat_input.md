В bat-файлах Windows для ввода значения переменной с клавиатуры используется команда `set /p`. Вот различные способы:

## 1. Базовый ввод

```batch
@echo off
set /p VARIABLE=Введите значение: 
echo Вы ввели: %VARIABLE%
```

## 2. Ввод с переносом строки

```batch
@echo off
echo Введите значение:
set /p VARIABLE=
echo Вы ввели: %VARIABLE%
```

## 3. Ввод с проверкой на пустоту

```batch
@echo off
:input
set /p NAME=Введите ваше имя: 
if "%NAME%"=="" (
    echo Имя не может быть пустым!
    goto input
)
echo Привет, %NAME%!
```

## 4. Ввод пароля (без отображения вводимых символов)

```batch
@echo off
set /p PASSWORD=Введите пароль: 
echo Пароль принят (длина: %PASSWORD:~0,1%***)
```

## 5. Ввод числа с валидацией

```batch
@echo off
:input_number
set /p AGE=Введите ваш возраст: 

echo %AGE%|findstr /r "^[0-9]*$">nul
if errorlevel 1 (
    echo Ошибка! Введите число.
    goto input_number
)

echo Ваш возраст: %AGE%
```

## 6. Выбор из вариантов

```batch
@echo off
:menu
echo Выберите действие:
echo 1 - Запустить программу
echo 2 - Настройки
echo 3 - Выход
set /p CHOICE=Ваш выбор: 

if "%CHOICE%"=="1" goto run
if "%CHOICE%"=="2" goto settings
if "%CHOICE%"=="3" goto exit

echo Неверный выбор! Попробуйте снова.
goto menu

:run
echo Запуск программы...
goto end

:settings
echo Открытие настроек...
goto end

:exit
echo Выход...

:end
pause
```

## 7. Ввод нескольких переменных

```batch
@echo off
set /p NAME=Введите имя: 
set /p AGE=Введите возраст: 
set /p CITY=Введите город: 

echo Данные пользователя:
echo Имя: %NAME%
echo Возраст: %AGE%
echo Город: %CITY%
```

## 8. Ввод с значением по умолчанию

```batch
@echo off
set DEFAULT_NAME=Пользователь
set /p NAME=Введите имя [%DEFAULT_NAME%]: 
if "%NAME%"=="" set NAME=%DEFAULT_NAME%
echo Привет, %NAME%!
```

## 9. Ввод пути к файлу

```batch
@echo off
:input_path
set /p FILEPATH=Введите путь к файлу: 
if not exist "%FILEPATH%" (
    echo Файл не существует!
    goto input_path
)
echo Файл найден: %FILEPATH%
```

## 10. Комплексный пример с обработкой

```batch
@echo off
echo === Регистрация пользователя ===

:input_name
set /p USERNAME=Введите логин: 
if "%USERNAME%"=="" (
    echo Логин не может быть пустым!
    goto input_name
)

:input_email
set /p EMAIL=Введите email: 
if "%EMAIL%"=="" (
    echo Email не может быть пустым!
    goto input_email
)

echo Регистрация завершена!
echo Логин: %USERNAME%
echo Email: %EMAIL%

pause
```

## Особенности команды `set /p`:

- **`/p`** - параметр для ввода с клавиатуры
- **Синтаксис**: `set /p variable=prompt_text`
- Если пользователь просто нажмет Enter, переменная сохранит предыдущее значение (или будет пустой)
- Для очистки переменной перед вводом используйте `set variable=`
- Текст приглашения можно не указывать: `set /p variable=`

## Пример с очисткой переменной:

```batch
@echo off
set NAME=
set /p NAME=Введите имя: 
echo Здравствуйте, %NAME%!
```

Этот метод позволяет создавать интерактивные bat-файлы с пользовательским вводом данных.