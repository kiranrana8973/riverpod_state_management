import 'package:riverpod_state_management/app/environment.dart';
import 'package:riverpod_state_management/main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.dev);
}
