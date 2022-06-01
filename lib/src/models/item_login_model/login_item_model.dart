import 'package:intl/intl.dart';

class LoginItemModel {
  String name;
  String photo;
  String email;
  String password;
  String cpass;

  LoginItemModel({
    required this.name,
    required this.photo,
    required this.email,
    required this.password,
    required this.cpass
  });

  LoginItemModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        photo = json['photo'],
        password = json['password'],
        cpass = json['cpass'];

  Map<String, dynamic> toJson() {
    return {
      'eamil': email,
      'name': name,
      'photo': photo,
      'password': password,
      'cpass': cpass,
    };
  }

  // String showProfile() {
  //   return "$email\n$name\n$password\n$cpass\n\n";
  // }

  // bool isBirthdayToday() {
  //   DateTime now = DateTime.now();
  //   DateTime birthdate = getBirthDate();
  //   return (now.month == birthdate.month && now.day == birthdate.day);
  // }

  // DateTime getBirthDate() {
  //   return DateTime.parse(birthdate);
  // }

  // String getFormatBirthDate() {
  //   var newFormat = DateFormat("dd/MM/yyyy");
  //   return newFormat.format(getBirthDate());
  // }

  // DateTime birthdateThisYear() {
  //   DateTime now = DateTime.now();
  //   DateTime birthdate = getBirthDate();
  //   return DateTime(now.year, birthdate.month, birthdate.day);
  // }

  // int getAge() {
  //   DateTime now = DateTime.now();
  //   int age = now.year - getBirthDate().year;
  //   return now.isBefore(birthdateThisYear()) ? age - 1 : age;
  // }

  // int getNextAge() {
  //   DateTime now = DateTime.now();
  //   DateTime nowtime0 = DateTime(now.year, now.month, now.day);
  //   return nowtime0.isAtSameMomentAs(birthdateThisYear())
  //       ? getAge()
  //       : getAge() + 1;
  // }

  // String getDaysLast() {
  //   String text;
  //   DateTime nowtime = DateTime.now();
  //   DateTime now = DateTime(nowtime.year, nowtime.month, nowtime.day);
  //   DateTime birthdate = birthdateThisYear();

  //   if (birthdate.isBefore(now)) {
  //     text = "next year !";
  //   } else if (now.isAtSameMomentAs(birthdate)) {
  //     text = "today !";
  //   } else {
  //     int diff = birthdate.difference(now).inDays;
  //     if (diff == 1) {
  //       text = "tomorrow !";
  //     } else if (diff < 31) {
  //       text = "in $diff days";
  //     } else {
  //       text = "in ${birthdate.month - now.month} months";
  //     }
  //   }
  //   return text;
  // }
}
