// @dart=2.16

import 'dart:ui' as ui;

import 'package:bunch_of_facts/main.dart' as entrypoint;

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  entrypoint.main();
}
