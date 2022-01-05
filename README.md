# iot_dht22
backend for esp32_dht22 project

## Deployment on heroku (Ubuntu)

```
sudo snap install heroku --classic
heroku login --browser=chromium
heroku apps:create --region eu iot-dht22
heroku config:set AUTH_IDS="************,************" # where you put real ids/MAC addresses like 12ab34cd56ef
heroku config:set OPENWEATHER_KEY="**********************************" # subscribe at https://openweathermap.org/api
git push heroku main
heroku logs --tail
```

## Adding heroku Postgresql Database

```
sudo apt install postgresql-client-common
sudo apt install postgresql-client
heroku addons:create heroku-postgresql:hobby-dev # warning, free of charge only up to 10K DB rows
heroku addons:docs heroku-postgresql # to read the documentations
heroku config # to see the DATABASE_URL varable. That variable is set automatically by Heroku
npm install pg --save
```

## Adding Supabase Postgresql Support
- Open the account at https://app.supabase.io/ and initialise the new project. Refain from specifying very long password - it may not work
- Initialise the new project
- Find the database connection info at Project / Settings / Database / Connection Info
- Change the variable name e.g. DATABASE_URL -> SUPA_DATABASE_URL. Enter the proper connection string
- adjust the variable name in db.js
```
  connectionString: process.env.SUPA_DATABASE_URL, // DATABASE_URL
```
- set the variable in Heroku (only DATABASE_URL is managed by Heroku automatically):
```
heroku config:set SUPA_DATABASE_URL="postgresql://postgres:**********@db.xxxxxxxxxxxx.supabase.co:5432/postgres" --app=......
```
