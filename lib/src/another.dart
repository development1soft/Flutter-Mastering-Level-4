import 'package:flutter/material.dart';
import 'package:flutter_mastering_level_4/src/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnotherScreen extends StatefulWidget{
  @override
  _AnotherScreenScreenState createState() => _AnotherScreenScreenState();
}

class _AnotherScreenScreenState extends State<AnotherScreen> {

  var title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData().then((value){
      
      print('value goted : ' + value);

      setState(() {
        
        this.title = value;

      });

    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    deleteData();
    
    print('page destroyed');

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: (this.title == null ) ? Text('Loading...') : Text(this.title),
      ),
      body: Center(
        child: FlatButton(
          child: Text('GO TO Main SCREEN'),
          color: Colors.red,
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
    );
  }

  Future getData() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var name = prefs.getString('name');
    
    return name;

  }

  deleteData() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('name');

    prefs.remove('age');

    prefs.remove('tall');

    prefs.remove('progarammer');

    prefs.remove('skills');

    print('deleted successfully');

  }
}