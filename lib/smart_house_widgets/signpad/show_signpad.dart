// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
//
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
//
// //TODO: pass the key from Page and dispose the key on dispose();
// GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
//
// bool saveOn = false;
//
// showSignPadDialog(
//   BuildContext context, {
//   bool barrierDismissible = false,
//   Color? color = ThemeColors.transparent,
//   GlobalKey<SfSignaturePadState>? signaturePadKey,
// }) {
//   return showDialog(
//     context: context,
//     barrierDismissible: barrierDismissible,
//     routeSettings: RouteSettings(name: 'Body Dialog'),
//     builder: (context) {
//       return SimpleDialog(
//         backgroundColor: color,
//         contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
//         children: // Column(
//             [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   RotatedBox(
//                       quarterTurns: -1,
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 262.w,
//                         width: 560.h,
//                         color: ThemeColors.white,
//                         child: Text('정 자 서 명',
//                             style: TextStyle(
//                                 fontSize: 80,
//                                 color: ThemeColors.gray4.withOpacity(0.5))),
//                       )),
//                   SizedBox(
//                     width: 262.w,
//                     height: 560.h,
//                     child: SfSignaturePad(
//                       key: signaturePadKey ?? _signaturePadKey,
//                       minimumStrokeWidth: 4,
//                       maximumStrokeWidth: 6,
//                       strokeColor: Colors.black,
//                       backgroundColor: Colors.white60,
//                     ),
//                   ),
//                 ],
//               ),
//               SpacedColumn(
//                 verticalSpace: 19,
//                 children: [
//                   RotatedBox(
//                     quarterTurns: -1,
//                     child: MainButton(
//                       text: 'Save',
//                       onPressed: () async {
//                         ui.Image image = await _signaturePadKey.currentState!
//                             .toImage(
//                                 pixelRatio:
//                                     MediaQuery.of(context).devicePixelRatio);
//
//                         Directory fullPath =
//                             await getApplicationDocumentsDirectory();
//                         String savePath = fullPath.path + "/temp";
//
//                         var data = await image.toByteData(
//                             format: ui.ImageByteFormat.png);
//
//                         final encoded =
//                             base64.encode(data!.buffer.asUint8List());
//
//                         Uint8List bytes = base64.decode(encoded);
//
//                         File file = File(savePath);
//                         await file.writeAsBytes(bytes);
//                         file.copy(savePath);
//
//                         final result = await ImageGallerySaver.saveImage(bytes,
//                             quality: 100, name: 'temp');
//
//                         print(result);
//                       },
//                     ),
//                   ),
//                   RotatedBox(
//                     quarterTurns: -1,
//                     child: MainButton(
//                       text: 'Clear',
//                       onPressed: () async {
//                         _signaturePadKey.currentState!.clear();
//                       },
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//           // SizedBox(
//           //   height: 30,
//           // ),
//           // DenseButton(
//           //   text: 'Save',
//           //   onPressed: () async {
//           //     ui.Image image = await _signaturePadKey.currentState!
//           //         .toImage(pixelRatio: MediaQuery.of(context).devicePixelRatio);
//           //
//           //     Directory fullPath = await getApplicationDocumentsDirectory();
//           //     String savePath = fullPath.path + "/temp";
//           //
//           //     var data = await image.toByteData(format: ui.ImageByteFormat.png);
//           //
//           //     final encoded = base64.encode(data!.buffer.asUint8List());
//           //
//           //     Uint8List bytes = base64.decode(encoded);
//           //
//           //     File file = File(savePath);
//           //     await file.writeAsBytes(bytes);
//           //     file.copy(savePath);
//           //
//           //     final result = await ImageGallerySaver.saveImage(bytes,
//           //         quality: 100, name: 'temp');
//           //   },
//           // ),
//           // DenseButton(
//           //   text: 'Clear',
//           //   onPressed: () async {
//           //     _signaturePadKey.currentState!.clear();
//           //   },
//           // )
//         ],
//         titlePadding: EdgeInsets.zero,
//         insetPadding: EdgeInsets.zero,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         elevation: 0,
//       );
//     },
//   );
// }
