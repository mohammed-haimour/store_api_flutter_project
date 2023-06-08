import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_app/core/constants/hive_boxes.dart';
import 'package:store_app/core/constants/themes.dart';
import 'package:store_app/core/utils/services/api_services.dart';
import 'package:store_app/features/auth/domain/entities/login_entity.dart';
import 'package:store_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SignInEntityAdapter());
  await Hive.openBox<SignInEntity>(singingBox);
  Hive.registerAdapter(HomeEntityAdapter());
  await Hive.openBox<HomeEntity>(homeBox);

  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool result = false;

  @override
  void initState() {
    var values = Hive.box<SignInEntity>(singingBox).values;
    if (values.length == 1) {
      result = true;
    } else {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
      home: (result) ? const HomeView() : const SingInView(),
    );
  }
}
