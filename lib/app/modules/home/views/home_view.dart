import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:video_player/video_player.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff387356),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 50,
                      child: Center(
                          child: Text(
                        'TOORAWING',
                        style: GoogleFonts.roboto(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(15, 15),
                                  blurRadius: 15),
                            ]),
                      ))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "ENTER YOUR OWN TEXT",
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        "& MODELS IMAGES & POSE IMAGE",
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Container(
                        color: Colors.green,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
              indent: 20,
              color: Colors.black,
            ),
            SectionName(text: "1. TEXT"),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 20, right: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.white,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 5, bottom: 5, top: 5, right: 5),
                        hintText: 'ENTER CARTOON KEYWORDS',
                        hintStyle: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff818181)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      controller: controller.requestController,
                    ),
                  )),
                  Container(
                    height: 48,
                    width: 50,
                    margin: EdgeInsets.only(left: 5),
                    color: Colors.black,
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      child: Text(
                        'ENTER',
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SectionName(text: "2. MODEL"),
            Container(
              height: 180,
              padding: EdgeInsets.only(left: 20),
              child: GetBuilder<HomeController>(builder: (context) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.models.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == controller.models.length)
                      return Container(
                        height: 100,
                        width: 20,
                        color: Colors.black,
                        child: MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: controller.pickImage,
                          child: Text(
                            '+',
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                      );
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black)),
                      child: MaterialButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          controller.selectChange(index);
                        },
                        child: Stack(
                          children: [
                            ImageNetwork(
                              image: controller.models[index].profile!,
                              height: 180,
                              width: 150,
                            ),
                            Container(
                              height: 180,
                              width: 150,
                              color: Colors.transparent.withOpacity(
                                  controller.selected == index ? 0 : 0.5),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            SectionName(text: "3. POSE"),
            Container(
              height: 110,
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: GetBuilder<HomeController>(builder: (context) {
                return Row(
                  children: [
                    controller.poze == null
                        ? Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                color: Colors.white),
                            height: 100,
                            width: 100,
                          )
                        : kIsWeb
                            ? Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: Image.network(
                                  controller.poze!.path,
                                  height: 100,
                                  width: 100,
                                ),
                              )
                            : Image.file(File(controller.poze!.path)),
                    Container(
                      height: 100,
                      width: 20,
                      color: Colors.black,
                      child: MaterialButton(
                        padding: EdgeInsets.all(0),
                        onPressed: controller.pickImage,
                        child: Text(
                          '+',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          width: 320,
                          height: 60,
                          child: MaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: controller.generate,
                            child: Text(
                              'GENERATE',
                              style: GoogleFonts.roboto(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black.withOpacity(0.5),
                                        offset: const Offset(15, 15),
                                        blurRadius: 15),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Center(
              child: GetBuilder<HomeController>(
                builder: (context) {
                  print(controller.focus);
                  return Container(
                    height: 400,
                    width: 300,
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: (controller.focus == "")
                        ? Container(height: 380,width: 280,
                    color: Colors.white,)
                        : ImageNetwork(
                          image: controller.focus,
                          height: 380,
                          width: 280,
                        ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionName extends StatelessWidget {
  const SectionName({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
      child: Text(
        text,
        style: GoogleFonts.roboto(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            shadows: [
              Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(15, 15),
                  blurRadius: 15),
            ]),
      ),
    );
  }
}
