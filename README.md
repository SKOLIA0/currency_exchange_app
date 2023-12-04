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
3. Выполнить установку зависимостей:
   ```bash
   bundle install
   ```
4. Создать базу данных:
   ```bash
   rails db:create
   ```
5. Выполнить миграцию базы данных:
   ```bash
   rails db:migrate
   ```
6. Генерировать тестовые данные (запустить скрипт `generate_seeds.rb`):
   ```bash
   ruby generate_seeds.rb
   ```
7. Заполнить базу данных:
   ```bash
   rails db:seed
   ```
8. Запустить сервер Rails:
   ```bash
   rails server
   ```

### Автоматизированные задачи с помощью Whenever
1. Обновить файл crontab, чтобы включить определенные задачи:
   ```bash
   bundle exec whenever --update-crontab
   ```
2. Проверить запланированные задачи:
   ```bash
   crontab -l
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
3. Install dependencies:
   ```bash
   bundle install
   ```
4. Create the database:
   ```bash
   rails db:create
   ```
5. Migrate the database:
   ```bash
   rails db:migrate
   ```
6. Generate seed data (run the script `generate_seeds.rb`):
   ```bash
   ruby generate_seeds.rb
   ```
7. Seed the database:
   ```bash
   rails db:seed
   ```
8. Start the Rails server:
   ```bash
   rails server
   ```

### Automated Tasks with Whenever
1. Update the crontab file to include the defined tasks:
   ```bash
   bundle exec whenever --update-crontab
   ```
2. Verify the scheduled tasks:
   ```bash
   crontab -l
   ```