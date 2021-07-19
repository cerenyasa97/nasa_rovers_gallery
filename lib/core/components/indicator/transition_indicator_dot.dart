import 'package:rovers/core/extensions/context/context_extension.dart';
import 'package:flutter/material.dart';

/*
 PageView widgetında sayfa geçişlerini göstermek için aktif olmayan indeksde genişliği fazla,
 diğer indekslerde ise yuvarlak bir container döndürür.

 Örnek: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _offersList.length,
            (index) => ValueListenableBuilder(
              valueListenable: _pageIndex,
              builder: (context, value, child) => TransitionIndicatorDot(
                currentPageIndex: value,
                currentContainerIndex: index,
              ),
            ),
          ),
        ),
*/
class TransitionIndicatorDot extends StatelessWidget {
  final int currentPageIndex;
  final int currentContainerIndex;
  final Duration? duration;
  final double radius;
  final selectedColor;
  final unselectedColor;

  TransitionIndicatorDot(
      {Key? key,
      required this.currentPageIndex,
      required this.currentContainerIndex,
      required this.selectedColor,
      required this.unselectedColor,
      this.radius = 8,
      this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration ?? Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: currentPageIndex == currentContainerIndex
          ? context.dynamicWidth((3 * radius))
          : context.dynamicWidth(radius),
      height: context.dynamicWidth(radius),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.dynamicWidth(radius)),
        color: currentPageIndex == currentContainerIndex
            ? selectedColor
            : unselectedColor,
      ),
    );
  }
}
