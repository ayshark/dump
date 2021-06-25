import 'package:dump/widget/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';

class ResidentLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
      child: Text('LOCATION'),
      onPressed: () {
        print('Pressed');
      },
    );
  }
}