//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laravellogin/screen/login.dart';
//import 'package:laravellogin/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 check() async{
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString('name').toString();
  return token;
}
class _HomeState extends State<Home>{
  String name;
  
  @override
  void initState(){
    super.initState();
  }
  

    @override
    Widget build(BuildContext context) {
          return Scaffold(
          appBar: AppBar(
            title: Text('Test App'),
            backgroundColor: Colors.teal,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Hi '+ check().toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      elevation: 10,
                      onPressed: (){
                        logout();
                      },
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text('Logout'),
                    ),
                  ),
                ],
              ),
          ),
        );
      }

  void logout() async{
    //SharedPreferences localStorage = await SharedPreferences.getInstance();
    //var token = localStorage.getString('access_token');
    //if(token != null || token != ''){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.clear();
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Login()));
    //}
  }
}