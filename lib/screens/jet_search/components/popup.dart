import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final GlobalKey widgetKey = GlobalKey();

class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset(
              'assets/svg/filter.svg',
              height: 30,
              key: widgetKey,
            ),
          )),
    );
  }
}
