import 'package:flutter/material.dart';
import 'package:flutter_mastering_level_4/models/Note.dart';

class SqlPraticeScreen extends StatefulWidget{
  @override
  _SqlPraticeScreenState createState() => _SqlPraticeScreenState();
}

class _SqlPraticeScreenState extends State<SqlPraticeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('CREATE NOTE',style:TextStyle(color: Colors.white,fontSize: 30)),
              color: Colors.black,
              onPressed: (){
                Note().create({
                  'note':'first note',
                }).then((value){
                  print('note inserted successfully : ' + value.toString());
                });
              },
            ),
            FlatButton(
              child: Text('DELETE NOTE',style:TextStyle(color: Colors.white,fontSize: 30)),
              color: Colors.red,
              onPressed: (){
                Note().deleteNote(3).then((value){
                  print('note deleted and the status is :' + value.toString());
                });
              },
            ),
            FlatButton(
              child: Text('UPDATE NOTE',style:TextStyle(color: Colors.white,fontSize: 30)),
              color: Colors.black45,
              onPressed: (){
                Note().updateNote('edited note from ui', 4).then((value){
                  print('note updated successfully' + value.toString());
                });
              },
            ),
            FlatButton(
              child: Text('READ NOTE',style:TextStyle(color: Colors.white,fontSize: 30)),
              color: Colors.blue,
              onPressed: (){
                Note().getData().then((value){
                  print('the notes is  : ' + value.toString());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}