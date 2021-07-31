import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:upwork_bottom/Screens/main_screen.dart';

class StateController extends GetxController {
  List<Widget> list = [];
  static ScrollController scrollController = ScrollController();
  double changeValue = 5000;
  int startIndex = 0;
  int endIndex = 5000;
  String? currentIndex = '0';
  double vh = (MediaQueryData.fromWindow(window).size.width/2)-10;

  static Widget steps = Container();

  @override
  void onInit() {
    list.add(
      Container(
        width: vh,
      ),
    );
    if (!MainScreen.isLimited) {
      for (int k = 0; k < 5000; k++) {
        if (k % 5 == 0) {
          print(k);
          list.add(
            Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white),
                height: 20,
                width: 2,
              ),
            ),
          );
        } else {
          list.add(
            Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 10,
                width: 1,
              ),
            ),
          );
        }
      }
    } else {
      startIndex = 2500;
      endIndex = 6500;
      currentIndex = '2500';
      for (int k = 0; k < 4001; k++) {
        if (k % 5 == 0) {
          print(k);
          list.add(
            Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white),
                height: 20,
                width: 2,
              ),
            ),
          );
        } else {
          list.add(
            Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 10,
                width: 1,
              ),
            ),
          );
        }
      }
    }
    list.add(
      Container(
        width: vh,
      ),
    );
    scrollController.addListener(controllerListener);
    changeState();
    print('init');
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  increment() {
    if (MainScreen.isLimited) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      currentIndex = '6500';
    } else {
      startIndex = startIndex + 5000;
      endIndex = endIndex + 5000;
      currentIndex = startIndex.toString();
      changeValue = endIndex.toDouble();
      changeState();
    }
    update();
  }

  decrement() {
    if (startIndex != 0) {
      if (MainScreen.isLimited) {
        currentIndex = '2500';
        scrollController.jumpTo(scrollController.position.minScrollExtent);
      } else {
        startIndex = startIndex - 5000;
        endIndex = endIndex - 5000;
        currentIndex = endIndex.toString();
        changeValue = endIndex.toDouble();
        changeState();
      }
      update();
    }else if(startIndex == 0){
      currentIndex = startIndex.toString();
      changeValue = endIndex.toDouble();
      scrollController.jumpTo(scrollController.position.minScrollExtent);
      changeState();
    }
  }

  changeState() async {
    print('$endIndex');
    if (MainScreen.isLimited) {
      if (currentIndex != '2500') {
        scrollController = ScrollController(initialScrollOffset: 5000);
        scrollController.addListener(controllerListener);
      }
    } else {
      if (currentIndex != '0') {
        scrollController = ScrollController(initialScrollOffset: 2500);
        scrollController.addListener(controllerListener);
      }
      print('chaqirildi');
    }
    steps = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      child: Row(
        children: list,
      ),
    );

    update();
  }

  controllerListener() {
    // print(scrollController.position.pixels);
    if (MainScreen.isLimited) {
      if (double.parse(currentIndex!) > endIndex) {
        currentIndex = endIndex.toString();
      } else if (double.parse(currentIndex!) < startIndex) {
        currentIndex = startIndex.toString();
      } else {
        currentIndex =
            (startIndex + (scrollController.position.pixels ~/ 7.2)).toString();
      }
    } else {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        startIndex = startIndex + 5000;
        endIndex = endIndex + 5000;
        changeValue = endIndex.toDouble();
        steps = SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          child: Row(
            children: list,
          ),
        );
        scrollController.position
            .jumpTo(scrollController.position.minScrollExtent + vh);
      } else if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        if (startIndex != 0) {
          startIndex = startIndex - 5000;
          endIndex = endIndex - 5000;

          steps = SingleChildScrollView(
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Row(
              children: list,
            ),
          );
          scrollController.position
              .jumpTo(scrollController.position.maxScrollExtent - vh);
        } else {
          if (changeValue > endIndex.toDouble()) {
            scrollController.position
                .jumpTo(scrollController.position.maxScrollExtent + vh);
          }
        }
        changeValue = endIndex.toDouble();
      }
      currentIndex =
          (startIndex + (scrollController.position.pixels ~/ 7.2)).toString();
    }
    update();
  }
}
