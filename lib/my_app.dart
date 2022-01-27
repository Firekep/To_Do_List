import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/screens/app_home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(198, 45, 91, 1),)
                )
            ),
            primaryColorLight: Colors.white,
            backgroundColor: Colors.redAccent,
            iconTheme: const IconThemeData(color: Colors.white),
            primaryColor: Colors.black,
            shadowColor: const Color.fromRGBO(155, 22, 61, 1),//used to button theme
            focusColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromRGBO(155, 22, 61, 1),
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.black87),
            ),
            primarySwatch: Colors.teal,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: const Color.fromRGBO(209, 36, 113, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hoverColor: Colors.white,
              focusColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              border: UnderlineInputBorder(),
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          darkTheme: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(1,1,1,0.9),
                  )
              )
            ),
            primaryColorLight: Colors.white,
            shadowColor: Colors.black, // used to button theme
            focusColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
            dialogTheme: DialogTheme(
              backgroundColor: Colors.grey[800],
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 20),
            ),
            primaryColor: Colors.white,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: Colors.black87)),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.grey,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.black54,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hoverColor: Colors.white,
              focusColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              border: UnderlineInputBorder(),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.white,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            textTheme: const TextTheme(
                bodyText2: TextStyle(
                  color: Colors.white,
                ),
                bodyText1: TextStyle(
                  color: Colors.white,
                )),
          ),
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
    } catch (error){ if (kDebugMode) {
      print('Theme');
    }}
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
