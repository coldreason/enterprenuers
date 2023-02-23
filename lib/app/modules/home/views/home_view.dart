import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:image_network/image_network.dart';
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
                : Container(
                    color: Colors.red,
                  );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
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
                height: 1200,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
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
                        Container(
                          height: 200,
                          child: GetBuilder<HomeController>(builder: (context) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.models.length,
                              itemBuilder: (BuildContext context, int index) {
                                return MaterialButton(
                                  onPressed: () {
                                    controller.selectChange(index);
                                  },
                                  child: Stack(
                                    children: [
                                      ImageNetwork(
                                        image: controller.models[index].profile!,
                                        height: 200,
                                        width: 120,
                                      ),
                                      Container(
                                        width: 120,
                                        height: 200,
                                        color: Colors.transparent.withOpacity(
                                            controller.selected == index
                                                ? 0
                                                : 0.5),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                        GetBuilder<HomeController>(
                          builder: (context) {
                            return Row(
                              children: [
                                controller.poze == null
                                    ? Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.white,
                                      )
                                    : kIsWeb? Image.network(controller.poze!.path,height: 100,width: 100,):Image.file(File(controller.poze!.path)),
                                MaterialButton(
                                  onPressed: controller.pickImage,
                                  child: Text('update'),
                                )
                              ],
                            );
                          }
                        ),
                        MaterialButton(
                          padding: EdgeInsets.all(10),
                          onPressed: controller.generate,
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
                              child: Text('Generate'),
                            ),
                          ),
                        ),
                        controller.focus == ""?Container(
                          height: 400,color: Colors.white,
                          child: ImageNetwork(
                            image: 'https://firebasestorage.googleapis.com/v0/b/enterprenuers.appspot.com/o/80c251ffaad1234b9360019dc8ed249f5c32ec4341479024f976fa6fc84a6eae8e388f84d9bdf648de42e80087f3c063d0cbfcf6b74f01f8bf901e82424913ba34207fa0674180b4bde388b8e2e2ba87639b6c7e2186ab41c32fd50b9b7ffe945ec68b258fcaa26991809b.jpg?alt=media&token=fb85d293-3dcc-4823-bdc5-53b856187cac',
                            height: 440,
                            width: 200,
                          ),
                        ):Container(
                          height: 400,color: Colors.white,
                          child: ImageNetwork(
                            image: controller.focus,
                            height: 400,
                            width: 120,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
