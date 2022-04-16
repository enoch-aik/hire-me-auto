import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_me_auto/screens/jet_search/components/select.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10),
      height: 55,
      child: TextField(
        onTap: () {},
        decoration: InputDecoration(
            hintText: 'Search by car brand, and color',
            hintStyle: GoogleFonts.openSans(fontSize: 16.sp, color: Colors.black),
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
            suffixIcon:
                KSelectOptionsButton(menuItems: const [], onChange: (val) {})),
      ),
    );
  }
}
