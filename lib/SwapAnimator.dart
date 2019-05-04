import 'package:flutter/widgets.dart';

typedef SwapAnimatorBuilder = Widget Function(BuildContext context, Animation<double> animation, VoidCallback startAnimation);

class SwapAnimator extends StatefulWidget {
  final VoidCallback onSwap;
  final SwapAnimatorBuilder builder;

  const SwapAnimator({Key key, @required this.onSwap, @required this.builder}) : super(key: key);

  @override
  _SwapAnimatorState createState() => _SwapAnimatorState();
}

class _SwapAnimatorState extends State<SwapAnimator> with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      duration: new Duration(milliseconds: 700),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 1.0, end: 0.0).animate(new CurvedAnimation(
        parent: animationController, curve: Curves.elasticIn
    ));
    return widget.builder(context, animation, _startAnimation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _startAnimation() {
    animationController.forward().then((a) {
      widget.onSwap();
      animationController.reverse();
    });
  }
}
