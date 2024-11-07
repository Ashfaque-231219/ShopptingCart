import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatefulWidget {
  final double? height;
  final ValueChanged<void>? onComplete;
  final String? onCompleteText;
  final Color? color;

  const LoadingWidget(
      {Key? key, this.height, this.onComplete, this.onCompleteText, this.color})
      : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    CurvedAnimation curve =
    CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween<double>(begin: widget.height ?? 50, end: 0).animate(curve)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        animationController.forward();
      }
      widget.onComplete;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return animationController.isCompleted
        ? const SizedBox(
      height: 300,
      width: 500,
      child: Center(
        child: Column(
          children: [
            Center(
                child: Icon(Icons.error_outline_sharp,
                    size: 40, color: Color.fromRGBO(59, 89, 152, 1))),
          ],
        ),
      ),
    )
        : Opacity(
      opacity: animation.value / 100 > 1.0 ? 1.0 : animation.value / 100,
      child: SizedBox(
        height: animation.value,
        child: Center(
          child: LoadingAnimationWidget.fourRotatingDots(
              color: const Color.fromRGBO(59, 89, 152, 1), size: 50),
        ),
      ),
    );
  }
}

class LoadingWidgetNoMsg extends StatefulWidget {
  final Color? color;
  const LoadingWidgetNoMsg({super.key, this.color});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingWidgetNoMsgState createState() => _LoadingWidgetNoMsgState();
}

class _LoadingWidgetNoMsgState extends State<LoadingWidgetNoMsg>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    CurvedAnimation curve =
    CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween<double>(begin: 50, end: 0).animate(curve)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return animationController.isCompleted
        ? const SizedBox()
        : Opacity(
      opacity: animation.value / 100 > 1.0 ? 1.0 : animation.value / 100,
      child: SizedBox(
        height: animation.value,
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
              color: widget.color ?? Colors.green, size: 50),
        ),
      ),
    );
  }
}