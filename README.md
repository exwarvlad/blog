# Блог  
https://thetestappblog.herokuapp.com

## Описание
Тестовое приложение, сделанно специально, для [MassMedia Group](https://massmediagroup.pro/)  

Приложение использует гем `pusher`, для создания каналов на комментируемых страницах, что бы обеспечить создание
 комментариев в реальном времени  
 
Файлы постов хранятся на облачном хранилище Amazon S3  
Связь с хранилищем происходит через гем `fog-aws`  

Категории и посты разбиты на страницы. Не более 8 на каждой с помощью гема `kaminari`    
В данной версии комментарии создаются простынёй без пагинации :(  

## Как развернуть

Вам потребуется добавить такие переменные окружения:  

[Pusher](https://pusher.com)  

```yaml
pusher_app_id
pusher_key
pusher_secret
pusher_cluster
```

[Amazon S3](https://aws.amazon.com/s3/)

```yaml
S3_ACCESS_KEY
S3_SECRET_KEY
S3_BUCKET_NAME
```

PostgreSQL

```yaml
username
password
database
```

Создать базу данных `rails db:create`  
Накатить миграции `rails db:migrate`  
Создать тестовые категории и посты `rails db:seed`