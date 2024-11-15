import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, required this.name, required this.password});
  //passing the paramters...
  final String? name;
  final String? password;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade700,
        title: const Text(
          'User Information',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                  onPressed: () async {
                    final SharedPreferences getdata =
                        await SharedPreferences.getInstance();
                    getdata.clear();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.black,
                  ))),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 200, left: 20),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 350,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.pink],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.sentiment_satisfied_alt_rounded,
                        size: 50,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Login Successful....',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(widget.name ?? ''),
                      Text(widget.password ?? ''),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
