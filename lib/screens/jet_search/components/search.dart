import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_me_auto/screens/jet_search/components/popup.dart';
import 'package:hire_me_auto/widgets/filter_overlay.dart';

final key = GlobalKey<_SearchState>();

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  OverlayEntry? _entry;

  OverlayEntry get entry => _entry!;
  final layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();

  FocusNode get focusNode => _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showFilterOverlay();
      } else {
        _focusNode.unfocus();
        _hideOverlay();
      }
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) => _hideOverlay());
  }

  Widget buildOverlay() {
    return const MoveToClipper();
  }

  showFilterOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final overlay = Overlay.of(context)!;

    _entry = OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                  link: layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0, size.height - 5),
                  child: buildOverlay()),
            ));
    overlay.insert(_entry!);
    _focusNode.hasFocus == true;
  }

  get hideOverlay => _hideOverlay();

  _hideOverlay() {
    _focusNode.unfocus();
    _entry?.remove();
    _entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 10),
        height: 55,
        child: TextField(
          onTap: () {
            _hideOverlay();
          },
          decoration: InputDecoration(
              hintText: 'Search by car brand, and color',
              hintStyle:
                  GoogleFonts.openSans(fontSize: 16, color: Colors.black),
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              suffixIcon: const PopUp()
              /*InkWell(
                focusNode: _focusNode,
                onTap: () {
                  showFilterOverlay();
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/svg/filter.svg'),
                ),
              )*/
              ),
        ),
      ),
    );
  }
}
