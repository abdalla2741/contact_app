import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton({super.key , required this.name , required this.color , required this.onClick});
  String name;
  Color color;
  Function onClick;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            onPressed: (){
              onClick();
            },
            child: Text(name , style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
          ),
        ),
      ),
    );
  }
}
