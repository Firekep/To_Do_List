import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/screens/home/ultility/alertbox/patch_notes_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkTheme = true;

@override
  void didChangeDependencies() {
    _load();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        backgroundColor: Colors.transparent,
        child: Image.asset(
          'assets/image/Retro-Block-Question-icon.png',
          width: 150,height: 50,
        ),
      ),
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: isDarkTheme? const AssetImage(
                  'assets/image/space3.png',
              ) : const AssetImage(
                'assets/image/space2.png',
              ),
              fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: isDarkTheme? const Text(
                    '"Seja como a lua"',
                    style: TextStyle(fontSize: 21,color: Colors.white),
                  ) : const Text(
                    '"Seja como o sol"',
                    style: TextStyle(fontSize: 21,color: Colors.white),
                  )

                ),
                Center(
                  child: isDarkTheme? const Text(
                    '"Procure brilhar em meio as trevas..."',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ) :  const Text(
                    '"Seja luz em meio as trevas..."',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
            Center(
              child: isDarkTheme?  Image.asset(
                'assets/image/moon.png',
                width: 150,
                height: 150,
              ) : Image.asset(
                'assets/image/sun.png',
                width: 150,
                height: 150,
              )
            ),
          ],
        ),
      ),
    );
  }
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const PatchNotes();
      },
    );
  }

  Future _load() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getBool('isDarkTheme');

    setState(() {
      if (theme == false) {
        isDarkTheme = false;
      } else {
        isDarkTheme = true;
      }
    });
  }

}
