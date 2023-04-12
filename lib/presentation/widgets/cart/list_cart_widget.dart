import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/cart/cart_model.dart';
import '../../controllers/cart/cart_controller.dart';

class ListCartWidget extends GetWidget<CartController> {
  final RxList<Datum> cart;
  final int index;
  const ListCartWidget({
    required this.cart,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          leading: Obx(
            () => controller.isLoading.value
                ? const CircularProgressIndicator()
                : CircleAvatar(
                    backgroundImage: NetworkImage(cart[index].productsPhoto!),
                    radius: 30,
                  ),
          ),
          title: Row(
            children: [
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart[index].productsName!,
                      style: const TextStyle(
                          fontSize: 17, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Rp. ${cart[index].price.toString()}',
                      style: const TextStyle(
                          fontSize: 15, color: Color(0xFFFA4A0C)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFDF2C2C)),
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.remove),
                          iconSize: 20,
                          color: Colors.white,
                          onPressed: () {}),
                      Obx(() => Text(
                            cart[index].quantity.toString(),
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white),
                          )),
                      IconButton(
                          icon: const Icon(
                            Icons.add,
                          ),
                          iconSize: 20,
                          color: Colors.white,
                          onPressed: () {}),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
