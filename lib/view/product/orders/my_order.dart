import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meelmedicose/view/product/orders/order_detail.dart';
import '../../../res/assets/image_assets.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Container(
        child: Column(
          children: [
            _myOrder(),
            const SizedBox(height: 20),
            _myOrder(),
          ],
        ),
      ),
    );
  }

//////MyOrder/////
  Card _myOrder() {
    return Card(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("10th August"),
              ),
            ],
          ),
          const Divider(),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order ID 00001"),
                    Text("Sold to rahul"),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            height: 15,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Supplier: Jstuy Store"),
              ),
            ],
          ),
          const Divider(),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          child: const Text(
                            "Sumo Cold Tablet 10'S Sumo Cold Tablet 10'S Sumo Cold Tablet 10'S Sumo Cold Tablet 10'S",
                            style: TextStyle(),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => const OrderDetails()),
                          child: Container(
                            width: 100,
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Cancelled",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

/////AppBar/////
  AppBar appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        "My Order",
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
    );
  }
}
