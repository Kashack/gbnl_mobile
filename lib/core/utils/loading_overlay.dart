import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget? child;
  final bool show;

  const LoadingOverlay({super.key, this.child, this.show = false});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(children: <Widget>[
      child!,
      IgnorePointer(
        ignoring: !show,
        child: Opacity(
            opacity: show ? 1.0 : 0.0,
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              alignment: Alignment.center,
              color: const Color.fromARGB(100, 0, 0, 0),
              child: Center(
                child: CircularProgressIndicator()
              ),
            )),
      ),
    ]);
  }
}
