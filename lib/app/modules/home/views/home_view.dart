import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:video_player/video_player.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<HomeController>(builder: (context) {
            return controller.videoReady
                ? SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        width: controller
                                .videoPlayerController.value.size?.width ??
                            0,
                        height: controller
                                .videoPlayerController.value.size?.height ??
                            0,
                        child: VideoPlayer(controller.videoPlayerController),
                      ),
                    ),
                  )
                : Container();
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
            child: GlassmorphicContainer(
                borderRadius: 20,
                blur: 40,
                border: 2,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.7),
                      Color(0xFFFFFFFF).withOpacity(0.5),
                    ],
                    stops: [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.5),
                    Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                width: double.infinity,
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Center(child: Text('SERVICE NAME'))),
                      SizedBox(
                        width: double.infinity,
                          height: 40,
                          child: TextField()),
                      MaterialButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {  },
                        child: GlassmorphicContainer(
                          borderRadius: 15,
                          blur: 40,
                          border: 2,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFffffff).withOpacity(0.7),
                                Color(0xFFFFFFFF).withOpacity(0.5),
                              ],
                              stops: [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFffffff).withOpacity(0.5),
                              Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Generate'
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}