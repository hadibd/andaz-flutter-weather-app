import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Andaz Weather Forecast'),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
