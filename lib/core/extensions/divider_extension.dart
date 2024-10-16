import 'package:flutter/material.dart';

extension DividerExtension on num {
  Widget divider({Color? color, double? height}) => Divider(
    color: color ?? Colors.black,
    indent: double.parse(toString()),
    endIndent: double.parse(toString()),
    height: height ?? 1,
  );
}
