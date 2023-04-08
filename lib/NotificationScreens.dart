import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
class NotificationScreens extends StatefulWidget {
  const NotificationScreens({Key? key}) : super(key: key);

  @override
  State<NotificationScreens> createState() => _NotificationScreensState();
}

class _NotificationScreensState extends State<NotificationScreens> {
  var optoken = "";
  mobiletoken() async{
    await FirebaseMessaging.instance.getToken().then((token){
      setState(() {
        optoken=token.toString();
    });

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobiletoken();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Column(
        children: [
          Text(optoken),
        ],
      ),
    );
  }
}
