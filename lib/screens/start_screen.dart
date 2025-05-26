import 'package:camera/camera.dart';
import 'package:cepidl_app/constants.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late List<CameraDescription> cameras;
  CameraController? controller;
  bool isCameraReady = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        controller = CameraController(
          cameras[1],
          ResolutionPreset.high,
          enableAudio: false,
        );
        await controller!.initialize();
        setState(() {
          isCameraReady = true;
        });
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'EXERCISE START',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: kPrimaryColor ?? kPrimaryColor,
        iconTheme: theme.appBarTheme.iconTheme,
      ),
      body: Container(
        color: theme.colorScheme.background,
        child: Center(
          child: isCameraReady && controller != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CameraPreview(controller!),
                )
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  ),
                ),
        ),
      ),
    );
  }
}
