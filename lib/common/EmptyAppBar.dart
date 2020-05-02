import 'package:flutter/cupertino.dart';

class  EmptyAppBar  extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  @override
  Size get preferredSize => Size(10.0,0.0);
}