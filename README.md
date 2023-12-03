# Currency Exchange App

### Описание
Это приложение Ruby on Rails для отслеживания и отображения курсов валютных обменов.

### Требования
- Версия Ruby 3.2.2
- Версия Rails 7.1.2

### Инструкции по установке
1. Клонировать репозиторий:
   ```bash
   git clone https://github.com/SKOLIA0/currency_exchange_app.git
   ```
2. Перейти в директорию приложения:
   ```bash
   cd currency_exchange_app
   ```
3. Создать базу данных:
   ```bash
   rails db:create
   ```
4. Выполнить миграцию базы данных:
   ```bash
   rails db:migrate
   ```
5. Генерировать тестовые данные (запустить скрипт `generate_seeds.rb`):
   ```bash
   ruby generate_seeds.rb
   ```
6. Заполнить базу данных:
   ```bash
   rails db:seed
   ```
7. Запустить сервер Rails:
   ```bash
   rails server
   ```

### Description
This is a Ruby on Rails application for tracking and displaying currency exchange rates.

### Requirements
- Ruby version 3.2.2
- Rails version 7.1.2

### Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/SKOLIA0/currency_exchange_app.git
   ```
2. Navigate to the app directory:
   ```bash
   cd currency_exchange_app
   ```
3. Create the database:
   ```bash
   rails db:create
   ```
4. Migrate the database:
   ```bash
   rails db:migrate
   ```
5. Generate seed data (run the script `generate_seeds.rb`):
   ```bash
   ruby generate_seeds.rb
   ```
6. Seed the database:
   ```bash
   rails db:seed
   ```
7. Start the Rails server:
   ```bash
   rails server
   ```
