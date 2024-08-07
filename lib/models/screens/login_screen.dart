import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';
import '/models/screens/welcome_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isOn = true;
  final key = GlobalKey<FormState>();
  final autoValidate = AutovalidateMode.always;
  void validate() {
    if (key.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
          settings: const RouteSettings(arguments: 'Welcome'),
          builder: (context) => const WelcomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            autovalidateMode: autoValidate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login ",
                  style: TextStyle(fontSize: 48),
                ),
                const Text(
                  "Sign in to learn with M Hamza",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 141, 165, 207),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _emailController.text = value;
                            });
                          },
                          decoration: const InputDecoration(
                              suffixIcon: Icon(LineIcons.user),
                              label: Text("Email"),
                              hintText: "Enter your Email ",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: isOn,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password must be entered.";
                            }
                            if (value.length < 6) {
                              return 'Password length must be greater than 6.';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          onChanged: (value) {
                            _passwordController.text = value;
                          },
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                child: const Icon(Icons.remove_red_eye),
                                onTap: () {
                                  setState(() {
                                    isOn = !isOn;
                                  });
                                },
                              ),
                              label: const Text("Password"),
                              hintText: "Enter your Password ",
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    onPressed: validate,
                                    child: const Text("Login")))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text("Forgot Password?")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  child: Text("OR Login with"),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(LineIcons.googlePlus))),
                    Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(LineIcons.facebookF))),
                    Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(LineIcons.twitter))),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Center(
                    child: Text("Don't have an account? Create new One"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
