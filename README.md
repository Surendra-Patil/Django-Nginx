# Django-Nginx

## Deployment using ansible
Navigate to playbook directory, edit the hosts IP in deploy.yml file and run command "ansible-playbook deploy.yml"

## Deployment using docker-compose
1) docker-compose -f docker-compose.yml up -d --build
2) docker-compose -f docker-compose.yml exec web python manage.py migrate --noinput
3) docker-compose -f docker-compose.yml exec web python manage.py collectstatic --no-input --clear
