import 'package:mongo_dart/mongo_dart.dart';

const dbName = 'mongo-dart-example';
const dbAddress = '127.0.0.1';

const defaultUri = 'mongodb://$dbAddress:27017/$dbName';

void connect() async {
  //var db = Db(defaultUri);
  var db = await Db.create("mongodb+srv://userRoot:pwdRoot@cluster0.yhi0oy3.mongodb.net/Profile");
  await db.open();

  print("success ---------------------------------");

  

  // Future cleanupDatabase() async {
  //   await db.close();
  // }

  // if (!db.masterConnection.serverCapabilities.supportsOpMsg) {
  //   return;
  // }

  // var collectionName = 'InsertProfil';
  // await db.dropCollection(collectionName);
  // var collection = db.collection(collectionName);

  // var ret = await collection.insertOne(<String, dynamic>{

  //   'name': 'nameController',
  //   'email': 'emailController',
  //   'password': 'passwordController',
  //   'cpass': 'cpassController',
  // });

  // if (!ret.isSuccess) {
  //   print('Error detected in record insertion');
  // }

  // var res = await collection.findOne();

  // print('Fetched ${res?['name']}');
  // // Tom

  // await cleanupDatabase();
}