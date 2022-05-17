import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/View/Homepage/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Get'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(
                state![index].title!.capitalizeFirst!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(state[index].body!.capitalizeFirst!),
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const Divider(
              color: Colors.grey,
            );
          },
          itemCount: state!.length,
          physics: const BouncingScrollPhysics(),
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text(error.toString())),
        onEmpty: const Center(child: Text("No Data")),
      ),
    );
  }
}
