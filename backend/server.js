const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const app = express();
const path = require("path");
const Profile = require("./models/profile.model");

app.use(cors());
mongoose.set("debug", true);
mongoose
  .connect(
    //"mongodb+srv://root:pass@birthdayapp.peklc.mongodb.net/BirthdayApp?retryWrites=true&w=majority",
    "mongodb+srv://userRoot:YRotVYGAQp465r0b@cluster0.yhi0oy3.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }
  )
  .then(() => console.log("connexion ok !"));

app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());


app.get("/api/profiles", async (req, res) => {
  try {
    const profiles = await Profile.find({}).exec();
    res.json(profiles);
  } catch (e) {
    res.status(500).json(e);
  }
});

/*app.post("/api/profiles", async (req, res) => {
  try {
    const body = req.body;
    const profile = await new Profile(body).save();
    res.json(trip);
  } catch (e) {
    res.status(500).json(e);
  }
});*/



app.listen(80);
