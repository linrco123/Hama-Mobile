import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/internet_conn_status/views/internet_connection.dart';

class InternetConnectionController extends GetxController{



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    streamInternetListener = Connectivity();
    streamInternetListener.onConnectivityChanged.listen((event) async {
      bool result = await checkconnectivity();
      if(result == false){
        Get.to(const InternetConnectionView());
      }else{
        Get.back();
      }

      
      
    },);
  }

 late Connectivity streamInternetListener ;


 void checkConnectivityToInternet(ConnectivityResult connectivityResult){

  //if(connectivityResult.)

 }
 Future<bool> checkconnectivity() async {
  if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}

}