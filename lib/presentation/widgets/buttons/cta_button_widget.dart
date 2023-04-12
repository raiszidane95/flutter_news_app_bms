import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/colors_constants.dart';

class Ctabutton extends StatelessWidget {
  final String textTitle;
  final String? routeDestination;
  const Ctabutton({
    Key? key,
    required this.textTitle,
    this.routeDestination,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 55),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 70,
              width: 314,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: deepOrange800,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(4),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () => Get.toNamed(routeDestination!),
                child: Text(
                  textTitle,
                  style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
