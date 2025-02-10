import 'package:clone_brb_card/domain/models/account.dart';
import 'package:clone_brb_card/ui/home/view_models/home_viewmodel.dart';
import 'package:clone_brb_card/ui/home/widgets/account_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'account_carousel_test.mocks.dart';

@GenerateMocks([AccountViewModel])
void main() {
  late MockAccountViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockAccountViewModel();
  });

  Widget createTestWidget() {
    return ChangeNotifierProvider<AccountViewModel>.value(
      value: mockViewModel,
      child: const MaterialApp(
        home: Scaffold(
          body: AccountCarousel(),
        ),
      ),
    );
  }

  testWidgets('Should change account when swiped', (WidgetTester tester) async {
    final accounts = [
      Account(
          name: 'Account 1',
          creditCardNumber: '1234567812345678',
          balanceAmmount: 1000.0,
          betterDayToBuy: '10',
          id: '1',
          transactions: []),
      Account(
          name: 'Account 2',
          creditCardNumber: '8765432187654321',
          balanceAmmount: 500.0,
          betterDayToBuy: '15',
          id: '2',
          transactions: []),
    ];

    // Mock properties
    when(mockViewModel.accounts).thenReturn(accounts);
    when(mockViewModel.selectedIndex).thenReturn(0);
    when(mockViewModel.selectAccount(any)).thenAnswer((_) {});

    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    // Swipe to next account
    await tester.fling(find.byType(PageView), const Offset(-300, 0), 300);
    await tester.pumpAndSettle();

    verify(mockViewModel.selectAccount(1)).called(1);
  });

  testWidgets('Should change account when tapped', (WidgetTester tester) async {
    final accounts = [
      Account(
        id: '1',
        name: 'Account 1',
        creditCardNumber: '1234567812345678',
        balanceAmmount: 1000.0,
        betterDayToBuy: '10',
        transactions: [],
      ),
      Account(
        id: '2',
        name: 'Account 2',
        creditCardNumber: '8765432187654321',
        balanceAmmount: 500.0,
        betterDayToBuy: '15',
        transactions: [],
      ),
    ];

    when(mockViewModel.accounts).thenReturn(accounts);
    when(mockViewModel.selectedIndex).thenReturn(0);
    when(mockViewModel.selectAccount(any)).thenAnswer((invocation) {});

    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    await tester.fling(find.byType(PageView), const Offset(-300, 0), 300);
    await tester.pumpAndSettle();

    final account2Finder = find.text('Account 2');
    expect(account2Finder, findsOneWidget, reason: 'Account 2 should be visible on screen before tap.');
    await tester.tap(account2Finder);
    await tester.pumpAndSettle();

    verify(mockViewModel.selectAccount(1)).called(1);
  });
}
