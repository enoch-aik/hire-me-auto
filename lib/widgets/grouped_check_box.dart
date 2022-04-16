import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_me_auto/src/constants/text.dart';
import 'package:hire_me_auto/widgets/td_checkbox.dart' as k;

class GroupedCheckBox extends StatelessWidget {
  final String label;
  final List<String> options;
  late final ValueNotifier<List<bool>> state =
      ValueNotifier(List.generate(options.length, (index) => false));
  GroupedCheckBox({Key? key, required this.label, required this.options})
      : assert(options.isNotEmpty),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
          child: kText(label, fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        ValueListenableBuilder<List<bool>>(
            valueListenable: state,
            builder: (context, boxState, _) {
              return Column(
                children: options
                    .asMap()
                    .entries
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          k.Checkbox(
                            value: boxState[e.key],
                            onChanged: (val) => _onChanged(val!, e.key),
                          ),
                          Text(options[e.key], style: theme.bodyMedium)
                        ],
                      ),
                    )
                    .toList(),
                crossAxisAlignment: CrossAxisAlignment.start,
              );
            })
      ],
    );
  }

  void _onChanged(bool val, int index) {
    state.value =
        List.generate(options.length, (i) => i == index ? val : false);
  }
}
