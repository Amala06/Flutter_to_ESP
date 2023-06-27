import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



// typedef Uint8ListCallback = Function(Uint8List data);
// typedef DynamicCallback = Function(dynamic data);

// class Server {
//   Uint8ListCallback? onData;
//   DynamicCallback? onError;

//   Server(this.onData, this.onError);

//   ServerSocket? server;
//   bool running = false;
//   List<Socket> sockets = [];

//   Future<void> start() async {
//     runZoned(
//       () async {
//         server = await ServerSocket.bind("192.168.0.105", 4000);
//         running = true;
//         server!.listen(onRequest);
//         final message = "Server is listening to port 4000";
//         onData!(Uint8List.fromList(message.codeUnits));
//       },
//       onError: onError,
//     );
//   }

//   void onRequest(Socket socket) {
//     if (!sockets.contains(socket)) {
//       sockets.add(socket);
//     }
//     socket.listen(
//       (event) {
//         onData!(event);
//       },
//     );
//   }
// }

// //import 'package:flutter/material.dart';
// import 'package:web_socket_channel/html.dart';

// typedef Uint8ListCallback = Function(Uint8List data);
// typedef DynamicCallback = Function(dynamic data);

// class Server {
//   Uint8ListCallback? onData;
//   DynamicCallback? onError;

//   HtmlWebSocketChannel? channel;
//   bool running = false;

//   void start() {
//     channel = HtmlWebSocketChannel.connect('ws://192.168.0.105:4000');
//     running = true;

//     channel!.stream.listen((dynamic message) {
//       if (message is String) {
//         final data = Uint8List.fromList(message.codeUnits);
//         onData!(data);
//       }
//     }, onError: (error) {
//       onError!(error);
//     });
//   }

//   void send(Uint8List data) {
//     if (channel != null && channel!.sink != null) {
//       final message = String.fromCharCodes(data);
//       channel!.sink.add(message);
//     }
//   }

//   void stop() {
//     channel?.sink.close();
//     channel = null;
//     running = false;
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/html.dart';

// typedef Uint8ListCallback = Function(Uint8List data);
// typedef DynamicCallback = Function(dynamic data);

// class Server {
//   Uint8ListCallback? onData;
//   DynamicCallback? onError;

//   HtmlWebSocketChannel? channel;
//   bool running = false;

//   void start() {
//     channel = HtmlWebSocketChannel.connect('ws://192.168.0.105:4000');
//     running = true;

//     channel!.stream.listen((dynamic message) {
//       if (message is String) {
//         final data = Uint8List.fromList(message.codeUnits);
//         onData!(data);
//       }
//     }, onError: (error) {
//       onError!(error);
//     });
//   }

//   void send(Uint8List data) {
//     if (channel != null && channel!.sink != null) {
//       final message = String.fromCharCodes(data);
//       channel!.sink.add(message);
//     }
//   }

//   void stop() {
//     channel?.sink.close();
//     channel = null;
//     running = false;
//   }
// }




import 'package:web_socket_channel/html.dart';
import 'dart:typed_data';

typedef Uint8ListCallback = Function(Uint8List data);
typedef DynamicCallback = Function(dynamic data);

class Server {
  Uint8ListCallback? onData;
  DynamicCallback? onError;

  HtmlWebSocketChannel? channel;
  bool running = false;

  Server({this.onData, this.onError});

  Future<void> start()async {
    channel = await HtmlWebSocketChannel.connect('ws://192.168.0.1:81');
    running = true;

    channel!.stream.listen(
      (dynamic message) {
        print(message);
        if (message is String) {
          final data = Uint8List.fromList(message.codeUnits);
          onData!(data);
        }
      },
      onError: (error) {
        onError!(error);
      },
    );
  }
  

//   void send(String data) {
//     if (channel != null && channel!.sink != null) {
//       final message = Uint8List.fromCharCodes(data);
//       channel!.sink.add(message);
//     }
//   }

  void send(String data) {
  if (channel != null && channel!.sink != null) {
    final message = data; // Convert string to UTF-8 encoded bytes
    channel!.sink.add(message);
  }
}
    //   void broadcast(String data){
    //     onData!(Uint8List.fromList("Broadcast message as : ${data}",codeUnits));
    //     for(final socket in sockets){
    //         socket.write(data);
    //     }
    //   }
  Future <void> stop() async{
    await channel?.sink.close();
    channel = null;
    running = false;
  }

}
