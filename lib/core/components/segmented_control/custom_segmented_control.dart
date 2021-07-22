import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// First initialize a value notifier ValueNotifier<int> tabValue = ValueNotifier(0) to avoid setState;

/// Then, wrap the CustomSegmentedControl widget with ValueListenableBuilder to listen tab changes
/// ValueListenableBuilder<int>(
///               valueListenable: tabValue,
///               builder: (context, value, child) => CustomSegmentedControl(
///                 children: [Text("Tab1"), Text("Tab2"), Text("Tab3")],
///                 currentValue: value,
///                 onValueChanged: (index) {
///                  tabValue.value = index ?? 0;
///                 },
///               ),
///             )
class CustomSegmentedControl extends StatelessWidget {
  final List<Widget>? children;
  final List<String>? tabText;
  final Function(int?) onValueChanged;
  final int currentValue;
  Map<int, Widget> _childrenMap = {};

  CustomSegmentedControl(
      {Key? key,
      this.children,
      required this.onValueChanged,
      required this.currentValue,
      this.tabText}) {
    if (children != null || tabText != null) {
      for (var i = 0;
          i < (children == null ? tabText!.length : children!.length);
          i++) {
        _childrenMap[i] = (children == null
            ? Text(
                tabText![i],
                style: GoogleFonts.roboto(fontSize: 10),
              )
            : children![i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
        backgroundColor: Colors.transparent,
        children: _childrenMap,
        groupValue: currentValue,
        onValueChanged: onValueChanged);
  }
}
