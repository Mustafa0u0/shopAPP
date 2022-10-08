import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants/global_variables.dart';
import 'package:shop_app/features/auth/screens/signin_screen.dart';
import 'package:shop_app/features/auth/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signUp-screen';

  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SizedBox(
            height: height,
            child: Stack(children: <Widget>[
              WavyHeader(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                      padding: const EdgeInsetsDirectional.only(top: 200),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Text(
                            'تسجيل حساب',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  decoration: GlobalVariables()
                                      .inputBoxDecorationShaddow(),
                                  child: TextFormField(
                                    controller: _nameController,
                                    decoration: GlobalVariables()
                                        .textInputDecoration(
                                            'اسمك', 'ادخل اسمك '),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  decoration: GlobalVariables()
                                      .inputBoxDecorationShaddow(),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: GlobalVariables()
                                        .textInputDecoration(
                                            "ايميلك", "ادخل ايميلك"),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (!(val!.isEmpty) &&
                                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                              .hasMatch(val)) {
                                        return "أدخل عنوان بريد إلكتروني صالح";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  decoration: GlobalVariables()
                                      .inputBoxDecorationShaddow(),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: GlobalVariables()
                                        .textInputDecoration(
                                            "كلمة السر", "ادخل كلمة السر"),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "ارجو ادخال كلمة السر";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                FormField<bool>(
                                  builder: (state) {
                                    return Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Checkbox(
                                                value: checkboxValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    checkboxValue = value!;
                                                    state.didChange(value);
                                                  });
                                                }),
                                            const Text(
                                              "انا اوافق على الشروط ",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            state.errorText ?? '',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).errorColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  validator: (value) {
                                    if (!checkboxValue) {
                                      return 'تحتاج ان توافق على الشروط';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  decoration: GlobalVariables()
                                      .buttonBoxDecoration(context),
                                  child: ElevatedButton(
                                    style: GlobalVariables().buttonStyle(),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 10, 40, 10),
                                      child: Text(
                                        "سجل ".toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        signUpUser();
                                        // Navigator.of(context)
                                        //     .pushAndRemoveUntil(
                                        //         MaterialPageRoute(
                                        //             builder:
                                        //                 (context) =>
                                        //                     SignInScreen()),
                                        //         (Route<dynamic> route) =>
                                        //             false);
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Text.rich(TextSpan(children: [
                                    const TextSpan(text: "لديك حساب ؟ "),
                                    TextSpan(
                                      text: 'سجل دخولك',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignInScreen()));
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    ),
                                  ])),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
