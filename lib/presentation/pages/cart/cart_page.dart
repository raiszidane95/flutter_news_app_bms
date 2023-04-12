import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../../controllers/cart/cart_controller.dart';
import '../../widgets/cart/list_cart_widget.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF5F5F8),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: const Color(0xFFF5F5F8),
          elevation: 0.0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          title: const Text(
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Expanded(child: SkeletonListView())
              : Column(
                  children: [
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                            itemCount: controller.cartList.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  Slidable(
                                    key: const ValueKey(0),
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        CustomSlidableAction(
                                            backgroundColor:
                                                const Color(0xFFF5F5F8),
                                            onPressed: ((context) {}),
                                            child: CircleAvatar(
                                              radius: 26,
                                              backgroundColor: Colors.red,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon:
                                                    const Icon(Icons.favorite),
                                                color: Colors.white,
                                              ),
                                            )),
                                        CustomSlidableAction(
                                            backgroundColor:
                                                const Color(0xFFF5F5F8),
                                            padding: const EdgeInsets.only(
                                                right: 30),
                                            onPressed: ((context) {}),
                                            child: CircleAvatar(
                                              radius: 26,
                                              backgroundColor: Colors.red,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.delete_rounded),
                                                color: Colors.white,
                                              ),
                                            )),
                                      ],
                                    ),
                                    child: ListCartWidget(
                                      index: index,
                                      cart: controller.cartList,
                                    ),
                                  ),
                                ],
                              );
                            })),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 25,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: const Color(0xFFDF2C2C),
                        ),
                        child: const Text(
                          "Add to Order",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
        ));
  }
}
