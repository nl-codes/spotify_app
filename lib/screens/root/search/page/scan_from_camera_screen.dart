import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ScanFromCameraScreen extends StatefulWidget {
  const ScanFromCameraScreen({super.key});

  @override
  State<ScanFromCameraScreen> createState() => _ScanFromCameraScreenState();
}

class _ScanFromCameraScreenState extends State<ScanFromCameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras![0], // Use the first camera (usually back camera)
          ResolutionPreset.medium,
        );

        await _cameraController!.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: _isCameraInitialized && _cameraController != null
                      ? CameraPreview(_cameraController!)
                      : Container(
                          color: Colors.black,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/images/frequency.png'),
              SizedBox(height: 20),
              Text(
                "Point your camera at a\nSpotify Code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 32),
              Text("Select from photos", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
