import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
   MyTextField({super.key , required this.textTitle , required this.icon , required this.textEditingController});
  String textTitle;
  IconData icon;
  TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return  Container(
      width: mediaQuery.width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        validator: (textTitle) {
          if (textTitle!.isEmpty){
            return "please enter the wanted option";
          }
        },
        controller: textEditingController,
        decoration:InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
          ) ,
          errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
          ) ,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            hintText: textTitle,
            filled: true,
            fillColor: Colors.white,
            hintStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
            suffixIcon: Icon(
              icon,
              color: Colors.blueAccent,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                color: Colors.white
            )
            )
        ),
      ),
    );
  }
}
