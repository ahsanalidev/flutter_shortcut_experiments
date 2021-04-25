import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestIntent extends Intent {
  TestIntent();
}

class GlobalShortcut extends StatelessWidget {
  GlobalShortcut({
    Key key,
    this.child,
    this.focusNode,
  }) : super(key: key);
  final Widget child;
  final _shortcuts = {
    LogicalKeySet(LogicalKeyboardKey.arrowDown): TestIntent(),
  };

  final FocusNode focusNode;
  final _actions = {
    TestIntent: CallbackAction(onInvoke: (_) => print('f1 pressed'))
  };

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      focusNode: focusNode,
      autofocus: true,
      shortcuts: _shortcuts,
      actions: _actions,
      child: child,
    );
  }
}
