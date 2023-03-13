const express = require('express');
const config = require('./config/config');
const app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.get('/user', function (req, res) {
    res.send('Main page user get api.');
});

app.get('/test', function (req, res) {
  res.json({
    msg: 'Main page test update checking testing get api',
    NODE_ENV: config.NODE_ENV,
    DB_NAME: config.DB_NAME,
    DB_PASSWORD: config.DB_PASSWORD
  });
});

app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});
