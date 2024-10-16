import 'package:flutter/material.dart';

extension SizedBoxExtensions on double {
  SizedBox heightSpace() => SizedBox(
    height: this,
  );

  SizedBox widthSpace() => SizedBox(
    width: this,
  );
}
