import 'package:flutter/material.dart';

// class IndicatorWidget extends StatelessWidget {
//   final bool isActive;
//   const IndicatorWidget({super.key, required this.isActive});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 250),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100),
//         color: isActive ? Theme.of(context).primaryColor : Colors.grey,
//       ),
//       width: isActive ? 30 : 10,
//       height: 10,
//     );
//   }
// }

List<Widget> indicatorWidget(
    BuildContext context, int pagesLength, int currentIndex) {
  return List<Widget>.generate(
    pagesLength,
    (index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: currentIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
        width: currentIndex == index ? 30 : 10,
        height: 10,
        margin: const EdgeInsets.all(1),
      );
    },
  );
}
