import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toturial/utils/bindings/initial_binding.dart';
import 'package:flutter_toturial/utils/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('lo'),
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  String _calculateInitialRoute() {
    final storage = GetStorage();
    var token = storage.read('token') ?? '';
    print(token);
    return token.isEmpty ? '/' : '/nav';
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: _calculateInitialRoute(),
      getPages: AppRoute.routes,
    );
  }
}
