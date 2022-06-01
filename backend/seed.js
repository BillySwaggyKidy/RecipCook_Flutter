const mongoose = require("mongoose");
const Profile = require("./models/profile.model");

// Pour utiliser les images depuis le backend
// photo: 'http://localhost/assets/images/olivia.jpg',

mongoose
  .connect(
    "mongodb+srv://userRoot:YRotVYGAQp465r0b@cluster0.yhi0oy3.mongodb.net/?retryWrites=true&w=majority",    {
      useNewUrlParser: true
    }
  )
  .then(() => {
    Promise.all([
      new Profile({
        name: 'toto',
        email: 'toto@toto.fr',
        photo: '',
        password: 'toto',
        cpass: 'toto',
      }).save(),
      
    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
