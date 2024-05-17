// Flutter imports:
import 'package:flutter/widgets.dart';

typedef BottomInsetChangeListener = Function(BottomInsetChanges change);

class BottomInsetObserver extends WidgetsBindingObserver {
  final _changeListeners = <BottomInsetChangeListener>[];
  double? _currentInset;

  BottomInsetObserver() {
    _init();
  }

  @override
  void didChangeMetrics() {
    _listener();
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _changeListeners.clear();
  }

  void addListener(
    BottomInsetChangeListener onChange,
  ) {
    _changeListeners.add(onChange);
    if (_currentInset! > 0) {
      onChange(BottomInsetChanges(
        currentInset: _currentInset!,
        delta: 0,
      ));
    }
  }

  void removeListener(BottomInsetChangeListener listener) {
    _changeListeners.remove(listener);
  }

  void _init() {
    WidgetsBinding.instance.addObserver(this);
    final window = WidgetsBinding.instance.window;
    _currentInset = window.viewInsets.bottom / window.devicePixelRatio;
  }

  /// Calculate changes in bottom insets
  void _listener() {
    final window = WidgetsBinding.instance.window;
    final newInset = window.viewInsets.bottom / window.devicePixelRatio;
    final delta = newInset - (_currentInset ?? newInset);
    if (delta == 0) return;
    _onChange(BottomInsetChanges(
      currentInset: newInset,
      delta: delta,
    ));
    _currentInset = newInset;
  }
  void _onChange(BottomInsetChanges change) {
    for (final listener in _changeListeners) {
      listener(change);
    }
  }
}

class BottomInsetChanges {
  final double delta;

  final double currentInset;

  const BottomInsetChanges({
    required this.delta,
    required this.currentInset,
  });
}
