import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatefulWidget
{
  final Widget child;
  final Future<void> Function() onLoading;
  final Widget? loadingWidget;

  const CustomLoaderWidget({
    super.key,
    required this.child,
    required this.onLoading,
    this.loadingWidget,
  });

  @override
  State createState() {
    return _CustomLoaderWidgetState();
  }
}

class _CustomLoaderWidgetState extends State<CustomLoaderWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: isLoading == false,
          child: widget.child,
        ),
        if (isLoading)
          widget.loadingWidget ?? const Center(child: CircularProgressIndicator()),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant CustomLoaderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onLoading != oldWidget.onLoading) {
      startLoading();
    }
  }

  void startLoading() async {
    setState(() {
      isLoading = true;
    });
    await widget.onLoading();
    setState(() {
      isLoading = false;
    });
  }
}
