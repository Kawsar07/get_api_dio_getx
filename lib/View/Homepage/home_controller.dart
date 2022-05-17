import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_dio/Service/remote_service.dart';

import '../../Model/postModel.dart';

class HomeController extends GetxController with StateMixin<List<PostModel>> {

  final Dio _dio = Dio();
  final RemoteService _remoteService = RemoteService (Dio());

  List<PostModel> dataList = <PostModel>[];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    await _remoteService.getAllPost().then(
      (value) {
        dataList = value;
        change(dataList, status: RxStatus.success());
      },
      onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      },
    );
  }


}
