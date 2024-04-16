import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test/screens/create_user_screen.dart';
import 'package:technical_test/screens/home_screen.dart';
import 'package:technical_test/screens/search_user_screen.dart';

void main() {
  testWidgets('BottomNavigationBar switches between tabs',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('Daftar User'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person_add_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Tambah User'), findsOneWidget);
  });
  testWidgets('CreateUserScreen has a form with name and job fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CreateUserScreen()));

    expect(find.widgetWithText(TextField, 'Nama'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Pekerjaan'), findsOneWidget);
  });

  testWidgets('Can enter text into the name and job fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CreateUserScreen()));

    await tester.enterText(find.widgetWithText(TextField, 'Nama'), 'John Doe');
    await tester.enterText(
        find.widgetWithText(TextField, 'Pekerjaan'), 'Developer');

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Developer'), findsOneWidget);
  });

  testWidgets('SearchUserScreen allows user input and displays search results',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SearchUserScreen()));

    expect(find.byType(TextField), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'eve');
    await tester.pump();

    expect(find.byType(ListTile), findsWidgets);
  });
}
