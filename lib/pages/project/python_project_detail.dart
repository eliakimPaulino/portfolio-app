import 'package:flutter/material.dart';

import '../../models/python_project.dart';
import '../../reponsive.dart';

class PythonProjectDetail extends StatelessWidget {
  final PythonProject project;

  const PythonProjectDetail({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackButton(
                        onPressed: () => Navigator.pop(context),
                      ),
                      // const Spacer(),
                      Text(
                        project.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: Text(project.year.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ))),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Hero(
                    tag: project.imageAsset,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Responsive(
                        mobile: Image.asset(
                          project.imageAsset,
                          fit: BoxFit.cover,
                        ),
                        tablet: Image.asset(
                          project.imageAsset,
                          fit: BoxFit.cover,
                        ),
                        desktop: SizedBox(
                          height: 350,
                          child: Image.asset(
                            project.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'TECHNOLOGIES',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  HorizontalTechView(techList: project.technologiesUsed ?? []),
                  const SizedBox(height: 10),
                  const Text(
                    "DESCRIPTION",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    project.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
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

class HorizontalTechView extends StatelessWidget {
  final List<String> techList;

  const HorizontalTechView({
    Key? key,
    required this.techList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: techList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            margin: const EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Text(
              techList[index],
              style: const TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}
