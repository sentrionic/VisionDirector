import 'package:flutter/material.dart';

class DownloadMediaProgress extends StatelessWidget {
  final int count;
  final int totalCount;
  final double progress;
  const DownloadMediaProgress({
    super.key,
    required this.count,
    required this.totalCount,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Downloading Media",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: LinearProgressIndicator(
              value: count / totalCount,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text("$count out of $totalCount files downloaded"),
          const SizedBox(
            height: 10,
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
    );
  }
}
