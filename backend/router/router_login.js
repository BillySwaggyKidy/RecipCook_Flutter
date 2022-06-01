const mongo = require('../services/service_db');


const router_login = (req, res) => {
    return mongo.set_profile(req.body).then(resp => {
        console.log(resp);
    });
}

module.exports = {router_login};