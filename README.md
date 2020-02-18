# Django-Nginx

## Deployment using ansible
Navigate to playbook directory and ansible command share below.
ansible-playbook deploy.yml

## Deployment using docker-compose
1) docker-compose -f docker-compose.yml up -d --build
2) docker-compose -f docker-compose.yml exec web python manage.py migrate --noinput
3) docker-compose -f docker-compose.yml exec web python manage.py collectstatic --no-input --clear
