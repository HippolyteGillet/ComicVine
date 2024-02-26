import 'package:flutter/material.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({super.key});

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Comics Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF15232E),
    );
  }
}
