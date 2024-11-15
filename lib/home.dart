import 'package:flutter/material.dart';
import 'package:shared_preference_example/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  //method for set the data
  Future<void> settheDataInSharedPreference() async {
    final SharedPreferences setdata = await SharedPreferences.getInstance();

    setdata.setString('username', username.text);
    setdata.setString('password', password.text);
    print(username.text);
    print(password.text);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  //method for get the data

  Future<void> getTheDataInSharedPreference() async {
    final SharedPreferences getdata = await SharedPreferences.getInstance();

    String? userName = getdata.getString('username');
    String? passWord = getdata.getString('password');

    if (userName!.isNotEmpty && passWord!.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                  // name: userName,
                  // password: passWord,
                  )));
    }
  }

  @override
  void initState() {
    //calling the get method
    getTheDataInSharedPreference();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Login Details',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: username,
              decoration: const InputDecoration(
                  hintText: 'User Name',
                  hintStyle: TextStyle(fontSize: 22, color: Colors.black),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          strokeAlign: BorderSide.strokeAlignCenter))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                  hintText: 'Password Name',
                  hintStyle: TextStyle(fontSize: 22, color: Colors.black),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          strokeAlign: BorderSide.strokeAlignCenter))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 40,
                width: 150,
                child: ElevatedButton.icon(
                  onPressed: () {
                    //calling the set method
                    settheDataInSharedPreference();
                  },
                  label: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
