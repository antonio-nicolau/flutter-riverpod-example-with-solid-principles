import 'package:flutter/material.dart';
import 'package:giphy_for_all/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}
