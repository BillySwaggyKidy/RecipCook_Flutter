const mongo = require('../services/service_db');

const router_update = (req, res) => {
    return mongo.set_profile(req.body).then(resp => {
        console.log(resp);
    });
}

module.exports = {router_update};