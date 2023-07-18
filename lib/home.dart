// ignore_for_file: use_build_context_synchronously

import 'package:authentication_demo/google_authentication.dart';
import 'package:authentication_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                final GoogleSignIn googleSignIn = GoogleSignIn();
                bool auth = await googleSignIn.isSignedIn();
                if (auth) {
                  Authentication.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GoogleAuthentication(),
                      ));
                }
              },
              child: const Text('Logout')),
        ],
      ),
    );
  }
}
