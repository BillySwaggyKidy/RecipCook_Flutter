const mongo = require('../services/service_db');


const router_auth = (req, res) => {
    return mongo.get_profile(req.query.name,req.query.password).then(resp => {
        console.log(resp);
    });
}

module.exports = {router_auth};