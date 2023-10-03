import 'package:contacts_app/contact%20model.dart';
import 'package:contacts_app/contact_widget.dart';
import 'package:contacts_app/mybutton.dart';
import 'package:contacts_app/textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      const MyApplication(),
  );
}

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  TextEditingController nameEditController = TextEditingController();
  TextEditingController phoneEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<ContactModel> contacts = [
    ContactModel(name: "", phone: "" , currentIndex: 0),
    ContactModel(name: "", phone: "" , currentIndex: 1),
    ContactModel(name: "", phone: "", currentIndex: 2),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text(
              "Contacts",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
             MyTextField(textTitle: "Please enter a name", icon: Icons.edit , textEditingController: nameEditController),
              MyTextField(textTitle: "Please enter a number", icon: Icons.phone,textEditingController:phoneEditController ),
              Row(
                children: [
                  MyButton(
                      name: "Add",
                      color: Colors.blueAccent ,
                      onClick: (){
                        onAddClick();
                      }
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    ContactWidget(contactModel: contacts[0] ,clickOnDelete: onDeleteClick),
                      ContactWidget(contactModel:contacts[1], clickOnDelete: onDeleteClick,),
                    ContactWidget(contactModel:contacts[2], clickOnDelete: onDeleteClick,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onAddClick(){
    if(!formKey.currentState!.validate()){
      return;
    }
if(index == 3){
return;
}

contacts[index].name = nameEditController.text;
contacts[index].phone = phoneEditController.text;

setState(() {

});
index++;
    for(ContactModel model in contacts){
      print(model.name);
      print(model.phone);
    }
  }
  // onDeleteClick(){
  //   print(index);
  //   if(index == 0){
  //     return;
  //   }
  //   contacts[index-1].name = "";
  //   contacts[index-1].phone = "";
  //       setState(() {
  //
  //   });
  //   index--;
  //   for(ContactModel model in contacts){
  //     print(model.name);
  //     print(model.phone);
  //   }
  // }

onDeleteClick(int index){
  contacts[index].name = "";
  contacts[index].phone = "";
  index--;

  setState(() {
  });
}
}
