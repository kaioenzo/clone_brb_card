import 'package:clone_brb_card/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/services/api/account_service.dart';
import 'ui/home/view_models/home_viewmodel.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then(
    (_) => runApp(
      MultiProvider(
        providers: [
          Provider<AccountService>(create: (_) => AccountService()),
          ChangeNotifierProvider<AccountViewModel>(
            create: (ctx) => AccountViewModel(
              accountService: ctx.read<AccountService>(),
            ),
          ),
        ],
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BRB CARD',
      home: HomeScreen(),
    );
  }
}
