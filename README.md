# iot_dht22
backend for esp32_dht22 project

## Deployment on heroku (Ubuntu)

```
sudo snap install heroku --classic
heroku login --browser=chromium
heroku apps:create --region eu iot-dht22
git push heroku main
heroku logs --tail
```
