import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:test_project/features/home/controller/home.dart';
import 'package:test_project/features/home/widgets/action_button.dart';
import 'package:test_project/features/home/widgets/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeCtr = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeCtr.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular products"),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          ActionButton(label: "Filter"),
          SizedBox(width: 8),
          ActionButton(label: "Sort By"),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (ctr) {
            if (ctr.error == true) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('An error occured whiles getting the products'),
                      OutlinedButton(
                        onPressed: () => ctr.getProducts(),
                        child: Text("Try Again"),
                      ),
                    ],
                  ),
                ),
              );
            } else if (ctr.loading == true) {
              return Center(child: CircularProgressIndicator());
            } else if (ctr.loading == false && ctr.error == false) {
              return _buildBody(ctr);
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text('Unable to get products'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _buildBody(HomeController ctr) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: ctr.products
            .map((product) => ProductCard(product: product))
            .toList(),
      ),
    ),
  );
}
