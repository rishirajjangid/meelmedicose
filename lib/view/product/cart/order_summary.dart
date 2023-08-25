import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹ 378',
                    style: TextStyle(
                      color: AppColor.darkText,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'VIEW PRICE DETAILS',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColor.appColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              // button
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColor.appColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Place Order',
                    style: TextStyle(
                        color: AppColor.backgroundColor, fontSize: 15),
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
          "Order Summary",
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
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Card(
                //elevation: 0,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Row(
                    children: [
                      Icon(Icons.delivery_dining_outlined),
                      SizedBox(width: 10),
                      Text(
                        "Argument is null, the text will use the style 8th Aug",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: const DecorationImage(
                          image: ExactAssetImage(ImageAssets.profile),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 0.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 230,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sumo Cold Tablet 10'S",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const Text(
                            "₹ 136",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 110,
                        width: 40,
                        child: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.chevron_right_outlined,
                                  size: 30,
                                )))),
                  ],
                ),
              ),
              const Divider(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Color(0xFF37a497),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Delivery Address",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Text(
                              "MeelMedicose",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "9711222211",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 300,
                              child: const Text(
                                "parameter must not be null.meel parameter",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.chevron_right_sharp,
                                  size: 30,
                                ))
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     const Text(
                        //         "The [data] parameter must not be null. meel  parameter"),
                        //     IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(
                        //           Icons.chevron_right_outlined,
                        //           size: 40,
                        //         ))
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Payment Mode",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Cash on Delivery",
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.chevron_right_sharp,
                                  size: 30,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price Details (1 Item)",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Product Price",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.dashed,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                            Text(
                              " + ₹136",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Total",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " + ₹136",
                          style: TextStyle(
                            fontSize: 14,
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
      ),
    );
  }
}
