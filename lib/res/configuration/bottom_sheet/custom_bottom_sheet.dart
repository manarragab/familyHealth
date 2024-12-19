import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final double height;
  final VoidCallback? onClosing;
  final Widget? child;

  MyBottomSheet({
    Key? key,
    this.height = 400,
    this.onClosing,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.1,
      maxChildSize: 1,
      initialChildSize: 0.25,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: child,
          ),
        );
      },
     /* onDraggableCanceled: (velocity, offset) {
        if (offset.pixels >= height * 0.25) {
          Navigator.pop(context);
        }
        onClosing?.call();
      },*/
    );
  }
}
