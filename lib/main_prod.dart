import 'package:riverpod_state_management/app/environment.dart';

import 'main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.prod);
}
