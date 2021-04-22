import 'package:flutter/material.dart';

class SideBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Image.asset('assets/img/logo.jpeg')],
            ),
            decoration: BoxDecoration(color: Color(0xffDEB887)),
          ),
        ],
      ),
    );
  }
}
