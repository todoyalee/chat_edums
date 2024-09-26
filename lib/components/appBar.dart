import 'package:flutter/material.dart';

class AppBarW extends StatelessWidget implements PreferredSizeWidget {
  final Icon icon;
  final Image image;
  final String text;

  const AppBarW({
    super.key,
    required this.icon,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left,
          size: 40,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          SizedBox(
            width: 82,
          ),
          Image.asset("assets/schooll.png"),
          SizedBox(
            width: 50,
          ),
          Text(
            //widget.headerText,
            text,
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
