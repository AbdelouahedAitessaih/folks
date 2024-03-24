import 'package:flutter/material.dart';
import 'package:folks/providers/authentication_provider.dart';
import 'package:folks/services/navigation_service.dart';
import 'package:folks/widgets/custom_input_fields.dart';
import 'package:folks/widgets/rounded_button.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  double _deviceHeight;
  double _deviceWidth;

  AutheticationProvider _auth;
  NavigationService _navigation;

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AutheticationProvider>(context);
    _navigation = GetIt.instance.get<NavigationService>();
    return _pageUi();
  }

  Widget _pageUi() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.03, vertical: _deviceHeight * 0.02),
        height: _deviceHeight * 0.98,
        width: _deviceWidth * 0.97,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pageTitle(),
            SizedBox(
              height: _deviceHeight * 0.04,
            ),
            _pageForm(),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _loginButton(),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            _signUpLink()
          ],
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      height: _deviceHeight * 0.10,
      child: const Text(
        "Folks",
        style: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _pageForm() {
    return Container(
      height: _deviceHeight * 0.18,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              onSaved: (_value) => setState(() {
                _email = _value;
              }),
              regEx:
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
              hintText: "Email",
              obscureText: false,
            ),
            CustomTextFormField(
              onSaved: (_value) => setState(() {
                _password = _value;
              }),
              regEx: r".{8,}",
              hintText: "Password",
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RoundedButton(
        title: "Login",
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            _auth.login(_email, _password);
          }
        },
        height: _deviceHeight * 0.065,
        width: _deviceWidth * 0.65);
  }

  Widget _signUpLink() {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        child: const Text(
          "Don't have an account ?",
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
