


import 'package:get_it/get_it.dart';

import 'calls_and_messages_service.dart';

GetIt locater = GetIt.I;

void setupLocator() {
  locater.registerSingleton(CallsAndMessagesService());
}