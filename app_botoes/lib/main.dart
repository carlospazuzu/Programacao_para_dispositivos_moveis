import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: MyApp(),
      ),      
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var grey = Colors.grey;
  var green = Colors.green;
  var red = Colors.red;

  var thumbsUpButtonColor = Colors.grey;
  var thumbsDownButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(                
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image(
              width: 300.0,
              image: AssetImage('images/ffix.jpeg'),
            ),
          ),  
          SizedBox(
            height: 20.0,
          ) ,
          Row(            
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      thumbsUpButtonColor = green;
                      thumbsDownButtonColor = grey;
                    });
                  },
                  child: CircleAvatar(
                    radius: 50.0,          
                    backgroundColor: thumbsUpButtonColor,        
                    child: Icon(
                      Icons.thumb_up,
                      size: 50.0,
                      color: Colors.white
                    )
                  ),
                )
              ),              
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      thumbsDownButtonColor = red;
                      thumbsUpButtonColor = grey;
                    });
                  },
                  child: CircleAvatar(
                    radius: 50.0,    
                    backgroundColor: thumbsDownButtonColor,  
                    child: Icon(
                      Icons.thumb_down,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ),              
            ],
          )       
        ],
      ),
    );
  }
}