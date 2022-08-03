import 'package:flutter/material.dart';
import '../resourses/color_manager.dart';
import 'package:validators/validators.dart';

import '../home/home_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool _showPassword = true;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorManager.secondary,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            autovalidateMode: _autovalidateMode,
            key: _globalKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Image(
                      height: MediaQuery.of(context).size.height * 0.2,
                      image: const AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                  Container(
                    // height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(2, 5),
                          )
                        ]),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            // top: 15,
                            left: 10,
                          ),
                          child: Text(
                            'Email Address',
                            style: TextStyle(
                              color: Color.fromARGB(255, 85, 85, 85),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              top: 15,
                              bottom: 0,
                              left: 15,
                              right: 15,
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: ColorManager.primary,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value != null && !isEmail(value)) {
                              return 'Please Enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    // height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(2, 5),
                          )
                        ]),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            // top: 15,
                            left: 10,
                          ),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: Color.fromARGB(255, 85, 85, 85),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                              top: 15,
                              bottom: 0,
                              left: 15,
                              right: 15,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: ColorManager.primary,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: const Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                                color: ColorManager.primary,
                              ),
                            ),
                          ),
                          obscureText: _showPassword,
                          validator: (value) {
                            if (value != null && value.length < 6) {
                              return 'Please enter 6 character at least';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final form = _globalKey.currentState;
                      _autovalidateMode = AutovalidateMode.always;
                      if (form!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ColorManager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'SignUp',
                        style: TextStyle(color: ColorManager.primary),
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
