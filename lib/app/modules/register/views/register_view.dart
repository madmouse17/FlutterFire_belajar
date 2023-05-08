import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:plant_ui/app/routes/app_pages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:upgrader/upgrader.dart';
import 'package:in_app_update/in_app_update.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          width: Get.mediaQuery.size.width / 2,
          height: Get.mediaQuery.size.height / 2,
          child: CustomPaint(
            painter: Sky(),
            child: Container(),
          ),
        ),
      ),
    );

    // Scaffold(
    //   body: UpgradeAlert(
    //     upgrader: Upgrader(
    //         appcastConfig: controller.cfg,
    //         showIgnore: false,
    //         showLater: false,
    //         debugDisplayAlways: true),
    //     child: SlidingUpPanel(
    //       renderPanelSheet: false,
    //       panel: _floatingPanel(),
    //       collapsed: _floatingCollapsed(),
    //       body: Center(
    //         child: Text("This is the Widget behind the sliding panel"),
    //       ),
    //     ),
    //   ),
    // );
    // return Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.all(20),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           TextFormField(
    //             controller: controller.nameC,
    //             decoration: InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 hintText: 'masukkan username',
    //                 labelText: "Username"),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 10),
    //             child: TextFormField(
    //               controller: controller.emailC,
    //               decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   hintText: 'masukkan email',
    //                   labelText: "Email"),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 10),
    //             child: TextFormField(
    //               controller: controller.passC,
    //               decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   hintText: 'masukkan password',
    //                   labelText: "password"),
    //               obscureText: true,
    //             ),
    //           ),
    //           ElevatedButton(
    //             onPressed: () => controller.postRegister(),
    //             child: Text('Register'),
    //           ),
    //           GestureDetector(
    //             onTap: () => Get.toNamed(Routes.HOME),
    //             child: Center(
    //               child: Text.rich(
    //                 TextSpan(
    //                   children: [
    //                     TextSpan(text: "Sudah Punya Akun? "),
    //                     TextSpan(
    //                       text: "Login",
    //                       style: TextStyle(
    //                           color: Colors.blue,
    //                           decoration: TextDecoration.underline),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),

    // );
  }
}

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.moveTo(size.width * 0.01, size.height / 4.8);
    path.lineTo(size.width * 0.05, size.height / 4);
    path.lineTo(size.width - size.width * 0.05, size.height / 4);

    path.lineTo(size.width - size.width * 0.01, size.height / 4.8);
    canvas.drawPath(path, paint);

    var paint2 = Paint()
      ..color = Colors.red.withOpacity(0.5)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path2 = Path();
    path2.moveTo(size.width * 0.01, size.height / 4.8);
    path2.lineTo(size.width * 0.05, size.height / 4);
    path2.lineTo(size.width - size.width * 0.05, size.height / 4);

    path2.lineTo(size.width - size.width * 0.01, size.height / 4.8);
    canvas.drawPath(path2, paint2);

    TextSpan span =
        const TextSpan(style: TextStyle(color: Colors.red), text: 'Text Paint');
    TextPainter tp = TextPainter(text: span, textAlign: TextAlign.left);
    tp.textDirection = TextDirection.rtl;
    tp.layout();
    tp.paint(canvas, Offset(size.width / 2.5, size.height / 5));

    // var paint2 = Paint()
    //   ..color = Colors.teal
    //   ..strokeWidth = 10
    //   ..strokeCap = StrokeCap.round;

    // Offset startingPoint = Offset(0, size.height / 4);
    // Offset endingPoint = Offset(size.width, size.height / 4);

    // canvas.drawLine(startingPoint, endingPoint, paint2);

// //todo: rectangle
//     var paintRect = Paint()
//       ..color = Colors.red
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     var rect = Rect.fromCenter(
//         center: Offset(0, 3), width: size.width / 2, height: size.height / 2);
//     canvas.drawRect(rect, paintRect);
  }

  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}

Widget _floatingCollapsed() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
    ),
    margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    child: Center(
      child: Text(
        "This is the collapsed Widget",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget _floatingPanel() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.grey,
          ),
        ]),
    margin: const EdgeInsets.all(24.0),
    child: Center(
      child: Text("This is the SlidingUpPanel when open"),
    ),
  );
}
