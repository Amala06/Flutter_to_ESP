import 'package:get/get.dart';
import 'package:my_app/server.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';


class ServerController extends GetxController
{
    Server? server;
    List<String>serverLogs=[];
    TextEditingController messageController=TextEditingController();

  startServer() async {
    // server = Server(onData: onData, onError: onError);
    if(server!.running){
await server!.stop();
serverLogs.clear();
    }
    else{
    await server!.start();
    // await server.start();

// Inside the onData callback
void handleData(Uint8List data) {
  String receivedMessage = String.fromCharCodes(data);
  // Process the received message
  print('Received message: $receivedMessage');
  serverLogs.add(receivedMessage);
update();
}

// Set the onData callback

server?.onData = handleData;

  }
  update();}
    @override
     void onInit(){
        server=Server(onData: onData, onError: onError);
        startServer();
        super.onInit();
    }
    void onData(Uint8List data){
       final recievedData= String.fromCharCodes(data);
       serverLogs.add(recievedData);
    //    debugPrint('$recievedData');
       update();
    }
    void onError(dynamic error){
debugPrint("Eroor:$error");
    }
    void handleMessage(){
      server!.send(messageController.text);
      serverLogs.add(messageController.text);
    messageController.clear();
      update();
    }
}


