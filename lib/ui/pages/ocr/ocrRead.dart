// import 'package:camera/camera.dart';
// import 'package:cred/core/AppConstants.dart';
// import 'package:cred/core/Extensions.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class OCRPage extends StatefulWidget{
//   @override
//   _OCRPageState createState() => _OCRPageState();
// }
//
// class _OCRPageState extends State<OCRPage> {
//
//   List<CameraDescription> cameras; //list out the camera available
//   CameraController controller; //controller for camera
//   XFile image; //for captured image
//
//   void convertData (String filename, String url) async {
//   var request = http.MultipartRequest('POST', Uri.parse(url));
//   request.files.add(
//   http.MultipartFile(
//   'picture',
//   File(filename).readAsBytes().asStream(),
//   File(filename).lengthSync(),
//   filename: filename.split("/").last
//   ),
//   );
//   var res = await request.send();
// }
//
//   @override
//   void initState() {
//     loadCamera();
//     super.initState();
//   }
//
//   loadCamera() async {
//     cameras = await availableCameras();
//     if(cameras != null){
//       controller = CameraController(cameras[0], ResolutionPreset.max);
//       //cameras[0] = first camera, change to 1 to another camera
//
//       controller.initialize().then((_) {
//         if (!mounted) {
//           return;
//         }
//         setState(() {});
//       });
//     }else{
//       print("NO any camera found");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text("Scan Coupons"),
//         backgroundColor:HexColor.fromHex(DarkBackground),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//       ),
//       body: Container(
//           child: ListView(
//               children:[
//                 Container(
//                     height:400,
//                     width:400,
//                     child: controller == null?
//                     Center(child:Text("Loading Camera...")):
//                     !controller.value.isInitialized?
//                     Center(
//                       child: CircularProgressIndicator(),
//                     ):
//                     CameraPreview(controller)
//                 ),
//
//                 ElevatedButton.icon( //image capture button
//                   onPressed: () async{
//                     try {
//                       if(controller != null){ //check if controller is not null
//                         if(controller.value.isInitialized){ //check if controller is initialized
//                           image = await controller.takePicture(); //capture image
//                           setState(() {
//                             print(image);
//                           });
//                         }
//                       }
//                     } catch (e) {
//                       print(e); //show error
//                     }
//                   },
//                   icon: Icon(Icons.camera),
//                   label: Text("Capture"),
//                 ),
//
//                 Expanded(
//                   child: Container( //show captured image
//                     padding: EdgeInsets.all(30),
//                     child: image == null?
//                     Text("No Image captured",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,):
//                     Image.file(File(image.path), height: 300,),
//                     color: HexColor.fromHex(DarkBackground),
//                     //display captured image
//                   ),
//                 )
//               ]
//           )
//       ),
//
//     );
//   }
// }
