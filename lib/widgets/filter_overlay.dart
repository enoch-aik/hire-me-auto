import 'package:flutter/material.dart';
import 'package:hire_me_auto/screens/jet_search/components/filter_checkbox.dart';
import 'package:hire_me_auto/src/constants/filter_checkbox.dart';
import 'package:hire_me_auto/src/constants/text.dart';

class MoveToClipper extends StatefulWidget {
  const MoveToClipper({Key? key}) : super(key: key);

  @override
  State<MoveToClipper> createState() => _MoveToClipperState();
}

class _MoveToClipperState extends State<MoveToClipper> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ClipPath(
                clipper: CustomArrowClipper(),
                child: Container(width: 15, height: 15, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 9.0, left: 10),
            child: ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: kText('Transmission',
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      CustomCheckBox(
                        checkListItems: transmissionItems,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: kText('Year',
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      CustomCheckBox(
                        checkListItems: yearItems,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: kText('Tint',
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      CustomCheckBox(
                        checkListItems: tintItems,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path() // Start from (0,0)
      ..moveTo(size.width / 2, 0) // move path point to (w/2,0)
      ..lineTo(0, size.width)
      ..lineTo(size.width, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
