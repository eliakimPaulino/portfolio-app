// import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../data/flutter_projects.dart';
import '../../data/python_projects.dart';
import '../../reponsive.dart';
import '../../widgets/cards/flutter_project_card.dart';
import '../../widgets/cards/python_project_card.dart';
import '../../widgets/header/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          // ignore: sort_child_properties_last
          child: const Icon(Icons.share, color: Colors.white),
          backgroundColor: Colors.black,
          onPressed: () {}),
      body: SafeArea(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24.5),
                        child: Image.asset('assets/img/flutter_logo.png',
                            fit: BoxFit.cover, height: 45),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Flutter Projects',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ScrollConfiguration(
                    behavior: MyCustomScrollBrehavior(),
                    child: Responsive(
                      mobile: mobileTabletBuilder(350, true),
                      tablet: mobileTabletBuilder(450, true),
                      desktop: desktopBuilder(true),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24.5),
                        child: Image.asset(
                          'assets/img/python_logo.png',
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Python Automation Projects',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ScrollConfiguration(
                    behavior: MyCustomScrollBrehavior(),
                    child: Responsive(
                      mobile: mobileTabletBuilder(350, false),
                      tablet: mobileTabletBuilder(450, false),
                      desktop: desktopBuilder(false),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomScrollBrehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

Widget mobileTabletBuilder(double height, bool instance) {
  return SizedBox(
    height: height,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: instance ? flutterProjects.length : pythonProjects.length,
      itemBuilder: (context, index) {
        if (instance) {
          return FlutterProjectCard(project: flutterProjects[index]);
        }
        return PythonProjectCard(project: pythonProjects[index]);
      },
    ),
  );
}

Widget desktopBuilder(bool instance) {
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
    ),
    itemCount: instance ? flutterProjects.length : pythonProjects.length,
    itemBuilder: (context, index) {
      if (instance) {
        return FlutterProjectCard(project: flutterProjects[index]);
      }
      return PythonProjectCard(project: pythonProjects[index]);
    },
  );
}
