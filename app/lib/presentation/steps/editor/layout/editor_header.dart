import 'package:flutter/material.dart' hide Step;
import 'package:vision_director/domain/steps/step.dart';

class EditorHeader extends StatelessWidget {
  final Step? current;
  const EditorHeader({super.key, this.current});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: current == null
          ? Container()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Empty space so everything else is aligned correctly.
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: 24, // Size of an icon
                  ),
                ),
                Flexible(
                  child: Text(
                    "${current!.position + 1}. ${current!.name.getOrCrash()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    current!.isLocked ? Icons.lock : Icons.lock_open,
                  ),
                ),
              ],
            ),
    );
  }
}
