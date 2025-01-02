import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:aces/firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';

class notifpushpage extends StatefulWidget {
  const notifpushpage({super.key, required this.title});
  final String title;
  @override
  State<notifpushpage> createState() => _notifpushpageState();
}


class _notifpushpageState extends State<notifpushpage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController name_of_modController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController imgurlController = TextEditingController();

  Future<void> addNotification() async {
    await FirebaseFirestore.instance.collection('notifications').add({
      'title' : titleController.text,
      'description' : descriptionController.text,
      'link' : linkController.text,
      'name_of_mod': name_of_modController.text,
      'moderatorToken' : '0101',
      'timestamp': FieldValue.serverTimestamp(),
      'img_url': imgurlController.text,
    });

    //Clearing the textfields after adding the notif:
    titleController.clear();
    name_of_modController.clear();
    descriptionController.clear();
    linkController.clear();
    imgurlController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 12, 24, 1),
      appBar: AppBar(
        title: const Text('Notification Push Page', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //const SizedBox(height: 20,),
              const Text(
                'Enter the following details: ',
                style: TextStyle(color: Colors.white, fontSize: 20,),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: name_of_modController,
                  decoration: const InputDecoration(labelText: "Enter Moderator name",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder()),

                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title of the Notification",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder()),

                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: descriptionController,
                  maxLines: null,
                  decoration: const InputDecoration(labelText: "Description",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder()),
                  textInputAction: TextInputAction.newline,//newline allow karta

                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: linkController,
                  decoration: const InputDecoration(labelText: "Enter link if any",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: imgurlController,
                  decoration: const InputDecoration(labelText: "Enter Image URL",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder()),

                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: addNotification, child: const Text('Send Notification!'))

            ],
          ),
        ),
      ),
    );
  }
}