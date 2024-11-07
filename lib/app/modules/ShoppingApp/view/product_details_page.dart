import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../constant/image_const.dart';
import '../../widget/custom_gradient_button.dart';
import '../controller/product_details_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductsDetailsPage extends GetView<ProductDetailsController> {
  const ProductsDetailsPage({super.key});

  void handleTap(BuildContext context, ProductDetailsController controller) {
    descriptionProduct(context, controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF242C3B),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            topView(() => handleTap(context, controller)),
            const SizedBox(height: 20),
            (controller.product.images != null &&
                    controller.product.images!.isNotEmpty)
                ? CarouselSlider.builder(
                    itemCount: controller.product.images!.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.network(
                        controller.product.images?[index] ??
                            '', // Assumes non-null
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          // Return a local asset image when an error occurs (like failed loading)
                          return Image.asset(
                            ImageConst
                                .cycleImage, // Provide path to your local image
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget topView(VoidCallback onSearchTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          CustomButton(
            height: 40,
            width: 50,
            onTap: onSearchTap,
            gradient: const LinearGradient(
              colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.017, 1.0],
            ),
            child: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 60),
          Text(
            controller.product.description ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

void descriptionProduct(
    BuildContext context, ProductDetailsController controller) {
  LinearGradient backgroundGradient = LinearGradient(
    colors: [
      const Color(0xFF1A2A3A).withOpacity(0.8),
      const Color(0xFF1E3C59).withOpacity(0.7),
      Colors.black.withOpacity(0.9),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.2, 0.6, 1.0],
  );

  double depth = 10;

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Neumorphic(
        style: NeumorphicStyle(
          depth: depth,
          color: Colors.transparent,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
          lightSource: LightSource.topLeft,
          shadowLightColor: Colors.black.withOpacity(0.2),
          intensity: 0.8,
        ),
        child: Container(
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: backgroundGradient,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(8, 8),
                blurRadius: 15,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                offset: Offset(-8, -8),
                blurRadius: 15,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Obx(() {
                      // Observe selectedTab from the controller
                      return CustomButton(
                        height: 40,
                        width: 150,
                        onTap: () {
                          controller.onTabChanged(0); // Set to Description
                        },
                        gradient: controller.selectedTab.value == 0
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFF3CA4EB),
                                  Color(0xFF4286EE),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : const LinearGradient(
                                colors: [Color(0xFF5B6E7D), Color(0xFF3A4759)],
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(0.0, 1.0),
                              ),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: controller.selectedTab.value == 0
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(width: 15),
                    Obx(() {
                      // Observe selectedTab from the controller
                      return CustomButton(
                        height: 40,
                        width: 150,
                        onTap: () {
                          controller.onTabChanged(1); // Set to Specification
                        },
                        gradient: controller.selectedTab.value == 1
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFF3CA4EB),
                                  Color(0xFF4286EE),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : const LinearGradient(
                                colors: [Color(0xFF5B6E7D), Color(0xFF3A4759)],
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(0.0, 1.0),
                              ),
                        child: Text(
                          "Specification",
                          style: TextStyle(
                            color: controller.selectedTab.value == 1
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(() {
                  // Observe selectedTab from the controller and show corresponding content
                  return Text(
                    controller.selectedTab.value == 0
                        ? '${controller.product.description}'
                        : '${controller.product.title}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    gradient: backgroundGradient,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$ ${controller.product.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue),
                          ),
                        ),
                        Spacer(),
                        CustomButton(
                          height: 40,
                          width: 120,
                          onTap: () {
                            controller.addToCart();
                            Navigator.pop(context);
                          },
                          gradient: const LinearGradient(
                            colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.017, 1.0],
                          ),
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
