import 'package:flutter/material.dart';

import 'package:get/get.dart';
 import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:jobstreet/Model/Market_model.dart';
import 'package:jobstreet/Model/modelOnboarding.dart';
import 'package:jobstreet/view/ViewAuth/Component/skip_button.dart';
import 'package:jobstreet/view/ViewAuth/Component/start_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../../controller/controllerOnboarding.dart';
import '../Component/animation.dart';
import '../Component/item_pageview.dart';



class Boarding extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white,
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: Item.length,
                    onPageChanged: (newIndex) {
                      print(controller.currentIndex.value);
                      controller.currentIndex.value = newIndex;
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                            

                              /// IMG
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15, 40, 15, 10),
                                width: Get.width,
                                height: Get.height / 2.5,
                                child: animation(
                                  index,
                                  100,
                                  Image.asset(Item[index].img),
                                ),
                              ),

                              /// TITLE TEXT
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, bottom: 15),
                                  child: animation(
                                    index,
                                    300,
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Text(
                                        Item[index].title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                         
                                        ),
                                      ),
                                    ),
                                  )),

                              /// SUBTITLE TEXT
                              animation(
                              index, 500, Text(Item[index].titledown,style: TextStyle(fontSize: 20),)),
                            SizedBox(height: 30,),
                            animation(
                              index,
                              500,
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  Item[index].txt,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w200),
                                ),
                              ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// PAGE INDICATOR
                      SmoothPageIndicator(
                        controller: controller.pageController,
                        count: Item.length,
                        effect: const ExpandingDotsEffect(
                          spacing: 6.0,
                          radius: 10.0,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          expansionFactor: 3.8,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.green,
                        ),
                        onDotClicked: (newIndex) {
                          controller.currentIndex.value = newIndex;
                          controller.pageController.animateToPage(newIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                      ),

                      const SizedBox(height: 10),

                      controller.currentIndex.value == 3

                          /// GET STARTED BTN
                          ? StartBtn(onTap: () {  },
                              // size: size,
                            
                            )

                          /// SKIP BTN
                          : SkipBtn(
                              // size: size,
                              onTap: () {
                                controller.pageController.animateToPage(3,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.fastOutSlowIn);
                              },
                            ),
                   
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
      
      
    
  }
}
