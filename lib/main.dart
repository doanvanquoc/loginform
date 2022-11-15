import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _showPass = false;
  final String _usernameError = "Tài khoản không hợp lệ";
  final String _passError = "Mật khẩu phải trên 6 ký tự";
  bool _userInvalid = false;
  bool _passInvalid = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 237, 235, 235),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const FlutterLogo()),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text(
                'Hello,\nWelcome Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                  controller: _usernameController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      errorText: _userInvalid ? _usernameError : null,
                      labelText: 'USERNAME',
                      labelStyle: const TextStyle(
                          color: Color(0xff888888), fontSize: 15))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                TextField(
                    controller: _passController,
                    obscureText: !_showPass,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        errorText: _passInvalid ? _passError : null,
                        labelText: 'PASSWORD',
                        labelStyle: const TextStyle(
                            color: Color(0xff888888), fontSize: 15))),
                GestureDetector(
                  onTap: onToggleShowPass,
                  child: Text(
                    _showPass ? "HIDE" : "SHOW",
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      onSignInClicked();
                    },
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'NEW USER? SIGN UP',
                      style: TextStyle(fontSize: 15, color: Color(0xff888888)),
                    ),
                    Text(
                      'FORGOT PASSWORD?',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ],
                )),
          ],
        ),
      ),
    ));
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      if (_usernameController.text.length < 6 ||
          !_usernameController.text.contains('@')) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      if (_userInvalid == false && _passInvalid == false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }
}
