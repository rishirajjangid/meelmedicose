import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:meelmedicose/view/Profile/profile.dart';
import '../../res/assets/image_assets.dart';
import '../category/model/categorymin.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<String> imageList = [
  "https://media.istockphoto.com/id/1130632811/photo/gavel-with-stethoscope-on-white-background.webp?b=1&s=170667a&w=0&k=20&c=cDpatThYIa0sZwrgnWImWTuX8JJkVpyxMfGzwYkEtCw=",
  "https://media.istockphoto.com/id/1179610553/photo/black-stethoscope-on-blue-background.jpg?s=612x612&w=0&k=20&c=GPljrNsqqI_RNAUEf2oMMf9RwVWRCvLECo0wjGYySDw=",
  "https://cdn.pixabay.com/photo/2017/08/10/03/30/stethoscope-2617701_640.jpg",
  "https://img.freepik.com/premium-photo/womans-hand-holding-round-pills-treatment-medicine-tablets-concept-keep-heat-treat-illness_559416-1.jpg",
  "https://c1.wallpaperflare.com/preview/937/818/491/stethoscope-doctor-md-medical-health-hospital.jpg",
  "https://e0.pxfuel.com/wallpapers/851/748/desktop-wallpaper-grafimedia-digital-health-saas-experts-2-medical-equipment-thumbnail.jpg"
];

List<CotegoryMinCategory> data =
    List<CotegoryMinCategory>.empty(growable: true);
int _cartBadgeAmount = 0;
late bool _showCartBadge;

@override
class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    asyncDataFetch();
  }

  void asyncDataFetch() async {
    try {
      var response = await Dio()
          .get('https://www.proftcode.in/work/savdeshimart/api/mainCategory');
      print(response);
      data = CategoryMin.fromJson(response.data).data;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;
    return Scaffold(
      /////////////AppBar /////////////////////
      appBar: appbar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            ///////////////////////_searchField////////////////////
            _searchField(),

            const SizedBox(height: 12),

            const SizedBox(height: 12),
/////////////////////////Category////////////////////////////////
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var string = data[index].title;
                  if (string.length > 10) {
                    string = string.substring(0, 9) + '..'; // 'art'
                  }
                  return InkWell(
                    onTap: () {},
                    // onTap: () async {
                    //   try {
                    //     var response = await Dio().get(
                    //         'https://proftcode.in/work/savdeshimart/api/homeData');
                    //     print(response);
                    //     data = ProductModel.fromJson(response.data)
                    //         .data
                    //         .cast<CotegoryMinCategory>();
                    //     setState(() {});
                    //   } catch (e) {
                    //     print(e);
                    //   }
                    // },
                    child: Stack(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 37,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  "https://proftcode.in/work/savdeshimart/public/upload/category/" +
                                      data[index].image,
                                ),
                              ),
                              Text(
                                string,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),
            //////////////////////////// CarouselSlider///////////////////////////////
            CarouselSlider(
                items: imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(fit: StackFit.expand, children: [
                            Image.network(
                              e,
                              fit: BoxFit.cover,
                            ),
                          ]),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 160,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.0,
                  scrollDirection: Axis.horizontal,
                )),
            const SizedBox(height: 12),

            /////////////////////Cash on delivery//////////////////////
            Container(
              color: const Color.fromARGB(255, 241, 240, 240),
              height: 60,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://media.istockphoto.com/id/537487845/vector/payment-by-cash.jpg?s=612x612&w=0&k=20&c=ikEp0CWBCwizA4xdzFGUw1QO0FBGfjE1_iq-aOco8Dg='),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cash on \nDelivery',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ]),
                  VerticalDivider(
                    width: 2.0,
                    color: Colors.white,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(
                              'https://s2-g1.glbimg.com/PzCV5ViukNDpBCGNU8TF41Yqm8Q=/0x0:755x471/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/L/W/RgiVC8QjegeklIu6BOqA/delivery.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Free Delivery,\nFree Returns',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ]),
                  VerticalDivider(
                    width: 2.0,
                    color: Colors.white,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(
                              'https://st3.depositphotos.com/2495409/12536/i/600/depositphotos_125363450-stock-photo-low-price-shopping-tag-3d.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Lowest\nPrice',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ]),
                ],
              ),
            ),
            ///////////////// New Arrival///////////////////////

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "New Arrival",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0Xff37a497),
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0Xff37a497),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 3),
                              Icon(
                                LineAwesomeIcons.chevron_circle_right,
                                color: Color(0xFF37a494),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 8),
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var string = data[index].title;
                    if (string.length > 20) {
                      string = string.substring(0, 20) + '..'; // 'art'
                    }
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 135,
                              width: 135,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://proftcode.in/work/savdeshimart/public/upload/category/" +
                                          data[index].image,
                                    ),
                                    fit: BoxFit.fill,
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              string,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "₹ 48",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const Divider(),
            //////////////////////  Featured Product////////////////////////

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Product",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0Xff37a497),
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0Xff37a497),
                                ),
                              ),
                              SizedBox(width: 3),
                              Icon(
                                LineAwesomeIcons.chevron_circle_right,
                                color: Color(0xFF37a494),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 8),
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var string = data[index].title;
                    if (string.length > 20) {
                      string = string.substring(0, 20) + '..'; // 'art'
                    }
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 135,
                              width: 135,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://proftcode.in/work/savdeshimart/public/upload/category/" +
                                          data[index].image,
                                    ),
                                    fit: BoxFit.fill,
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              string,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "₹ 48",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const Divider(),

            /////////////////////////// Special Products ////////////////////////////////////

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Special Products",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0Xff37a497),
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0Xff37a497),
                                ),
                              ),
                              SizedBox(width: 3),
                              Icon(
                                LineAwesomeIcons.chevron_circle_right,
                                color: Color(0xFF37a494),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var string = data[index].title;
                    if (string.length > 20) {
                      string = string.substring(0, 20) + '..'; // 'art'
                    }
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 135,
                              width: 135,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://proftcode.in/work/savdeshimart/public/upload/category/" +
                                          data[index].image,
                                    ),
                                    fit: BoxFit.fill,
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              string,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "₹ 48",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const Divider(),

///////////////////  Products For You ///////////////////////////////////

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products For You",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0Xff37a497),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Container(
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://proftcode.in/work/savdeshimart/public/upload/category/" +
                                    data[index].image,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              data[index].title,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "₹ 52",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 255,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
            ),
          ]),
        ),
      ),
    );
  }

///////_SearchField  Code //////////////////////////
  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1517).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            hintText: "Search Pancake",
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 15),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }

/////////AppBar Code/////////////////////////
  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF37a497)),
          ),
          SizedBox(height: 5),
          Text(
            "Rahul jaipur",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 0),
        child: InkWell(
          onTap: () => Get.to(() => const ProfileScreen()),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: const DecorationImage(
                  image: AssetImage(ImageAssets.profile), fit: BoxFit.fill),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -0, end: 5),
            badgeContent: const Text(
              '7',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Color(0xFF37a494)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -4, end: 4),
              badgeContent: Text(
                _cartBadgeAmount.toString(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart, color: Color(0xFF37a494)),
              )),
        ),
      ],
    );
  }

  Widget box(
    String imageList,
  ) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          image: NetworkImage(imageList.toString()),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
