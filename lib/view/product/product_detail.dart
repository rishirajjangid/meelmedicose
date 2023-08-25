import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meelmedicose/view/product/cart/cart_screen.dart';
import '../../res/colors/app_color.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _cartBadgeAmount = 1;

  late bool _showCartBadge;

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 1;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.appColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: _showCartBadge
                          ? () => setState(() {
                                _cartBadgeAmount--;
                              })
                          : null,
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 22,
                        color: AppColor.appColor,
                      ),
                    ),
                    Text(
                      _cartBadgeAmount.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColor.appColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        _cartBadgeAmount++;
                      }),
                      icon: const Icon(
                        Icons.add_circle,
                        size: 22,
                        color: AppColor.appColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 150,
                child: MaterialButton(
                  color: const Color(0xFF37a494),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () => Get.to(() => const CartScreen()),
                  child: const Text(
                    "Add Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Product Detail",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Color(0xFF37a494)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                children: [
                  Container(
                      height: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://t4.ftcdn.net/jpg/01/18/42/59/360_F_118425925_n2GZJR42P1ai0p3qYmNe375LCd6kQ9R4.jpg"),
                            fit: BoxFit.fill,
                          ))),
                  const SizedBox(height: 10),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              // color: Colors.amber,
                              height: 25,
                              width: 150,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("Sumo*",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: Center(
                            child: Text(
                              "₹ 136",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(height: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "DIRECTIONS",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Take SUMO TABLET as advised by your physician. Swallow the medicine with a glass of water. Do not crush or chew the medicine. Your doctor will decide the correct dose and duration for you depending upon your age, body weight and disease condition.",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
