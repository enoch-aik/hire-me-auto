import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hire_me_auto/widgets/grouped_check_box.dart';

const options = ["Automatic", "Manual"];
const optionsB = ["2010-2014", "2015-2019", "2020-2021"];
const optionsC = ["Yes", "No"];

class KSelectOptionsButton extends StatefulWidget {
  final List<OptionsMenu> menuItems;
  final double width;
  final double height;
  final ValueChanged<int> onChange;

  const KSelectOptionsButton({
    Key? key,
    required this.menuItems,
    this.width = 150,
    this.height = 50,
    required this.onChange,
  }) : super(key: key);

  @override
  _KSelectOptionsState createState() => _KSelectOptionsState();
}

class _KSelectOptionsState extends State<KSelectOptionsButton> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final caption = Theme.of(context).textTheme.caption;
    return PopupMenuButton<int>(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Column(
              children: [
                GroupedCheckBox(label: "Transmission", options: options),
                GroupedCheckBox(label: "Year", options: optionsB),
                GroupedCheckBox(label: "Tint", options: optionsC),
              ],
            ),
            value: 1,
            textStyle: caption,
          ),
        ];
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Color.fromRGBO(234, 237, 245, 0.5),
        ),
      ),
      elevation: 0.7,
      offset: const Offset(0, 40),
      padding: EdgeInsets.zero,
      child: Container(
          height: 19,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent),
          child: SvgPicture.asset(
            'assets/svg/filter.svg',
            height: 30,
          ),
          alignment: Alignment.center),
      onSelected: (val) {
        index = val;
        widget.onChange(val);
      },
      tooltip: null,
    );
  }
}

class OptionsMenu {
  final String label;
  final Color primary;
  final String icon;

  OptionsMenu(this.label, this.primary, this.icon);
}
