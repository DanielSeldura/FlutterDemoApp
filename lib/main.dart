import 'package:codetest/services/ApiService.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Center(
          child: Card(
            color: Colors.grey[200],
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Welcome to HomeScreen"),
                  FlatButton.icon(
                      color: Colors.grey,
                      onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()),);},
                      icon: Icon(Icons.home),
                      label: Text("Logout")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService.create();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Center(
          child: Card(
            color: Colors.grey[200],
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Enter login details"),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: "Username"),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                  FlatButton.icon(
                      color: Colors.grey,
                      onPressed: () async {
                        print({"username": usernameController.text, "password": passwordController.text});
                        var result = await apiService
                            .login({"username": usernameController.text, "password": passwordController.text});
                        if (result.body == true) Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()),);
                        else Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()),);
                        //                        print(result.body);
//                        print(result.statusCode);
                      },
                      icon: Icon(Icons.forward),
                      label: Text("Login")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
