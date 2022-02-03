import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/screens/principal_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/providers/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.light);

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: notifier,
      builder: (_, mode, __) {
        SystemChrome.setPreferredOrientations([
          // DeviceOrientation.portraitUp,
          // DeviceOrientation.portraitDown,
        ]);
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          // Decides which theme to show, light or dark.
          home: AppHome(
            onChangeTheme: (value) => _changeTheme(mode),
            isLightTheme: _isLightTheme,
          ),
        );
      },
    );
  }

  bool get _isLightTheme {
    return notifier.value == ThemeMode.light;
  }

  Future<void> _changeTheme(ThemeMode mode) async {
    bool isDarkTheme = mode == ThemeMode.dark;

    setState(() {
      notifier.value = isDarkTheme ? ThemeMode.light : ThemeMode.dark;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkTheme', isDarkTheme);
    } catch (error) {
      if (kDebugMode) {
        print('Theme');
      }
    }
  }

  Future _load() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getBool('isDarkTheme');

    setState(() {
      if (theme == false) {
        notifier = ValueNotifier(ThemeMode.dark);
      } else {
        notifier = ValueNotifier(ThemeMode.light);
      }
    });
  }
}
//      notifier.value = theme == true ? ThemeMode.dark : ThemeMode.light;
