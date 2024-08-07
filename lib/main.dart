import '/models/themes/theme_data.dart';

import '/models/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    ));
