// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:authentication_demo/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'google_authentication.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MaterialApp(
    home: GoogleAuthentication(),
  ));
}

class GoogleAuthentication extends StatefulWidget {
  const GoogleAuthentication({super.key});

  @override
  State<GoogleAuthentication> createState() => _GoogleAuthenticationState();
}

class _GoogleAuthenticationState extends State<GoogleAuthentication> {
  // User? user;
  bool isAuth = false;
  String? ruval = "";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // user != null ? Text(user!.email ?? "") : const SizedBox(),
            // user != null
            //     ? CircleAvatar(
            //         radius: 50,
            //         backgroundImage: NetworkImage(
            //           ruval!,
            //         ))
            //     : const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passcontroller,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (isAuth == false) {
                    await Authentication.singnwithgoogle();
                    // print(user);
                    // print(user!.email);
                    // print(ruval = user!.photoURL);
                    // print(user!.displayName);
                    setState(() {
                      isAuth = true;
                    });
                  }
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                      (route) => false);
                },
                child: const Text("LoginWithGoogle"))
          ],
        ),
      ),
    );
  }
}
