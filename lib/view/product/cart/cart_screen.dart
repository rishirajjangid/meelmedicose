import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meelmedicose/view/product/cart/address.dart';
import '../../../res/colors/app_color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _cartAmount = 1;
  late bool _showCart;

  List<String> productNames = [
    'Meelmedicose 1',
    'Meel 2',
    'Meelmedicose 3',
    'Meel 4',
    'Meelmedicose 5',
  ];
  List<int> itemQuantity = [1, 1, 1, 1, 1];
  List<double> prices = [2.0, 55.0, 15.55, 30.0, 22.0];
  List<String> images = [
    'assets/images/picture.jpg',
    'assets/images/picture.jpg',
    'assets/images/profile.jpg',
    'assets/images/picture.jpg',
    'assets/images/picture.jpg',
  ];
  void incrementQuantity(int index) {
    setState(() {
      itemQuantity[index]++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      itemQuantity[index]--;
    });
  }

  double getCartToal() {
    double total = 0.0;
    for (int i = 0; i < productNames.length; i++) {
      total += itemQuantity[i] * prices[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    _showCart = _cartAmount > 1;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.white,
        height: 70,
        child:
            // row of text and button
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // column of text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cart Total',
                    style: TextStyle(fontSize: 18.0, color: AppColor.appColor),
                  ),
                  Text(
                    '₹ ' + getCartToal().toStringAsFixed(2),
                    // '₹ 498',
                    style: const TextStyle(
                        color: AppColor.darkText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              // button
              InkWell(
                onTap: () => Get.to(() => const Address()),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColor.appColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      color: AppColor.backgroundColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "My Cart",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          color: AppColor.myCartBackgroundColor,
          child: Center(
            child: Container(
              color: AppColor.backgroundColor,
              child: Column(children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: productNames.length,
                    itemBuilder: (context, index) {
                      // var string = data[index].title;
                      // if (string.length > 20) {
                      //   string = string.substring(0, 20) + '..'; // 'art'
                      // }
                      return Dismissible(
                        key: Key(productNames[index]),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            productNames.remove(index);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.cancel, color: Colors.white),
                          alignment: Alignment.centerRight,
                        ),
                        child: Card(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        images[index],
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      SizedBox(
                                        width: 160,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productNames[index],
                                              style: const TextStyle(
                                                  fontSize: 18.0),
                                            ),
                                            Text(
                                              '₹ ' + prices[index].toString(),
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: AppColor.appColor)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: _showCart
                                                  ? () => setState(() {
                                                        decrementQuantity(
                                                            index);
                                                      })
                                                  : null,
                                              // onPressed: _showCartBadge
                                              //     ? () => setState(() {
                                              //           _cartBadgeAmount--;
                                              //         })
                                              //     : null,
                                              icon: const Icon(
                                                Icons.remove_circle,
                                                size: 22,
                                                color: AppColor.appColor,
                                              ),
                                            ),
                                            Text(
                                              itemQuantity[index].toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: AppColor.appColor,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                incrementQuantity(index);
                                              },
                                              // onPressed: () => setState(() {
                                              //   _cartBadgeAmount++;
                                              // }),
                                              icon: const Icon(
                                                Icons.add_circle,
                                                size: 22,
                                                color: AppColor.appColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      );
                    }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
