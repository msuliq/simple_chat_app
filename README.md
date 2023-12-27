# README

Для запуска приложения необходимо:
  Скачать репозиторий и перейти в директорию `simple_chat_app`
  Выполнить команду `bundle install` для установки всех зависимостей.
  Для работы приложения необходим запущенный Redis сервер. Можно установить его с помощью Homebrew и запустить командой `brew services start redis`.
  Выполнить команду `rails db:migrate`.
  Выполнить команду `rails s` для запуска сервера.
  Приложение доступно по адресу `http://localhost:3000` и `https://localhost:3001`

Для проверки пуш уведомлений необходимо открыть программу в `https://localhost:3001` и принять разрешение на отправку уведомлений нажав на соответствующую кнопку на главной странице.

Выполнено на основании следующего задания:

```
Нужно сделать веб-приложение - простой онлайн-чат на Rails 7 с использованием технологии Hotwire - Turbo.

Что нужно сделать:

- на главной странице должен быть список созданных чатов и возможность создать новый
- любой пользователь может создать новый чат, при создании указать его название
- любой пользователь может зайти в любой чат, увидеть историю переписки и отправить своё сообщение
- после отправки сообщения у всех пользователей, у которых открыт чат, должно появиться новое сообщение в чате
- при получении нового сообщения должно появиться уведомление со звуком, в котором будет название чата и текст сообщения (дизайн и расположение - по желанию)
- добавить API-метод для получения всех созданных чатов
- добавить API-метод для создания сообщений в чате (для упрощения сообщения можно сделать анонимные, а API-метод полностью публичным, то есть любой запрос из интернета может создать анонимное сообщение без авторизации)
```
