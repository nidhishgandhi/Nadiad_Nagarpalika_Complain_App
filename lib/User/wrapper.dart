import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/HomePage.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/user.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
