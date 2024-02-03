import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';

class MyScrollingPages extends StatelessWidget {
  const MyScrollingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          const MyImages(),
          Positioned(
              bottom: 5,
              left: (MediaQuery.of(context).size.width - 250) * 0.5,
              width: 250,
              child: const MyDots())
        ],
      ),
    );
  }
}

class MyImages extends StatelessWidget {
  const MyImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.30,
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: PageView.builder(
          controller: myController.scrollingImagesModel.value.pageController,
          itemCount: Images.images.length,
          onPageChanged: (value) {
            myController.updateCurrentPage(value);
          },
          itemBuilder: (context, index) {
            return MyAssetImage(path: Images.images[index]);
          },
        ));
  }
}

class MyAssetImage extends StatelessWidget {
  const MyAssetImage({required this.path, super.key});

  final String path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(path, fit: BoxFit.fill);
  }
}

class MyDots extends StatelessWidget {
  const MyDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(10, (index) {
          myController.updateDotColor(dotIndex: index);

          return SizedBox(
            width: 25,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.circle,
                  size: 15,
                  color: myController.scrollingImagesModel.value.dotColor,
                )),
          );
        }),
      );
    });
  }
}
