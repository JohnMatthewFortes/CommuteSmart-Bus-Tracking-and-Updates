import 'package:flutter/material.dart';


class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();

}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _aggreedToTerms = false;
  bool _loginButtonActive = false;

  void _showTermsConditions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms and Conditions'),
          content: Text('Below are the terms and conditions of using the application'),
          actions: <Widget>[
            TextButton(
              child: Text('Agree'),
              onPressed: () {
                setState(() {
                  _aggreedToTerms = true;
                  _loginButtonActive = true;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Refuse'),
              onPressed: (){
                setState(() {
                  _aggreedToTerms = false;
                  _loginButtonActive = false;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text('SIGNUP', style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username', labelStyle: Theme.of(context).textTheme.bodyMedium),
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email address', labelStyle: Theme.of(context).textTheme.bodyMedium),
                  style: Theme.of(context).textTheme.bodyMedium,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                      return 'Enter a valid Email!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password', labelStyle: Theme.of(context).textTheme.bodyMedium),
                  style: Theme.of(context).textTheme.bodyMedium,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid Password!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password', labelStyle: Theme.of(context).textTheme.bodyMedium),
                  style: Theme.of(context).textTheme.bodyMedium,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid Password!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _aggreedToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _aggreedToTerms = value ?? false;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        _showTermsConditions(context);
                      },
                      child: Text(
                        'I agree to Terms and Conditions',
                        style: TextStyle(decoration: TextDecoration.underline, fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _loginButtonActive && _aggreedToTerms 
                    ? () {
                      // final isValid = _formKey.currentState?.validate() ?? false;
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.pushNamed(context, '/home');
                      }
                    }
                    : null,
                    child: Text('SIGNUP'),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, '/welcome');
                    },
                    child: Text('BACK', style: TextStyle(color: Colors.green)),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
