import 'package:flutter/material.dart';

import '../controllers/home.controller.dart';

Drawer sideDrawer(HomeController homeController) {
  return Drawer(
    child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 60),
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Find Keyword"),
                  scrollPadding: const EdgeInsets.all(5),
                  onChanged: (val) {},
                ),
              ),
            ),
            MaterialButton(
              child: const Text("Find"),
              onPressed: () async {},
            ),
          ],
        ),
      ],
    ),
  );
}
