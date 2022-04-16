import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hire_me_auto/screens/jet_search/components/body.dart';
import 'package:hire_me_auto/screens/jet_search/components/location_button.dart';
import 'package:hire_me_auto/src/constants/color.dart';
import 'package:hire_me_auto/src/constants/text.dart';

class JetSearch extends StatefulWidget {
  const JetSearch({Key? key}) : super(key: key);

  @override
  State<JetSearch> createState() => _JetSearchState();
}

class _JetSearchState extends State<JetSearch> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(104.h),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    color: CustomColors.appColor,
                    child: AppBar(
                      elevation: 0,
                      title: kText('Jet Search',
                          fontSize: 18.sp, color: Colors.white,fontWeight: FontWeight.w600),
                      actions: const [AppBarButton()],
                    ),
                  ),
                ),
                /*bottomNavigationBar: BottomNavigationBar(
                  items: bottomNavItems,
                  selectedItemColor: CustomColors.appColor,
                  unselectedItemColor: const Color(0xff666666),
                  currentIndex: selectedIndex,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),*/
                body: const Body())));
  }

  final List<Widget> bottomNavBody = const [
    JetSearch(),
    JetSearch(),
    JetSearch(),
    JetSearch(),
  ];
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/search.svg'),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/message.svg'),
      label: 'Message',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/host.svg'),
      label: 'Host',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/profile.svg'),
      label: 'Profile',
    ),
  ];
}
