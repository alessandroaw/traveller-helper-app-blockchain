const express = require('express');
const router = require('./routes');
require('./db/mongoose');

const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.json());

app.use('/', router)

app.get('/', (req, res) => {
    res.send("jalan coi");
});



app.listen(PORT, ()=> {
    console.log("Jalan bangg servernya");
})