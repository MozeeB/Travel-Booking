import 'package:dania_travel/admin/admin_home.dart';
import 'package:dania_travel/helpers/route_generator.dart';
import 'package:dania_travel/main/login.dart';
import 'package:dania_travel/users/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var login = prefs.getString('login');
  var role = prefs.getString('role');
  print(login);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (() {
        if(login == null){
          return LoginPage();
        }else{
          if(role == "admin"){
            return AdminHomePage();
          }else{
            return MyHomePage();
          }
        }
        // your code here
      }()),
      // initialRoute: '/Login',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
