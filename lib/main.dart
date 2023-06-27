// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:my_app/controller.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home:  MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   // final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // int _counter = 0;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Server"),
//       ),
//       body:GetBuilder<ServerController>(
//         init:ServerController(),
//         builder:(controller){
//           return Container();
//         },
//       ),
//     );
//   }
// }
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controller.dart';

import 'package:my_app/server.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
   
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ServerController serverController = Get.put(ServerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server"),
      ),
      body: GetBuilder<ServerController>(
        init:ServerController(),
        builder: (controller) {
  return Column(
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children:[
              Row(
            children: [
              Text(
                "Server",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: controller.server!.running ? Colors.green[400] : Colors.red[400],
                ),
                padding: EdgeInsets.all(5),
                child: Text(controller.server!.running ? "ON" : "OFF" ),
              ),
            ],
          ),
          TextButton(
            onPressed:() async {
              debugPrint("hellp");
            await controller.startServer();
          },
          child:Text(controller.server!.running?"Stop Server":"Start Server")),

          Container(
            height:80,
            color:Colors.blue[200],
            padding:EdgeInsets.all(8),
            child:Row(
              children:[
                Expanded(
                  child:TextField(
                    controller:controller.messageController,
                    decoration:InputDecoration(labelText:"Enter Message"),
                  )
                ),
                SizedBox(
                  width:10,
                ),
                IconButton(
                  onPressed:(){
                    controller.messageController.clear();
                  },
                  icon:Icon(Icons.clear)
                ),
                IconButton(
                  onPressed:controller.handleMessage,icon:Icon(Icons.send)
                ),
              ]
            )
          ),
          Expanded(
            child:ListView(
              children:controller.serverLogs.map((e)=>Text("$e")).toList(),
            )
          )
            ]
          )
        ),
      ),
    ],
  );
},

        // builder: (controller) {
        //   return Column(
        //     children:[
        //       Expanded(child:Padding(
        //         padding :EdgeInsetsDirectional.all(15),
        //         child:Row(
        //           children:[
        //             Text("Server",style:TextStyle(
        //           fontSize:18,
        //           fontWeight:FontWeight.bold
        //         ),
        //         Container(
        //           decoration:BoxDecoration(
        //             color:controller.server!.running?Colors.green[400]:Colors.res[400]),
        //             padding:EdgeInsets.all(5),
        //             child:Text(controller.server!.running,"ON":"OFF"),
        //           )
        //         )]
        //         )
                  
        //         )

        //       ))
        //     ]
          
        // },
      ),
    );
  }
}