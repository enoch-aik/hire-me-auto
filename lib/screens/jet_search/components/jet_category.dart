import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_me_auto/src/constants/color.dart';
import 'package:hire_me_auto/src/constants/jet_category.dart';
import 'package:hire_me_auto/src/constants/text.dart';

class JetCategory extends StatefulWidget {
  const JetCategory({Key? key}) : super(key: key);

  @override
  State<JetCategory> createState() => _JetCategoryState();
}

class _JetCategoryState extends State<JetCategory> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    jetCard(
        {required name,
        imageUrl,
        index,
        borderColor = const Color(0xffB8B8B8),
        opacity = 1.0}) {
      if (index == selectedIndex) {
        borderColor = CustomColors.categoryBorderColor;
        opacity = 1.0;
      } else {}
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.5.w),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: borderColor,
                        width: 0.5,
                      )),
                  height: 64.w,
                  width: 64.w,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Opacity(
                      opacity: opacity,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                        width: 32.w,
                        height: 32.w,
                      ),
                    ),
                  )),
              kText(name, fontSize: 12.sp, color: borderColor,fontWeight: FontWeight.w400),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        height: 148.h,
        width: MediaQuery.of(context).size.width,
        color: CustomColors.secBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 12.w),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  jetCategory.length,
                  (index) => jetCard(
                      name: jetCategory[index]['name'],
                      imageUrl: jetCategory[index]['imageUrl'],
                      index: jetCategory[index]['id']))
              /* jetCard(
                    name: 'Turbo prop',
                    imageUrl: 'assets/images/plane1.png',
                    borderColor: CustomColors.categoryBorderColor,
                    index: 0),*/
              /*ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: jetCategory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: jetCard(
                            name: jetCategory[index]['name'],
                            imageUrl: jetCategory[index]['imageUrl'],
                            index: jetCategory[index]['id']),
                      );
                    })*/

              ),
        ),
      ),
    );
  }
}
