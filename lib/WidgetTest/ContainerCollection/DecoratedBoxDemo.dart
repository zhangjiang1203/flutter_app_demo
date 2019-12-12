import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("DecoratedBox"),backgroundColor: Colors.blue,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 80),
        child: DecoratedBox(
          decoration: BoxDecoration(
//            color: Colors.red,
            gradient: LinearGradient(
              colors: [Colors.red,Colors.orange[700]],
              stops: [0.3,0.7],
              begin: Alignment(0.2,0.3),
              end: Alignment(0.9,-0.5),

            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [BoxShadow(
              blurRadius: 5,
              color: Colors.black54,
              offset: Offset(3,2),
            )],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text('我就是我，不一样的烟火',style: TextStyle(color:Colors.white,)),
          ),

        ),
      )
    );
  }
}