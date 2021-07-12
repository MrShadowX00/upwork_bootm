import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:upwork_bottom/Controller/state_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  StateController stateController = Get.put(StateController());
  int resultValue = 0;
  List<Widget> stepList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: GetBuilder<StateController>(
          builder: (controller) {
            return CupertinoScaffold(
              body: Builder(
                builder: (context) => CupertinoPageScaffold(
                  backgroundColor: Colors.white,
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.changeState();
                              if(resultValue != int.parse(controller.currentIndex!)){
                                controller.currentIndex  = '0';
                              }
                                CupertinoScaffold.showCupertinoModalBottomSheet(
                                  expand: false,
                                  isDismissible: false,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) =>
                                      GetBuilder<StateController>(
                                        builder: (controller) {
                                          return Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(horizontal: 12),
                                                child: Container(
                                                  height: 450,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(15),
                                                    color: Colors.white,
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.all(12),
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    height: 200,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            // controller
                                                            //     .currentIndex =
                                                            // '0';
                                                            // controller
                                                            //     .startIndex = 0;
                                                            // controller
                                                            //     .endIndex =
                                                            // 10000;
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            width:
                                                            MediaQuery
                                                                .of(context)
                                                                .size
                                                                .width,
                                                            height: 20,
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .clear,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            'Shares',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 22,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .all(8.0),
                                                          child: Container(
                                                            child: Text(
                                                              '${controller
                                                                  .currentIndex}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 40,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 450,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 200,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      height: 250,
                                                      color: Color(0xFFa30263),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap:(){
                                                                   controller.decrement();
                                                                    },
                                                                  child: Container(
                                                                    child: Text(
                                                                      '${controller
                                                                          .startIndex}',
                                                                      style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: 14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: (){
                                                                    controller.increment();
                                                                  },
                                                                  child: Container(
                                                                    child: Text(
                                                                      '${controller
                                                                          .endIndex}',
                                                                      style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: 14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                           Container(
                                                              height: 30,
                                                              width: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .width,
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                      height: 30,
                                                                      width: MediaQuery
                                                                          .of(
                                                                          context)
                                                                          .size
                                                                          .width,
                                                                      child: controller
                                                                          .steps
                                                                  ),
                                                                  Container(
                                                                    height: 30,
                                                                    width: MediaQuery
                                                                        .of(
                                                                        context)
                                                                        .size
                                                                        .width,
                                                                    child: Center(
                                                                      child: Container(
                                                                        height: 30,
                                                                        width: 5,
                                                                        color: Colors
                                                                            .white60,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 8),
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  resultValue = int.parse(controller.currentIndex!);
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 120,
                                                                decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Save',
                                                                    style: TextStyle(
                                                                      color: Colors
                                                                          .purple[400],
                                                                      fontSize: 16,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                );
                            },
                            child: Container(
                              child: Text(
                                'select:',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:15,),
                            child: Container(
                              child: Text(
                                '$resultValue',
                                style: TextStyle(color: Colors.black,fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
