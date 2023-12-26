# README

Download the repo and go the directory `simple_chat_app`
Run `bundle install` to install all dependencies.
You have to a running Redis server for the app. You can install it with Homebrew and have it running with `brew services start redis`.
Run `rails db:migrate`.
Run `rails s` to start the server
Application is available on localhost `http://localhost:3000`

Implemented based on the following requirements:

```
Нужно сделать веб-приложение - простой онлайн-чат на Rails 7 с использованием технологии Hotwire - Turbo.

Что нужно сделать:

- на главной странице должен быть список созданных чатов и возможность создать новый
- любой пользователь может создать новый чат, при создании указать его название
- любой пользователь может зайти в любой чат, увидеть историю переписки и отправить своё сообщение
- после отправки сообщения у всех пользователей, у которых открыт чат, должно появиться новое сообщение в чате
- при получении нового сообщения должно появиться уведомление со звуком, в котором будет название чата и текст сообщения (дизайн и расположение - по желанию)
- добавить API-метод для получения всех созданных чатов
- добавить API-метод для создания сообщений в чате (для упрощения сообщения можно сделать анонимные, а API-метод полностью публичным, то есть любой запрос из интернета может создать анонимное сообщение без авторизации),
```
