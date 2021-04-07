import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/authProvider.dart';
import './loginScreen.dart';
import '../services/authenticationServices.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu_book_rounded,
                          color: Color.fromARGB(255, 0, 223, 165),
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Log Book',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 223, 165),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Color.fromARGB(255, 0, 223, 165),
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 223, 165),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.bug_report_rounded,
                          color: Color.fromARGB(255, 0, 223, 165),
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Bug Report',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 223, 165),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 0, 223, 165),
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Rate Us',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 223, 165),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AuthenticationServices()
                          .logoutUser(authProvider: _authProvider);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 0, 223, 165),
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 223, 165),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.highlight_off_rounded,
                          color: Colors.red,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Close enviroCar',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
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
    );
  }
}