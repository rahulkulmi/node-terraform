const express = require('express');
const app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.get('/user', function (req, res) {
    res.send('Main page user get api.');
});

app.get('/test', function (req, res) {
  res.send('Main page test get api.');
});

app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});
