// import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../example/projects.dart';
import '../../reponsive.dart';
import '../../widgets/cards/project_card.dart';
import '../../widgets/header/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          // ignore: sort_child_properties_last
          child: const Icon(Icons.share, color: Colors.white),
          backgroundColor: Colors.black,
          onPressed: () {}),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  const SizedBox(height: 20),
                  const Text('Projects',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  ScrollConfiguration(
                    behavior: MyCustomScrollBrehavior(),
                    child: Responsive(
                      mobile: mobileTabletBuilder(350),
                      tablet: mobileTabletBuilder(450),
                      desktop: desktopBuilder(),
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

Widget mobileTabletBuilder(double height) {
  return SizedBox(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: projects[index]);
          }));
}

Widget desktopBuilder() {
  return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      });
}
