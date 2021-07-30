const express = require('express');
const app = express();
const path = require('path');
var port = 3000;

app.get('/', function (req, res) {
    res.sendFile(__dirname + '/view/index.html');
});

//static files 
app.use(express.static(path.join(__dirname,'view')));

app.listen(port);
console.log("Server is running in port: " + port);