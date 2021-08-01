import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player_app/network/constants.dart';
import 'package:flutter_music_player_app/router/router_constants.dart';
import 'package:flutter_music_player_app/services/authentification_service.dart';
import 'package:provider/provider.dart';



class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.pushNamed(context, homeRoute, arguments: user);
      }
    });
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
             TextField(
               controller: emailController,
               decoration: InputDecoration(
                 labelText: "Email",
               ),
             ),
             TextField(
               controller: passwordController,
               decoration: InputDecoration(
                 labelText: "Password",
               ),
             ),
             Center(
               child: ElevatedButton(
                 onPressed: () {
                   // LocalStorage.setItem(NAME, _deadlineController.text).then((value) => {
                   //    Navigator.pushNamed(context, homeRoute)
                   // });
                   context.read<AuthentificationService>().signIn(
                     emailController.text.trim(),
                     passwordController.text.trim(),
                   );
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
