import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hire_me_auto/src/constants/color.dart';
import 'package:hire_me_auto/src/constants/text.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton({Key? key}) : super(key: key);

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  String? initialValue = 'Adamawa';

  @override
  Widget build(BuildContext context) {
    //initial dropdown value

    // List of available locations in dropdown menu
    List<String> items = [
      'Adamawa',
      'Anambra',
      'Abuja',
      'Bauchi',
      'Ebonyi',
      'Enugu',
      'Lagos',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: CustomColors.secBackgroundColor,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.5),
              child: SvgPicture.asset(
                'assets/svg/location.svg',
                height: 20,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                  icon: Padding(
                    padding:  EdgeInsets.only(right: 7.76.w,left: 4.76.w),
                    child: SvgPicture.asset('assets/svg/drop_down.svg',width: (8.49).w,),
                  ),
                  //dropdownColor: CustomColors.secBackgroundColor,
                  value: initialValue,
                  style: TextStyle(fontSize: 16.sp),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Row(
                        children: [
                          kText(items, fontSize: 14.sp,fontWeight: FontWeight.w400),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      initialValue = value;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
