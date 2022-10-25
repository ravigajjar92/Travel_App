import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final Widget? endWidget;

  final EdgeInsets? padding;

  const ToolBar({
    Key? key,
    this.leadingWidget,
    this.titleWidget,
    this.endWidget,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: Colors.transparent,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leadingWidget != null) leadingWidget!,
          if (titleWidget != null) titleWidget!,
          const Spacer(),
          if (endWidget != null) endWidget!,
        ],
      ),
    );
  }
}
