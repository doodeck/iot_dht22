# iot_dht22
backend for esp32_dht22 project

## Deployment on heroku (Ubuntu)

```
sudo snap install heroku --classic
heroku login --browser=chromium
heroku apps:create --region eu iot-dht22
AUTH_IDS="************,************" # where you put real ids/MAC addresses like 12ab34cd56ef
git push heroku main
heroku logs --tail
```

## Adding heroku Postgresql Database

```
sudo apt install postgresql-client-common
sudo apt install postgresql-client
heroku addons:create heroku-postgresql:hobby-dev # warning, free of charge only up to 10K DB rows
heroku addons:docs heroku-postgresql # to read the documentations
heroku config # to see the DATABASE_URL varable
npm install pg --save
```
