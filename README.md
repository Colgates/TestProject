# TestProject

Тестовое задание
Данный сервис представляет собой мини-сервис новостей.

Есть список категорий новостей.
В каждой категории есть список новостей, отдаваемых в коротком виде.
Каждую новость можно запросить в полном виде, чтобы получить html содержимое.

В зависимости от платформы задача заключается в следующем:

Backend:
Нужно в точности повторить описанное ниже API.

Frontend (javascript), iOS, Android:
Нужно использовать описанное ниже API.
Нужно создать приложение (SPA приложение в случае frontend, нативное мобильное приложение в случае iOS и Android), в котором на первом экране отображается список категорий новостей, при нажатии на категорию новости происходит переход к списку новостей (обязательно с пейджингом), при нажатии на конкретную новость должен происходить переход к экрану просмотра новости (обратите внимание, что текст новости содержит html).

В списке категорий должны отображаться только названия категорий.
В списке новостей у каждой новости должны отображаться название, дата, короткое описание.
На экране новости должны отображаться название и короткое описание (сразу), после подгрузки полных данных - должно добавиться полное описание.
Требований к красоте нет. Главное, чтобы функционал совпадал с описанным.
