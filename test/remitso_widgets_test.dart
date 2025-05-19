import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remitso_widgets/remitso_widgets.dart';

Widget buildTestableWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('RemitsoTextField Tests', () {
    testWidgets('renders correctly with basic props', (WidgetTester tester) async {
      final controller = TextEditingController();
      
      await tester.pumpWidget(buildTestableWidget(
        RemitsoTextField(
          title: 'Test Field',
          controller: controller,
          regexList: [],
        ),
      ));

      expect(find.text('Test Field'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('shows hint messages when provided', (WidgetTester tester) async {
      final controller = TextEditingController();
      
      await tester.pumpWidget(buildTestableWidget(
        RemitsoTextField(
          title: 'Test Field',
          controller: controller,
          regexList: [RegExp(r'^[a-z]+$')],
          hintMessages: ['Only lowercase letters allowed'],
        ),
      ));

      expect(find.text('Only lowercase letters allowed'), findsOneWidget);
    });

    testWidgets('validates input correctly', (WidgetTester tester) async {
      final controller = TextEditingController();
      
      await tester.pumpWidget(buildTestableWidget(
        RemitsoTextField(
          title: 'Test Field',
          controller: controller,
          regexList: [RegExp(r'^[a-z]+$')],
        ),
      ));

      await tester.enterText(find.byType(TextFormField), 'Test123');
      await tester.pump();

      expect(find.text('Invalid input'), findsOneWidget);
    });
  });

  group('RemitsoAppBar Tests', () {
    testWidgets('renders correctly with title', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: RemitsoAppBar(
            title: 'Test AppBar',
          ),
        ),
      ));

      expect(find.text('Test AppBar'), findsOneWidget);
    });

    testWidgets('shows back button when specified', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: RemitsoAppBar(
            title: 'Test AppBar',
            showBackButton: true,
          ),
        ),
      ));

      expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
    });

    testWidgets('navigates back when back button is pressed', (WidgetTester tester) async {
      bool navigationOccurred = false;
      
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: RemitsoAppBar(
            title: 'Test AppBar',
            showBackButton: true,
          ),
        ),
        navigatorObservers: [
          MockNavigatorObserver(onPop: () {
            navigationOccurred = true;
          }),
        ],
      ));

      await tester.tap(find.byIcon(Icons.arrow_back_ios));
      await tester.pump();

      expect(navigationOccurred, isTrue);
    });
  });

  group('RemitsoRadioButton Tests', () {
    testWidgets('renders correctly with label', (WidgetTester tester) async {
      String groupValue = 'test';
      
      await tester.pumpWidget(buildTestableWidget(
        RemitsoRadioButton<String>(
          value: 'test',
          groupValue: groupValue,
          label: 'Test Option',
          onChanged: (value) {},
        ),
      ));

      expect(find.text('Test Option'), findsOneWidget);
    });

    testWidgets('calls onChanged when tapped', (WidgetTester tester) async {
      String? selectedValue;
      String initialValue = '';
      
      await tester.pumpWidget(buildTestableWidget(
        RemitsoRadioButton<String>(
          value: 'test',
          groupValue: initialValue,
          label: 'Test Option',
          onChanged: (value) {
            if (value != null) {
              selectedValue = value;
            }
          },
        ),
      ));

      await tester.tap(find.byType(RemitsoRadioButton<String>));
      await tester.pump();

      expect(selectedValue, equals('test'));
    });
  });

  group('RemitsoDropdownButton Tests', () {
    testWidgets('renders correctly with items', (WidgetTester tester) async {
      String? selectedValue = 'item1';
      
      await tester.pumpWidget(buildTestableWidget(
        RemitsoDropdownButton<String>(
          value: selectedValue,
          items: [
            DropdownMenuItem(
              value: 'item1',
              child: Text('Item 1'),
            ),
            DropdownMenuItem(
              value: 'item2',
              child: Text('Item 2'),
            ),
          ],
          onChanged: (value) {},
        ),
      ));

      expect(find.text('Item 1'), findsOneWidget);
    });

    testWidgets('shows hint when provided', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        RemitsoDropdownButton<String>(
          value: null,
          items: [
            DropdownMenuItem(
              value: 'item1',
              child: Text('Item 1'),
            ),
          ],
          onChanged: (value) {},
          hint: 'Select an item',
        ),
      ));

      expect(find.text('Select an item'), findsOneWidget);
    });
  });

  group('RemitsoTheme Tests', () {
    test('RemitsoColors contains all required colors', () {
      expect(RemitsoColors.primary, equals(const Color(0xFF480052)));
      expect(RemitsoColors.black, equals(const Color(0xFF000000)));
      expect(RemitsoColors.white, equals(Colors.white));
    });

    test('RemitsoTextStyle provides all required text styles', () {
      final TextStyle displayLarge = RemitsoTextStyle.displayLarge;
      final TextStyle header = RemitsoTextStyle.header;
      final TextStyle inputText = RemitsoTextStyle.inputText;

      expect(displayLarge.fontSize, equals(28));
      expect(displayLarge.fontWeight, equals(FontWeight.bold));
      expect(displayLarge.color, equals(RemitsoColors.primary));

      expect(header.fontSize, equals(24));
      expect(header.letterSpacing, equals(0.32));
      expect(header.color, equals(RemitsoColors.primary));

      expect(inputText.fontSize, equals(14));
      expect(inputText.fontWeight, equals(FontWeight.w300));
      expect(inputText.color, equals(RemitsoColors.black87));
    });
  });
}

class MockNavigatorObserver extends NavigatorObserver {
  final VoidCallback onPop;

  MockNavigatorObserver({required this.onPop});

  @override
  void didPop(Route route, Route? previousRoute) {
    onPop();
  }
}