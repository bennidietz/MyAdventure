import 'package:flutter/material.dart';
import 'package:flutter_music_player_app/network/constants.dart';
import 'package:flutter_music_player_app/router/router_constants.dart';
import 'package:flutter_music_player_app/storage/local_storage.dart';
import 'package:flutter_music_player_app/storage/storage_keys.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final _deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome Screen"),
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: defaultPadding * 5,),
             Padding(
               padding: const EdgeInsets.all(defaultPadding),
               child: TextField(
                 controller: _deadlineController,
                 decoration: InputDecoration(
                   filled: true,
                   hintText: "Mein Name",
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(12)),
                   ),
                 ),
               ),
             ),
             Center(
               child: ElevatedButton(
                 onPressed: () {
                   LocalStorage.setItem(NAME, _deadlineController.text).then((value) => {
                      Navigator.pushNamed(context, homeRoute)
                   });
                 },
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                   child: Text('Lass uns starten!'),
                 ),
               ),
             )
           ],
        ),
      ),
    );
  }
}
