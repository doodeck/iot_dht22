// index.js

const express = require('express')
const app = express()
const PORT = process.env.PORT || 5000;

// respond with "hello world" when a GET request is made to the homepage
app.get('/', function (req, res) {
    console.log('received connection from: ', req.ip);
    console.log('  Parameters: ', req.params);
    console.log('  Query: ', req.query);
    res.send('hello world')
})

app.listen(PORT, () => {
    console.log(`Example app listening at http://localhost:${PORT}`)
})
