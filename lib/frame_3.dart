import 'package:flutter/material.dart';
import 'countries.dart';
import 'phone_auth.dart';
import 'package:provider/provider.dart';

import 'get_phone.dart';

void main() => runApp(contact_details());

class contact_details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneAuthDataProvider(),
        ),
      ],
      child: MaterialApp(
        home: PhoneAuthGetPhone(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
