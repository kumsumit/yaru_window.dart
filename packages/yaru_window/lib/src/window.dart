import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:yaru_window_platform_interface/yaru_window_platform_interface.dart';

/// Provides access to the closest top-level window instance that encloses the
/// given context.
class YaruWindow {
  static final Map<Object, YaruWindowInstance> _windows = {};

  static YaruWindowInstance _instance([int id = 0]) {
    return _windows[id] ??= YaruWindowInstance._(id);
  }

  /// Returns the closest top-level window instance that encloses the given
  /// context.
  static YaruWindowInstance of(BuildContext context) {
    const id = 0; // View.of(context).windowId;
    // ignore: avoid_redundant_argument_values
    return _instance(id);
  }

  /// Closes the window.
  static Future<void> close(BuildContext context) {
    return YaruWindow.of(context).close();
  }

  /// Starts dragging the window.
  static Future<void> drag(BuildContext context) {
    return YaruWindow.of(context).drag();
  }

  /// Enters fullscreen mode.
  static Future<void> fullscreen(BuildContext context) {
    return YaruWindow.of(context).fullscreen();
  }

  /// Hides the window.
  static Future<void> hide(BuildContext context) {
    return YaruWindow.of(context).hide();
  }

  /// Hides the title bar.
  static Future<void> hideTitle(BuildContext context) {
    return YaruWindow.of(context).hideTitle();
  }

  /// Maximizes the window.
  static Future<void> maximize(BuildContext context) {
    return YaruWindow.of(context).maximize();
  }

  /// Minimizes the window.
  static Future<void> minimize(BuildContext context) {
    return YaruWindow.of(context).minimize();
  }

  /// Restores the window to its normal state.
  static Future<void> restore(BuildContext context) {
    return YaruWindow.of(context).restore();
  }

  /// Shows the window.
  static Future<void> show(BuildContext context) {
    return YaruWindow.of(context).show();
  }

  /// Shows the window menu.
  static Future<void> showMenu(BuildContext context) {
    return YaruWindow.of(context).showMenu();
  }

  /// Shows the title bar.
  static Future<void> showTitle(BuildContext context) {
    return YaruWindow.of(context).showTitle();
  }

  /// Sets the background color of the window.
  static Future<void> setBackground(BuildContext context, Color color) {
    return YaruWindow.of(context).setBackground(color);
  }

  /// Sets the brightness of the window.
  static Future<void> setBrightness(
    BuildContext context,
    Brightness brightness,
  ) {
    return YaruWindow.of(context).setBrightness(brightness);
  }

  /// Sets the title of the window.
  static Future<void> setTitle(BuildContext context, String title) {
    return YaruWindow.of(context).setTitle(title);
  }

  /// Sets whether the window can be minimized.
  static Future<void> setMinimizable(BuildContext context, bool minimizable) {
    return YaruWindow.of(context).setMinimizable(minimizable);
  }

  /// Sets whether the window can be maximized.
  static Future<void> setMaximizable(BuildContext context, bool maximizable) {
    return YaruWindow.of(context).setMaximizable(maximizable);
  }

  /// Sets whether the window can be closed.
  static Future<void> setClosable(BuildContext context, bool closable) {
    return YaruWindow.of(context).setClosable(closable);
  }

  /// Sets whether the native window control buttons are visible.
  static Future<void> setControlButtonsVisible(
    BuildContext context,
    bool visible,
  ) {
    return YaruWindow.of(context).setControlButtonsVisible(visible);
  }

  /// Sets whether the window can be resized.
  static Future<void> setResizable(BuildContext context, bool resizable) {
    return YaruWindow.of(context).setResizable(resizable);
  }

  /// Sets the minimum size of the window.
  static Future<void> setMinimumSize(BuildContext context, Size size) {
    return YaruWindow.of(context).setMinimumSize(size);
  }

  /// Sets the maximum size of the window.
  static Future<void> setMaximumSize(BuildContext context, Size size) {
    return YaruWindow.of(context).setMaximumSize(size);
  }

  /// Sets the size of the window.
  static Future<void> setSize(BuildContext context, Size size) {
    return YaruWindow.of(context).setSize(size);
  }

  /// Sets the position of the window.
  static Future<void> setPosition(BuildContext context, Offset position) {
    return YaruWindow.of(context).setPosition(position);
  }

  /// Sets whether the window stays above other windows.
  static Future<void> setAlwaysOnTop(BuildContext context, bool alwaysOnTop) {
    return YaruWindow.of(context).setAlwaysOnTop(alwaysOnTop);
  }

  /// Sets whether the window is hidden from the taskbar.
  static Future<void> setSkipTaskbar(BuildContext context, bool skip) {
    return YaruWindow.of(context).setSkipTaskbar(skip);
  }

  /// Centers the window on its screen.
  static Future<void> center(BuildContext context) {
    return YaruWindow.of(context).center();
  }

  /// Returns the current state of the window.
  static Future<YaruWindowState> state(BuildContext context) {
    return YaruWindow.of(context).state();
  }

  /// Returns a stream of window state changes.
  static Stream<YaruWindowState> states(BuildContext context) {
    return YaruWindow.of(context).states();
  }

  /// Installs a close handler for the window.
  static Future<void> onClose(
    BuildContext context,
    FutureOr<bool> Function() handler,
  ) {
    return YaruWindow.of(context).onClose(handler);
  }

  /// Ensures that the window is initialized and returns the primary instance.
  static Future<YaruWindowInstance> ensureInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();
    final window = YaruWindow._instance();
    await window.init();
    return window;
  }
}

/// A top-level window instance.
class YaruWindowInstance {
  YaruWindowInstance._(this._id);

  final int _id;

  YaruWindowPlatform get _platform => YaruWindowPlatform.instance;

  /// Initializes the window.
  Future<void> init() => _platform.init(_id);

  /// Closes the window.
  Future<void> close() => _platform.close(_id);

  /// Starts dragging the window.
  Future<void> drag() => _platform.drag(_id);

  /// Enters fullscreen mode.
  Future<void> fullscreen() => _platform.fullscreen(_id);

  /// Hides the window.
  Future<void> hide() => _platform.hide(_id);

  /// Hides the title bar.
  Future<void> hideTitle() => _platform.hideTitle(_id);

  /// Maximizes the window.
  Future<void> maximize() => _platform.maximize(_id);

  /// Minimizes the window.
  Future<void> minimize() => _platform.minimize(_id);

  /// Restores the window to its normal state.
  Future<void> restore() => _platform.restore(_id);

  /// Shows the window.
  Future<void> show() => _platform.show(_id);

  /// Shows the window menu.
  Future<void> showMenu() => _platform.showMenu(_id);

  /// Shows the title bar.
  Future<void> showTitle() => _platform.showTitle(_id);

  /// Sets the background color of the window.
  Future<void> setBackground(Color color) {
    return _platform.setBackground(_id, color);
  }

  /// Sets the brightness of the window.
  Future<void> setBrightness(Brightness brightness) {
    return _platform.setBrightness(_id, brightness);
  }

  /// Sets the title of the window.
  Future<void> setTitle(String title) => _platform.setTitle(_id, title);

  /// Sets whether the window can be minimized.
  Future<void> setMinimizable(bool minimizable) {
    return _platform.setMinimizable(_id, minimizable);
  }

  /// Sets whether the window can be maximized.
  Future<void> setMaximizable(bool maximizable) {
    return _platform.setMaximizable(_id, maximizable);
  }

  /// Sets whether the window can be closed.
  Future<void> setClosable(bool closable) {
    return _platform.setClosable(_id, closable);
  }

  /// Sets whether the native window control buttons are visible.
  Future<void> setControlButtonsVisible(bool visible) =>
      _platform.setControlButtonsVisible(_id, visible);

  /// Sets whether the window can be resized.
  Future<void> setResizable(bool resizable) =>
      _platform.setResizable(_id, resizable);

  /// Sets the minimum size of the window.
  Future<void> setMinimumSize(Size size) => _platform.setMinimumSize(_id, size);

  /// Sets the maximum size of the window.
  Future<void> setMaximumSize(Size size) => _platform.setMaximumSize(_id, size);

  /// Sets the size of the window.
  Future<void> setSize(Size size) => _platform.setSize(_id, size);

  /// Sets the position of the window.
  Future<void> setPosition(Offset position) =>
      _platform.setPosition(_id, position);

  /// Sets whether the window stays above other windows.
  Future<void> setAlwaysOnTop(bool alwaysOnTop) =>
      _platform.setAlwaysOnTop(_id, alwaysOnTop);

  /// Sets whether the window is hidden from the taskbar.
  Future<void> setSkipTaskbar(bool skip) => _platform.setSkipTaskbar(_id, skip);

  /// Centers the window on its screen.
  Future<void> center() => _platform.center(_id);

  /// Returns the current state of the window.
  Future<YaruWindowState> state() => _platform.state(_id);

  /// Returns a stream of window state changes.
  Stream<YaruWindowState> states() async* {
    yield await _platform.state(_id);
    yield* _platform.states(_id);
  }

  /// Installs a close handler for the window.
  Future<void> onClose(FutureOr<bool> Function() handler) {
    return _platform.onClose(_id, handler);
  }
}
