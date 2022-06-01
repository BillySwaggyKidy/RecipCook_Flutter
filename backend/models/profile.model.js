const mongoose = require("mongoose");
const schema = mongoose.Schema;

const profileSchema = schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  photo: { type: String, required: true },
  password: { type: String, required: true },
  cpass: { type: String, required: true },
});

const Recipcook = mongoose.model("profile", profileSchema);

module.exports = Recipcook;

