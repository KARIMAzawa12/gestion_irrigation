import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/scan_controller.dart';


class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value
              ? Stack(
            children: [
              CameraPreview(controller.cameraController),
              Positioned(
                top: (controller.y ?? 0) * 700.0,
                right: (controller.x ?? 0) * 500.0,
                child: Container(
                  width: (controller.z ?? 0) * 100.0 * (context.width ?? 0) / 100.0,
                  height: (controller.z ?? 0) * 100.0 * (context.height ?? 0) / 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green, width: 4.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text("${controller.label}"),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
              : Center(child: const Text("Loading preview..."));
        },
      ),
    );
  }
}