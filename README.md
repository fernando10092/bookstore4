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
   

   //DOCKER
   python manage.py makemigrations
   python manage.py migrate
   docker-compose up -d --build 

   //EXCLUIR TODOS DE UMA VEZ
   docker system prune -a
   docker image prune
   docker rmi -f IMAGE_ID
   docker-compose down


   