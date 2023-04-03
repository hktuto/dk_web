import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/breath_controller.dart';

class BreathView extends GetView<BreathViewController> {
  @override
  Widget build(BuildContext context) {
    BreathController breathController = Get.find<BreathController>();
    RouterController router = Get.find<RouterController>();
    return SafeArea(
        child: Stack(
      children: [
        Positioned(child: Obx(() => Text(controller.countDownText.toString()))),
        Obx(() => breathController.isBreathing.isTrue
            ? Positioned(
                bottom: 0,
                left: 24.0,
                right: 24.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => breathController.restatBreath(),
                        style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 4.0),
                            
                        ),
                        child:  Text(LocaleKeys.breath_restart.tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal))),
                    TextButton(
                        onPressed: () {
                          breathController.stopBreath();
                        },
                        style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 4.0),
                            
                        ),
                        child: Text(LocaleKeys.breath_stop.tr,
                            style: const  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal)))
                  ],
                ))
            : Positioned(
                bottom: 0,
                right: 20,
                child: Center(
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, style: BorderStyle.solid, color:Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0))),
                    child: Center(
                      child: TextButton(
                        onPressed: () => breathController.cancelBreath(),
                        child:  Text(LocaleKeys.breath_backToMenu.tr, style: const TextStyle(color: Colors.white, fontSize: 12.0) ),
                      )
                      
                      
                    ),
                  ),
                ))),
                Positioned(
                  top:0,
                  right: 0,
                  child: Obx(() => 
                    breathController.musicMute.isTrue ?
                    IconButton(
                      onPressed: ()=> breathController.toggleMute(), 
                      icon: const Icon(Icons.music_off, color: Colors.white, ) 
                      ) :
                    IconButton(
                      onPressed:()=> breathController.toggleMute(), 
                      icon: const Icon(Icons.music_note_sharp , color: Colors.white,) 
                      )
                  )
                )
      ],
    ));
  }
}
