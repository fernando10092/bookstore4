## Quickstart

1. Clone this project

   ```shell
   git clone github.com/maxh33/bookstore
   ```

2. Install dependencies:

   ```shell
   cd bookstore
   poetry install
   ```

3. Run local dev server:

   ```shell
   poetry run manage.py migrate
   poetry run python manage.py runserver
   ```
   
4. Run docker dev server environment:

   ```shell
   docker-compose up -d --build 
   docker-compose exec web python manage.py migrate
   docker build -t bookstore_new
   docker run -d -p 5000:5000 --name <nome-do-container> <nome-da-imagem>
   docker run -d -p 3000:3000 meu-app:1.0
