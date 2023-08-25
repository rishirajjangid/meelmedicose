import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meelmedicose/res/colors/app_color.dart';

import '../state_list/state.dart';
import 'order_summary.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80,
        color: Colors.white,
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  "For a smooth delivery, maka sure your address is correct",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => Get.to(() => const OrderSummary()),
              child: Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColor.appColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Sava Address and Continue',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.backgroundColor,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Address",
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
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'House no./ Building Name',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Road Name / Area / Colony',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Pincode',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      )),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Jaipur ',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            )),
                      ),
                    ),
                    Container(
                        width: 170,
                        child: const Center(child: DropdownButtonExample())),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText:
                          'Nearby Famous Place/Shop/School,etc.(optional)',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      )),
                ),
              ),
              const Divider(),
              Container(
                height: 130,
                width: double.infinity,
                child: Column(children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.wifi_calling_3,
                        color: AppColor.appColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Contact Details",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Name ',
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Contact number ',
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                )),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
