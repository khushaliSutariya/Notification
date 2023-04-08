import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
class InternetconectionScreens extends StatefulWidget {
  const InternetconectionScreens({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<InternetconectionScreens> createState() => _InternetconectionScreensState();
}

class _InternetconectionScreensState extends State<InternetconectionScreens> {
  String status = "Waiting...";
  Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checkConnectivity();
    checkRealtimeConnection();
  }
  void checkConnectivity() async {
    var connectionResult = await _connectivity.checkConnectivity();

    if (connectionResult == ConnectivityResult.mobile) {
      status = "MobileData";
    } else if (connectionResult == ConnectivityResult.wifi) {
      status = "Wifi";
    } else {
      status = "Not Connected";
    }
    setState(() {});
  }

  void checkRealtimeConnection() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        status = "MobileData";
      } else if (event == ConnectivityResult.wifi) {
        status = "Wifi";
      } else {
        status = "Not Connected";
      }
      setState(() {});
    });
  }
  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Center(
        child: Text(
          status,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkConnectivity();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
