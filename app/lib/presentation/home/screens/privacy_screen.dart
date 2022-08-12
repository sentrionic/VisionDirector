import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/widgets/form_flow_wrapper.dart';

class PrivacyScreen extends StatelessWidget {
  static const routeName = '/privacy';

  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),
      body: const FormFlowWrapper(
        children: [
          _SectionHeader(header: "1. Data"),
          SizedBox(
            height: 5,
          ),
          _SectionText(
            text:
                "Your data gets stored on an server hosted in the Software Engineering faculty of the LUH. Any data collected might be used for local research purposes. The data will be deleted after the end of this thesis. By using this app you consent to this.",
          ),
          SizedBox(
            height: 20,
          ),
          _SectionHeader(header: "2. Media"),
          SizedBox(
            height: 5,
          ),
          _SectionText(
            text:
                "All uploaded media is stored on the previously mentioned servers and will only be used for this Master thesis. The videos will be deleted after the end of this thesis.",
          ),
          SizedBox(
            height: 20,
          ),
          _SectionHeader(header: "3. Deletion"),
          SizedBox(
            height: 5,
          ),
          _SectionText(
            text:
                "At any point in time you have the right to request your data to be deleted. Simply use the 'Contact' option and send an Email requesting the deletion of your data.",
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String header;
  const _SectionHeader({required this.header});

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SectionText extends StatelessWidget {
  final String text;
  const _SectionText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white70,
      ),
    );
  }
}
