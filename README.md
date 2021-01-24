# Pyrogram docker image

Короче, тут типа должно быть какое-то описание (еще и на инглише как бы), но мне максимально лень, потому оформлю на русском в виде QA

### Q: Как передать API ID и API hash?
A: Переменные среды. API_ID и API_HASH соответственно.

### Q: Я могу войти в свой аккаунт запуская докер образ, а не передавая заранее готовую сессию?
A: Да, для этого надо один раз запустить контейнер с флагами `-it` и без флага `-d`.

### Q: Что с сохранением сессий?
A: Все сессии сохраняются в /sessions внутри контейнера. При запуске монтируйте туда volume/директорию чтобы не терять сессии. Если в /sessions ничего не монтируется, докер сам создаст volume.

### Q: Как насчет использования одного volume для нескольких сессий?
A: Без проблем, просто укажите уникальное значение для переменной среды SESSION_NAME, значением этой переменной будет назван файл сессии.

### Q: На докерхабе образ не обнавляется. Там старая версия pyrogram?
A: Нет. Pyrogram устанавливается при запуске контейнера, это значит, что обновление pyrogram не требует обновления образа, для обновления pyrogram достаточно лишь пересоздать контейнер.

### Q: Куда мне деть свой код бота? Мне надо пересоздавать образ? Какой тогда смысл?
A: У pyrogram есть [Smart Plugins](https://docs.pyrogram.org/topics/smart-plugins). Оформляем код в виде плагинов, директорию с ними монтируем в `/plugins`.

### Q: Как мне установить допольнительные зависимости?
A: примонтировать requirements.txt в `/requirements.txt`.

### Q: Готовые примеры запуска есть:
A:

 - Запуск контейнера чтобы залогиниться: `docker run -it -v $PWD/requirements.txt:/requirements.txt -v $PWD/plugins/:/plugins/ -v pyrogram_sessions_volume:/sessions -e API_ID=12345 -e API_HASH='12345abcde' -e SESSION_NAME='my_account' justpieceofmeat/pyrogram:git`

 - Запуск контейнера в фоне: `docker run -d -v $PWD/requirements.txt:/requirements.txt -v $PWD/plugins/:/plugins/ -v pyrogram_sessions_volume:/sessions -e API_ID=12345 -e API_HASH='12345abcde' -e SESSION_NAME='my_account' justpieceofmeat/pyrogram:git`

 -  docker-compose:
 ```yaml
 version: '3.8'
 
 volumes:
  sessions:
 
 services:
   pyrogram:
     image: justpieceofmeat/pyrogram:git
     volumes:
       - sessions:/sessions/
       - ./plugins/:plugins/
       - ./requirements.txt:/requirements.txt
     environment:
       - API_ID=12345
       - API_HASH=12345abcde
       - SESSION_NAME=my_account
 ```
