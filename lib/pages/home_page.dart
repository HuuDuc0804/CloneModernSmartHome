import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_smart_home/util/smart_device_box.dart';

import '../database/my_smart_devices.dart';
import '../util/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Custom appBar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            //Welcome Home
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home,',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    'Your name',
                    style: GoogleFonts.bebasNeue(fontSize: 52),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Device',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.grey[800]),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: mySmartDevies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: ((context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevies[index][0],
                        iconPath: mySmartDevies[index][1],
                        powerOn: mySmartDevies[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }))),
          ],
        ),
      ),
    );
  }

  powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevies[index][2] = value;
    });
  }
}
