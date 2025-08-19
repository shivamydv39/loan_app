import 'package:flutter/material.dart';

Future<T?> showCustomBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  double heightFraction = 0.93, // kitni screen cover kare bottomsheet
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: heightFraction,
        minChildSize: 0.5,
        maxChildSize: 0.93,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: child,
            ),
          );
        },
      );
    },
  );
}
