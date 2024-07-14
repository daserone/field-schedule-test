import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/data/models/schedule_model.dart';
import 'package:test_agenda/domain/provider/bottom_navigation_provider.dart';
import 'package:test_agenda/domain/provider/field_provider.dart';
import 'package:test_agenda/domain/provider/position_provider.dart';
import 'package:test_agenda/domain/provider/schedule_provider.dart';
import 'package:test_agenda/domain/provider/weather_provider.dart';
import 'package:test_agenda/core/theme/theme.dart';
import 'package:test_agenda/domain/router/router_config.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ScheduleModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScheduleProvider()),
        ChangeNotifierProvider(create: (context) => FieldProvider()),
        ChangeNotifierProvider(create: (context) => PositionProvider()),
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'test flutter',
        theme: appTheme,
        routerConfig: router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
        ],
      ),
    );
  }
}
