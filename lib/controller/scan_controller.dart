import 'dart:developer';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:permission_handler/permission_handler.dart';


class ScanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTFlite();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  late CameraController cameraController;

  late List<CameraDescription> cameras;

  var isCameraInitialized = false.obs;
  var cameraCount = 0;

  var x,
      y,
      z,
      h = 0.0;
  var label = "";

  initCamera() async {
    if (await Permission.camera
        .request()
        .isGranted) {
      cameras = await availableCameras();
      cameraController = await CameraController(
        cameras[0],
        ResolutionPreset.max,
       imageFormatGroup: ImageFormatGroup.yuv420,
      );
      await cameraController.initialize().then((value) {
        cameraController.startImageStream((image) {
          cameraCount++;
          if (cameraCount % 10 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
          update();
        });
      });
      isCameraInitialized(true);
      update();
    } else {
      print("permission denied");
    }
  }

  initTFlite() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
  }

  objectDetector(CameraImage image) async {
    var detector = await Tflite.runModelOnFrame(
      bytesList: image.planes.map((e) {
        return e.bytes;
      }).toList(),
      asynch: true,
      imageHeight: image.height,
      imageWidth: image.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResults: 1,
      rotation: 90,
      threshold: 0.4,
    );

    if (detector != null && detector.isNotEmpty) {
      var ourDetectedObject = detector.first;
      if (ourDetectedObject['confidenceInClass'] * 100 > 45) { // Corrected typo
        label = detector.first['detectedClass'].toString();
        h = ourDetectedObject['rect']['h'];
        z = ourDetectedObject['rect']['z'];
        x = ourDetectedObject['rect']['x'];
        y = ourDetectedObject['rect']['y'];
      }
    }
    else {
      // Aucun objet détecté, réinitialisez les valeurs à utiliser dans votre application
      label = "";
      h = 0.0;
      z = 0.0;
      x = 0.0;
      y = 0.0;
    }

    update();
  }
}