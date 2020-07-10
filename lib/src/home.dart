import 'package:flutter/material.dart';
import 'package:flutter_mastering_level_4/models/Note.dart';
import 'package:flutter_mastering_level_4/src/another.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    
    super.initState();
    
    setDate();
  
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome First Page'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('GO TO ANOTHER SCREEN'),
          color: Colors.red,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherScreen()));
          },
        ),
      ),
    );
  }

  setDate() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('name', 'eyad');

    prefs.setInt('age', 35);

    prefs.setDouble('tall', 195.0);

    prefs.setBool('progarammer', true);

    prefs.setStringList('skills', ['php','java','sql']);

    print('stored successfully');
    
  }
}