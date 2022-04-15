import 'package:flutter/material.dart';
import 'package:hire_me_auto/src/constants/color.dart';
import 'package:hire_me_auto/src/constants/text.dart';

class CustomCheckBox extends StatefulWidget {
  final List checkListItems;

  const CustomCheckBox({Key? key, required this.checkListItems})
      : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  String selected = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Column(
        children: [
          Column(
            children: List.generate(
              widget.checkListItems.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.secTextColor, width: 0.6),
                          borderRadius: BorderRadius.circular(5)),
                      child: Checkbox(
                        activeColor: Colors.white,
                        fillColor:
                            MaterialStateProperty.all(Colors.transparent),
                        checkColor: CustomColors.secTextColor,
                        /*controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        title: kText(
                          widget.checkListItems[index]["title"],
                        ),*/
                        value: widget.checkListItems[index]["value"],
                        onChanged: (value) {
                          setState(() {
                            for (var element in widget.checkListItems) {
                              element["value"] = false;
                            }
                            widget.checkListItems[index]["value"] = value;
                            /*selected =
                                "${checkListItems[index]["id"]}, ${checkListItems[index]["title"]}, ${checkListItems[index]["value"]}";
                          */
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SizedBox(
                        child: kText(widget.checkListItems[index]["title"],
                            color: CustomColors.secTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
