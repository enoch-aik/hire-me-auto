import 'package:custom_pointed_popup/custom_pointed_popup.dart';
import 'package:custom_pointed_popup/utils/triangle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hire_me_auto/screens/jet_search/components/filter_checkbox.dart';
import 'package:hire_me_auto/src/constants/color.dart';
import 'package:hire_me_auto/src/constants/filter_checkbox.dart';
import 'package:hire_me_auto/src/constants/text.dart';

final GlobalKey widgetKey = GlobalKey();

class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  CustomPointedPopup getCustomPointedPopup(BuildContext context) {
    return CustomPointedPopup(
      backgroundColor: CustomColors.secBackgroundColor,
      context: context,
      widthFractionWithRespectToDeviceWidth: 15,
      triangleDirection: TriangleDirection.Straight,
      popupElevation: 15,
      displayBelowWidget: true,

      ///you can also add border radius
      ////popupBorderRadius:,
      item: CustomPointedPopupItem(
        // title: 'Popup that can be shown on any targeted widget with customized pointed design.',
        /* textStyle: Theme.of(context).textTheme.caption!.copyWith(
              color: Theme.of(context).cardColor,
            ),*/
        // iconWidget: Icon(
        //   Icons.add_moderator,
        //   color: Theme.of(context).cardColor,
        // ),

        ///Or you can add custom item widget below instead above 3
        itemWidget: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: kText('Transmission',
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CustomCheckBox(
                checkListItems: transmissionItems,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: kText('Year', fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CustomCheckBox(
                checkListItems: yearItems,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: kText('Tint', fontSize: 16, fontWeight: FontWeight.bold),
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
      onClickWidget: (onClickMenu) {},
      onDismiss: () {},
    );
  }

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
            getCustomPointedPopup(context).show(
              widgetKey: widgetKey,
            );
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
