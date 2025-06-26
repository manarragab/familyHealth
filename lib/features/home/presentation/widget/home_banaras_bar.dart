// home_banaras_bar
import 'package:abg/data/const/export.dart';
import 'package:abg/features/home/presentation/widget/home_banar_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';


import 'dot_item.dart';

class HomeBanarasBar extends StatelessWidget {
  final List<String> images;

  HomeBanarasBar({
    Key? key,
    required this.images,
  }) : super(key: key);

  final getIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    double height = 120;
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: height,
            autoPlay: true,
            disableCenter: false,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            viewportFraction: 0.99,
            onPageChanged: (index,_){
              sPrint.info('index:: $index');
              getIndex(index);
            }
          ),
          itemCount: images.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return HomeBanarItem(
              imageUrl: images[itemIndex],
            );
          },
        ),
        Obx(() => Container(
              height: 20,
              alignment: Alignment.bottomCenter,
              // decoration: BoxDecoration(border:Border.all(color: Colors.black)),
              // padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    images.length,
                    (_) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 5),
                      child: DotItem(
                        currentIndex: getIndex.value,
                        index: _,
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
