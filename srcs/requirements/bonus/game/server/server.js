const express = require("express");
const LISTEN_PORT = 3000;
const app = express();

app.use(express.static("/var/www/html"));

app.listen(LISTEN_PORT, () => { console.log(`Server listening port ${LISTEN_PORT}`); })