import 'package:flutter/material.dart';
import 'package:simple_project/bar_code/qr_code_scanner/qr_code_scanner.dart';
import 'package:simple_project/capture_image/capture_image.dart';
import 'package:simple_project/google_map/google_map.dart';
import 'package:simple_project/json_parse/screen.dart';
import 'package:simple_project/roll_dice/roll_dice.dart';
import 'package:simple_project/to_do_app/screen/home_page_to_do.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          title: const Text(
            "All Page List",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            //To do part

            ListTile(
              title: const Text(
                "To Do App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(
                Icons.forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageToDo()));
              },
            ),
            const SizedBox(
              height: 10,
            ),

            //Roll Dice part

            ListTile(
              title: const Text(
                "Roll Dice",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(
                Icons.forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RollDice()));
              },
            ),
            const SizedBox(
              height: 10,
            ),

            //Capture image and save image in gallery

            ListTile(
              title: const Text(
                "Capture Image",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(
                Icons.forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CaptureImage()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text(
                "Json Parse",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(
                Icons.forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreenJsonParse()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text(
                "QrCode/BarCodeScanner",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(
                Icons.forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Scanner()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // ListTile(
            //   title: Text,
            // )
          ],
        ));
  }
}
