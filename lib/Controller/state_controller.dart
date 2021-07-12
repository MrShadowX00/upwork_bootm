import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StateController extends GetxController{

  ScrollController scrollController = ScrollController();
  double changeValue = 5000;
  int startIndex = 0;
  int endIndex = 5000;
  String? currentIndex='0';
  Widget steps= Container();


  @override
  void onInit() {
    scrollController.addListener(controllerListener);
    changeState();
    print('init');
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  increment(){
    startIndex = startIndex + 5000;
    endIndex = endIndex+5000;
    currentIndex = startIndex.toString();
    changeValue = endIndex.toDouble();
    changeState();
    update();
  }

  decrement(){
    if(startIndex != 0){
      startIndex = startIndex - 5000;
      endIndex = endIndex-5000;
      currentIndex = endIndex.toString();
      changeValue = endIndex.toDouble();
      changeState();
      update();
    }
  }


  changeState() async{
    print('$endIndex');
    if(currentIndex != '0'){
      scrollController = ScrollController(
        initialScrollOffset: double.parse(currentIndex!)*7.38
      );
      scrollController.addListener(controllerListener);
    }
    print('chaqirildi');
    steps =  ListView.builder(
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      itemCount: endIndex,
      itemBuilder: (context,index){
        if(index%5 == 0) {
          print(index);
          return Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              color: Colors.white,
              height: 25,
              width: 3,
            ),
          );
        }else{
          return Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              height: 15,
              width: 2,
            ),
          );
        }
      },);

    update();
  }

  controllerListener(){
    // print(scrollController.position.pixels);
    if((scrollController.position.pixels/7.38)>=changeValue){
      startIndex = changeValue.toInt();
      endIndex = endIndex+5000;
      changeValue = endIndex.toDouble();
      steps =  ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: endIndex,
        itemBuilder: (context,index){
          if(index%5 == 0) {
            print(index);
            return Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                color: Colors.white,
                height: 25,
                width: 3,
              ),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                color: Colors.white,
                height: 15,
                width: 2,
              ),
            );
          }
        },);

    }
      currentIndex = (scrollController.position.pixels~/7.38).toString();
    update();
  }

}