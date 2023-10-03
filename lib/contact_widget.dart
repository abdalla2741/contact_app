

import 'package:contacts_app/contact%20model.dart';
import 'package:flutter/material.dart';
typedef delete = void Function (int number);

class ContactWidget extends StatelessWidget {
   ContactWidget({super.key , required this.contactModel , required this.clickOnDelete});
  ContactModel contactModel;
  delete clickOnDelete ;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Visibility(
      visible: contactModel.name.isNotEmpty && contactModel.phone.isNotEmpty,
      child: Container(
        width: mediaQuery.width,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Name : ${contactModel.name}" ,
                    style: const TextStyle(
                        color: Colors.black ,
                        fontSize:25 ,
                        fontWeight: FontWeight.bold
                ),
                ),
                Text(
                  "Phone : ${contactModel.phone}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: (){
                clickOnDelete(contactModel.currentIndex);
              },
              icon: const Icon(
                  Icons.delete ,
                  color: Colors.red)
              ,)
          ],
        ),
      ),
    );
  }
}
