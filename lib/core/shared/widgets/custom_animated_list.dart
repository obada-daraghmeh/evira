import 'package:flutter/material.dart';

class CustomAnimatedList<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final Duration animationDelay;

  const CustomAnimatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.animationDelay = const Duration(milliseconds: 300),
  });

  @override
  State<CustomAnimatedList<T>> createState() => _CustomAnimatedListState<T>();
}

class _CustomAnimatedListState<T> extends State<CustomAnimatedList<T>> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<T> _animatedItems = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateListIn);
  }

  Future<void> get _animateListIn async {
    for (int i = 0; i < widget.items.length; i++) {
      await Future.delayed(widget.animationDelay);
      _animatedItems.insert(i, widget.items[i]);
      _listKey.currentState?.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _animatedItems.length,
      itemBuilder: (context, index, animation) {
        return _buildListAnimation(
          context,
          index,
          animation,
          child: widget.itemBuilder(context, index, _animatedItems[index]),
        );
      },
    );
  }

  FadeTransition _buildListAnimation(
    BuildContext context,
    int index,
    Animation<double> animation, {
    required Widget child,
  }) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation.drive(
          Tween<double>(
            begin: 0.9,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeOutBack)),
        ),
        child: child,
      ),
    );
  }
}
