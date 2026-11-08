
import 'package:flutter/material.dart';


class EmptyWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("no product ...\nadd some product ",
      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 126, 128, 163)),),);
  }

}