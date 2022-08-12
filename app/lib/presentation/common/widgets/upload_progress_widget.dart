import 'package:flutter/material.dart';

/// Displays a [CircularProgressIndicator] indicating the current upload [progress].
///
/// By default displays "Uploading". To change it to "Downloading" set [isUploading] to false.
class UploadProgress extends StatelessWidget {
  final bool isUploading;
  final double progress;
  const UploadProgress({
    super.key,
    required this.progress,
    this.isUploading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isUploading ? "Uploading" : "Downloading",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 200.0,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        strokeWidth: 15,
                        value: progress / 100,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "${progress.toStringAsFixed(0)}%",
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Please wait",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
