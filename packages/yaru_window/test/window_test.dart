import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:yaru_window/yaru_window.dart';
import 'package:yaru_window_platform_interface/yaru_window_platform_interface.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(Colors.red);
    registerFallbackValue(Brightness.light);
    registerFallbackValue(Size.zero);
    registerFallbackValue(Offset.zero);
  });

  testWidgets('platform', (tester) async {
    const state = YaruWindowState(
      isActive: false,
      isClosable: true,
      isFullscreen: false,
      isMaximizable: true,
      isMaximized: false,
      isMinimizable: true,
      isMinimized: false,
      isMovable: true,
      title: 'foo bar',
    );
    final change = state.copyWith(isActive: true);

    final platform = MockYaruWindowPlatform();
    when(() => platform.init(any())).thenAnswer((_) async {});
    when(() => platform.close(any())).thenAnswer((_) async {});
    when(() => platform.drag(any())).thenAnswer((_) async {});
    when(() => platform.fullscreen(any())).thenAnswer((_) async {});
    when(() => platform.hide(any())).thenAnswer((_) async {});
    when(() => platform.hideTitle(any())).thenAnswer((_) async {});
    when(() => platform.maximize(any())).thenAnswer((_) async {});
    when(() => platform.minimize(any())).thenAnswer((_) async {});
    when(() => platform.restore(any())).thenAnswer((_) async {});
    when(() => platform.show(any())).thenAnswer((_) async {});
    when(() => platform.showMenu(any())).thenAnswer((_) async {});
    when(() => platform.showTitle(any())).thenAnswer((_) async {});
    when(() => platform.setBackground(any(), any())).thenAnswer((_) async {});
    when(() => platform.setBrightness(any(), any())).thenAnswer((_) async {});
    when(() => platform.setTitle(any(), any())).thenAnswer((_) async {});
    when(() => platform.setMinimizable(any(), any())).thenAnswer((_) async {});
    when(() => platform.setMaximizable(any(), any())).thenAnswer((_) async {});
    when(() => platform.setClosable(any(), any())).thenAnswer((_) async {});
    when(() => platform.setControlButtonsVisible(any(), any()))
        .thenAnswer((_) async {});
    when(() => platform.setResizable(any(), any())).thenAnswer((_) async {});
    when(() => platform.setMinimumSize(any(), any())).thenAnswer((_) async {});
    when(() => platform.setMaximumSize(any(), any())).thenAnswer((_) async {});
    when(() => platform.setSize(any(), any())).thenAnswer((_) async {});
    when(() => platform.setPosition(any(), any())).thenAnswer((_) async {});
    when(() => platform.setAlwaysOnTop(any(), any())).thenAnswer((_) async {});
    when(() => platform.setSkipTaskbar(any(), any())).thenAnswer((_) async {});
    when(() => platform.center(any())).thenAnswer((_) async {});
    when(() => platform.state(any())).thenAnswer((_) async => state);
    when(() => platform.states(any())).thenAnswer((_) => Stream.value(change));
    when(() => platform.onClose(any(), any())).thenAnswer((_) async {});

    YaruWindowPlatform.instance = platform;

    await tester.pumpWidget(const MaterialApp());

    final context = tester.element(find.byType(MaterialApp));
    expect(YaruWindow.of(context), isNotNull);

    await YaruWindow.ensureInitialized();
    verify(() => platform.init(0)).called(1);

    await YaruWindow.close(context);
    verify(() => platform.close(0)).called(1);

    await YaruWindow.drag(context);
    verify(() => platform.drag(0)).called(1);

    await YaruWindow.fullscreen(context);
    verify(() => platform.fullscreen(0)).called(1);

    await YaruWindow.hide(context);
    verify(() => platform.hide(0)).called(1);

    await YaruWindow.hideTitle(context);
    verify(() => platform.hideTitle(0)).called(1);

    await YaruWindow.maximize(context);
    verify(() => platform.maximize(0)).called(1);

    await YaruWindow.minimize(context);
    verify(() => platform.minimize(0)).called(1);

    await YaruWindow.restore(context);
    verify(() => platform.restore(0)).called(1);

    await YaruWindow.show(context);
    verify(() => platform.show(0)).called(1);

    await YaruWindow.showMenu(context);
    verify(() => platform.showMenu(0)).called(1);

    await YaruWindow.showTitle(context);
    verify(() => platform.showTitle(0)).called(1);

    await YaruWindow.setBackground(context, Colors.red);
    verify(() => platform.setBackground(0, Colors.red)).called(1);

    await YaruWindow.setBrightness(context, Brightness.dark);
    verify(() => platform.setBrightness(0, Brightness.dark)).called(1);

    await YaruWindow.setTitle(context, 'foo bar');
    verify(() => platform.setTitle(0, 'foo bar')).called(1);

    await YaruWindow.setMinimizable(context, false);
    verify(() => platform.setMinimizable(0, false)).called(1);

    await YaruWindow.setMaximizable(context, false);
    verify(() => platform.setMaximizable(0, false)).called(1);

    await YaruWindow.setClosable(context, false);
    verify(() => platform.setClosable(0, false)).called(1);

    await YaruWindow.setControlButtonsVisible(context, false);
    verify(() => platform.setControlButtonsVisible(0, false)).called(1);

    await YaruWindow.setResizable(context, false);
    verify(() => platform.setResizable(0, false)).called(1);

    await YaruWindow.setMinimumSize(context, const Size(100, 200));
    verify(() => platform.setMinimumSize(0, const Size(100, 200))).called(1);

    await YaruWindow.setMaximumSize(context, const Size(800, 600));
    verify(() => platform.setMaximumSize(0, const Size(800, 600))).called(1);

    await YaruWindow.setSize(context, const Size(400, 300));
    verify(() => platform.setSize(0, const Size(400, 300))).called(1);

    await YaruWindow.setPosition(context, const Offset(10, 20));
    verify(() => platform.setPosition(0, const Offset(10, 20))).called(1);

    await YaruWindow.center(context);
    verify(() => platform.center(0)).called(1);

    await YaruWindow.setAlwaysOnTop(context, true);
    verify(() => platform.setAlwaysOnTop(0, true)).called(1);

    await YaruWindow.setSkipTaskbar(context, true);
    verify(() => platform.setSkipTaskbar(0, true)).called(1);

    // The same calls through a window instance.
    final window = YaruWindow.of(context);
    await window.setResizable(true);
    verify(() => platform.setResizable(0, true)).called(1);
    await window.center();
    verify(() => platform.center(0)).called(1);

    expect(await YaruWindow.state(context), state);
    verify(() => platform.state(0)).called(1);

    await expectLater(
      YaruWindow.states(context),
      emitsInOrder([state, change]),
    );
    verify(() => platform.state(0)).called(1);
    verify(() => platform.states(0)).called(1);

    await YaruWindow.onClose(context, () => true);
    verify(() => platform.onClose(0, any())).called(1);
  });
}

class MockYaruWindowPlatform
    with Mock, MockPlatformInterfaceMixin
    implements YaruWindowPlatform {}
