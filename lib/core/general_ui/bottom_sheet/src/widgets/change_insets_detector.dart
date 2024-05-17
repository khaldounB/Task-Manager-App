// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../observer/src/bottom_inset_observer.dart';

class ChangeInsetsDetector extends StatefulWidget {
  final Widget child;
  final BottomInsetChangeListener? handler;

  const ChangeInsetsDetector({
    required this.child,
    super.key,
    this.handler,
  });

  @override
  State<ChangeInsetsDetector> createState() => _ChangeInsetsDetectorState();
}

class _ChangeInsetsDetectorState extends State<ChangeInsetsDetector> {
  final BottomInsetObserver _insetObserver = BottomInsetObserver();

  @override
  void initState() {
    super.initState();
    _insetObserver.addListener(_insetChangeHandler);
  }

  void _insetChangeHandler(BottomInsetChanges change) {
    widget.handler?.call(change);
  }

  @override
  void dispose() {
    _insetObserver.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
