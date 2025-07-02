import 'package:flutter/material.dart';

class AnimatedCartCheckOut extends StatefulWidget {
  final Widget child;
  const AnimatedCartCheckOut({super.key, required this.child});

  @override
  State<AnimatedCartCheckOut> createState() => _AnimatedCartCheckOutState();
}

class _AnimatedCartCheckOutState extends State<AnimatedCartCheckOut> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() => _visible = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      offset: _visible ? Offset.zero : const Offset(0, 1),
      child: widget.child,
    );
  }
}
