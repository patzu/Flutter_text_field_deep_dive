import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  return runApp(TextFieldDeepDive());
}

class TextFieldDeepDive extends StatefulWidget {
  const TextFieldDeepDive({Key? key}) : super(key: key);

  @override
  _TextFieldDeepDiveState createState() => _TextFieldDeepDiveState();
}

class _TextFieldDeepDiveState extends State<TextFieldDeepDive> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var obscured = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });

    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () => SystemNavigator.pop(),
              label: Text('Close'),
              icon: Icon(
                Icons.close,
              ),
            )
          ],
          title: Text(
            'TextFieldDeepDive',
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: [
            buildEmailTextField(),
            SizedBox(
              height: 24,
            ),
            buildPasswordTextField(),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'test@test.com',
        labelText: 'Email',
        border: OutlineInputBorder(),
        suffixIcon: emailController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(Icons.close),
                onPressed: () => emailController.clear(),
              ),
      ),
      controller: emailController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
    );
  }

  buildPasswordTextField() {
    return TextField(
      controller: passwordController,
      textInputAction: TextInputAction.done,
      obscureText: obscured,
      decoration: InputDecoration(
        errorText: passwordController.text.length < 5 &&
                passwordController.text.isNotEmpty
            ? 'Password must be at least 6 letter.'
            : null,
        hintText: 'Your password...',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.password),
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: obscured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          onPressed: () {
            obscured = obscured ? false : true;
            setState(() {});
          },
        ),
      ),
    );
  }
}
