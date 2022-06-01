const express = require('express')
const auth = require('./router/router_auth');
const login = require('./router/router_login');
const update = require('./router/router_update');
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get('/auth',auth.router_auth);

app.post('/login',login.router_login);

app.post('/update',update.router_update);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
