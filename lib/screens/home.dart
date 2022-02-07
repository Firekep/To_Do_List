import 'package:flutter/material.dart';
import 'package:to_do_list/models/ultilits/alertboxes/patch_notes_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/space3.png'),fit: BoxFit.cover),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                Center(
                  child: Text(
                    '"Seja como a lua"',
                    style: TextStyle(fontSize: 21,color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    '"Procure brilhar em meio as trevas..."',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
            Center(
              child: Image.asset(
                'assets/image/moon.png',
                width: 150,
                height: 150,
              ),
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
}
