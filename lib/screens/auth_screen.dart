import 'package:assessment_application_1/screens/squaretile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icons_flutter/icons_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var isAuthenticating = false;
  var isLogin = true;
  final _formKey = GlobalKey<FormState>();
  late String _enteredEmail;
  late String _enteredPassword;
  String? _enteredUsername;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        setState(() {
          isAuthenticating = true;
        });

        if (isLogin) {
          // ignore: unused_local_variable
          final userCredentials = await firebaseAuth.signInWithEmailAndPassword(
              email: _enteredEmail, password: _enteredPassword);
        } else {
          final userCredentials =
              await firebaseAuth.createUserWithEmailAndPassword(
                  email: _enteredEmail, password: _enteredPassword);
          fireStore.collection('users').doc(userCredentials.user!.uid).set(
            {
              'uid': userCredentials.user!.uid,
              'email': _enteredEmail,
              'username': _enteredUsername,
            },
          );
        }
        setState(() {
          isAuthenticating = false;
        });
      } on FirebaseAuthException catch (error) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.code.toString()[0].toUpperCase() +
                  error.code.toString().substring(1).replaceAll('-', ' '),
            ),
          ),
        );
        setState(() {
          isAuthenticating = false;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              isLogin
                  ? 'Welcome to \nExpense Manager'
                  : 'Welcome to \nExpense Manager',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand'),
            ),
            const SizedBox(
              height: 50,
            ),

            // Text("HeY",style: TextStyle(
            //   color: Colors.grey.shade700,
            //   fontSize: 16,
            // ),),
            // const SizedBox(
            //   height: 25,
            // ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey[500])),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null ||
                    !value.contains('@') ||
                    value.trim().isEmpty) {
                  return 'Enter a valid email';
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredEmail = newValue!;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            if (!isLogin)
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'UserName',
                    hintStyle: TextStyle(color: Colors.grey[500])),
                controller: _usernameController,
                // style: TextStyle(
                //     color: Theme.of(context).colorScheme.onPrimaryContainer),
                validator: (value) {
                  if (value == null || value.trim().length < 3) {
                    return 'Username must be greater than 2 characters';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredUsername = newValue!;
                },
              ),
            if (!isLogin)
              const SizedBox(
                height: 10,
              ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey[500])),
              controller: _passwordController,
              // style: TextStyle(
              //     color: Theme.of(context).colorScheme.onPrimaryContainer),
              obscureText: true,
              validator: (value) {
                if (value == null || value.trim().length < 6) {
                  return 'Password must be atleast 6 characters';
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredPassword = newValue!;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            if (!isLogin)
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey[500])),
                // style: TextStyle(
                //     color: Theme.of(context).colorScheme.onPrimaryContainer),
                obscureText: true,
                validator: (value) {
                  if (value == null ||
                      value.trim().length < 6 ||
                      _passwordController.text != value) {
                    return 'Passwords does not match';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredPassword = newValue!;
                },
              ),
            if (!isLogin)
              const SizedBox(
                height: 10,
              ),
            if (isLogin)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: _submit,
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.tertiary,
                    ]),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: isAuthenticating
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        )
                      : Text(
                          isLogin ? 'Login' : 'Signup',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: _submit,
            //   style: ElevatedButton.styleFrom(
            //       backgroundColor: Theme.of(context).colorScheme.primary,
            //       foregroundColor: Theme.of(context).colorScheme.onPrimary),
            //   child: isAuthenticating
            //       ? SizedBox(
            //           height: 25,
            //           width: 25,
            //           child: CircularProgressIndicator(
            //             color: Theme.of(context).colorScheme.onPrimary,
            //           ),
            //         )
            //       : Text(isLogin ? 'Login' : 'Signup'),
            // ),
            const SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: Divider(
            //         thickness: 0.5,
            //         color: Colors.grey[400],
            //       )),
            //       Text(
            //         ' Or Continue with ',
            //         style: TextStyle(color: Colors.grey[600]),
            //       ),
            //       Expanded(
            //           child: Divider(
            //         thickness: 0.5,
            //         color: Colors.grey[400],
            //       ))
            //     ],
            //   ),
            // ),

            // const SizedBox(
            //   height: 50,
            // ),

            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     MyLogo(imagepath: 'assets/logo/glogo.png'),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     MyLogo(imagepath: 'assets/logo/ioslogo.png')
            //   ],
            // ),

            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _usernameController.clear();
                  _passwordController.clear();
                  isLogin = !isLogin;
                });
                if (isLogin) {
                  _enteredUsername = null;
                }
              },
              child: isLogin
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Register Now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a user? ',
                        ),
                        Text("Login Now",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // Icon(
              //   MaterialCommunityIcons.wallet,
              //   size: 200,
              //   color: Theme.of(context).colorScheme.onBackground,
              // ),
              // Image.asset(
              //   "assets/logo/expensetrackerlogo.png",
              //   height: 180,
              //   width: 180,
              // ),
              // Text(
              //   'Expense Manager',
              //   style: Theme.of(context)
              //       .textTheme
              //       .displayMedium!
              //       .copyWith(color: Theme.of(context).colorScheme.onBackground),
              // ),
              // const SizedBox(height: 25),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
