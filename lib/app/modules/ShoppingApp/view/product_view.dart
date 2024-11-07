import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../constant/image_const.dart';
import '../../routes/app_pages.dart';
import '../../utility/loading_widget.dart';
import '../../widget/bike_widget.dart';
import '../../widget/custom_gradient_button.dart';
import '../../widget/custom_nemorphic_card.dart';
import '../controller/product_controller.dart'; // Import Get package

class ProudtMainView extends StatefulWidget {
  ProudtMainView({super.key});

  @override
  State<ProudtMainView> createState() => _ProudtMainViewState();
}

class _ProudtMainViewState extends State<ProudtMainView> {
  void handleSearchTap() {
    print('Search button tapped!');
  }

  List<ItemList> items = [
    ItemList(name: 'All', image: ImageConst.bolImage),
    ItemList(name: '', image: ImageConst.roadImage),
    ItemList(name: '', image: ImageConst.trimage),
    ItemList(name: '', image: ImageConst.helmetImage),
  ];

  @override
  void initState() {
    super.initState();
    Get.put(ProductController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return controller.isLoading
          ? const Scaffold(
              body: Center(
                child: LoadingWidget(),
              ),
            )
          : SafeArea(
              child: Scaffold(
                backgroundColor: const Color(0xFF242C3B),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    topView(handleSearchTap),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 13, right: 13, top: 15),
                      child: Transform.rotate(
                        angle:
                            0.04, // Slight tilt effect to simulate 3D rotation

                        child: CustomNeumorphicCard(
                          imagePath: ImageConst.cycleImage,
                        ),
                      ),
                    ),
                    // Category Buttons
                    staircaseButtons(items),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: GridView.builder(
                          itemCount: controller.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.ProductDetails,
                                    arguments: {
                                      'product': controller.products[index]
                                    },
                                  );
                                },
                                child: Transform.rotate(
                                  angle: 0.04,
                                  child: BikeItemCard(
                                      name: controller.products[index].title ??
                                          '',
                                      price:
                                          '${controller.products[index].price}',
                                      // Use `product.price` directly
                                      image: controller.products[index].category
                                              ?.image ??
                                          '',
                                      // Use `product.image` directly
                                      discount: controller.products[index].price
                                          .toString()),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }

  Widget topView(VoidCallback onSearchTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Choose Your Bike",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            height: 40,
            width: 60,
            onTap: onSearchTap,
            gradient: const LinearGradient(
              colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.017,
                1.0
              ], // You can adjust the stops based on your preference
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget staircaseButtons(List<ItemList> items) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Horizontal scrolling
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            double offset = index * 10.0; // Each step increases by 10 units

            return Padding(
              padding: EdgeInsets.only(left: 35.0, right: 10.0, bottom: offset),
              // Vertical offset
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (index == 0) ...[
                    CustomButton(
                      height: 40,
                      width: 50,
                      onTap: () {},
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF5B6E7D), // lighter version of #353F54
                          Color(0xFF3A4759), // lighter version of #222834
                        ],
                        begin: Alignment(0.0, -1.0), // top-left
                        end: Alignment(0.0, 1.0), // bottom-right
                      ),
                      child: const Text(
                        "All",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ] else ...[
                    CustomButton(
                        height: 40,
                        width: 50,
                        onTap: () {},
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF5B6E7D), // lighter version of #353F54
                            Color(0xFF3A4759), // lighter version of #222834
                          ],
                          begin: Alignment(0.0, -1.0), // top-left
                          end: Alignment(0.0, 1.0), // bottom-right
                        ),
                        child: Image.asset('${items[index].image}')),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemList {
  String? name;
  String? image;

  ItemList({this.image, this.name});
}
