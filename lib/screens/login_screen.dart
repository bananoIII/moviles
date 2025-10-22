import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:progra_movil/firebase/fire_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Firebase_Auth? auth = Firebase_Auth();
  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();
  //false
  bool isValidation = !true;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(hintText: 'Correo electrónico'),
    );

    final txtPassword = TextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: conPwd,
      decoration: InputDecoration(hintText: 'Contraseña'),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg_login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 65,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 70,
                  fontFamily: 'Stein',
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .3,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white54,
                ),
                child: ListView(
                  children: [
                    txtUser,
                    txtPassword,
                    IconButton(
                      onPressed: () {
                        isValidation = true;
                        setState(() {});

                        Future.delayed(Duration(seconds: 2))
                            .then((onValue) {
                              isValidation = false;
                            })
                            .then((onValue) {
                              (Navigator.pushNamed(context, '/home'));
                            });
                        /*
                        auth!
                            .signInEmailPassword(conUser.text, conPwd.text)
                            .then((user) {
                              if (user!.uid != "") {
                                Fluttertoast.showToast(
                                  msg: 'MGS1.',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.red[600],
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                              if (!user!.emailVerified) {
                                return (Fluttertoast.showToast(
                                  msg: 'MGS2.',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.red[600],
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                ));
                              }

                              return (Navigator.pushNamed(context, '/home'));
                            })
                            .then((onValue) {
                              Future.delayed(Duration(seconds: 2)).then((
                                onValue,
                              ) {
                                isValidation = false;
                              });
                            });
                      */
                      },
                      icon: Icon(Icons.login),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        isValidation = true;
                        setState(() {});
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text('Registrate'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: isValidation
                  ? Lottie.asset('assets/loading2.json')
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
