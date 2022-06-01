const mongoose = require('mongoose');
const profile = require('../models/profile.model');
let mongoDbUrl = "mongodb+srv://root:Kid?Billy.13CMR@mongodb.n1ggq.mongodb.net/?retryWrites=true&w=majority";


const get_profile = async (name, password) => {
    await mongoose.connect(mongoDbUrl);
    profile.findOne({'name': name,'password':password}, function (err, profile) {
        if (err) {
            return handleError(err);
        }
        else {
            console.log(profile);
        }
    });

    mongoose.disconnect();
}

const set_profile = async (userData) => {
    await mongoose.connect(mongoDbUrl);
    profile.create({ 'name': userData["name"], 'email':userData["email"], 'photo': userData["photo"], 'password':userData["password"], 'cpass':userData["cpass"]}, function (err, status) {
        if (err) {
            return handleError(err);
        }
        else {
            console.log(status);
        }
    });
    mongoose.disconnect();
}

const update_profile = async () => {
    await mongoose.connect(mongoDbUrl);
    profile.updateOne({ 'name': name,  'password':password }, function (err, profile) {
        if (err) {
            return handleError(err);
        }
        else {
            console.log(profile);
        }
    });
    mongoose.disconnect();
}





module.exports = {get_profile, set_profile, update_profile}