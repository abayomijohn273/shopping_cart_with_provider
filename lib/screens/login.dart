import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(80),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headline1,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
              color: Colors.teal[800],
              child: Text('Enter'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/catalog');
              },
            )
          ],
        ),
      ),
    );
  }
}
