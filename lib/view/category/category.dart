import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meelmedicose/view/product/product_detail.dart';
import 'model/categorymin.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

List<CotegoryMinCategory> data =
    List<CotegoryMinCategory>.empty(growable: true);

class _CategoryState extends State<Category> {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Category",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(() => const ProductDetail()),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://proftcode.in/work/savdeshimart/public/upload/category/" +
                                    data[index].image,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          data[index].title,
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
































// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../product/product_list_screen.dart';
// import 'model/categorymin.dart';

// class Category extends StatelessWidget {
//    Category({super.key});
//   List<CotegoryMinCategory> data =
//     List<CotegoryMinCategory>.empty(growable: true);
//   @override
//   void initState() {
//     super.initState();
//     asyncDataFetch();
//   }

//   void asyncDataFetch() async {
//     try {
//       var response = await Dio()
//           .get('https://www.proftcode.in/work/savdeshimart/api/mainCategory');
//       print(response);
//       data = CategoryMin.fromJson(response.data).data;
//       setState(() {});
//     } catch (e) {
//       print(e);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//           itemCount: data.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 6),
//           itemBuilder: (context, index) {
//             return InkWell(
//               onTap: () => Get.to(() => ProductListScreen()),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         // color: Colors.red,
//                         borderRadius: BorderRadius.circular(15),
//                         image: DecorationImage(
//                           image: NetworkImage(
//                                     "https://proftcode.in/work/savdeshimart/public/upload/category/" +
//                                         data[index].image,
//                                   ),
//                             fit: BoxFit.cover),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(data[index].title)
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }























// import 'package:flutter/material.dart';

// class Category extends StatefulWidget {
//   const Category({super.key});

//   @override
//   State<Category> createState() => _CategoryState();
// }

// class _CategoryState extends State<Category> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           color: Colors.red,
//           height: 100,
//           //child:
//           //TabBar(tabs: [
//           //   Tab(
//           //     text: 'meel',
//           //   )
//           // ]),
//         )
//         // TabBar(controller: tabController, tabs: const [
//         //   Tab(text: "New Arrival"),
//         //   Tab(text: "Featured Product"),
//         //   Tab(text: "Special Products"),
//         // ]),
//         // const SizedBox(height: 20),
//         // TabBarView(
//         //   controller: tabController,
//         //   children: const [
//         //     Text("data"),
//         //     Text("reerererer"),
//         //     Text("meel"),
//       ],
//     );
//   }
// }
