import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearningContent extends StatefulWidget {
  const LearningContent({
    Key? key,
    required this.children,
    required this.currentSegment,
  }) : super(key: key);

  final Map<int, Widget> children;
  final int currentSegment;
  @override
  _LearningContentState createState() => _LearningContentState();
}

class _LearningContentState extends State<LearningContent> {
  @override
  Widget build(BuildContext context) {
    return widget.children[widget.currentSegment]!;
  }
}
