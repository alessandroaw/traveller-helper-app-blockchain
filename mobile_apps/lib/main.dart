import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveller_helper/routes.dart';
import 'package:traveller_helper/services/contract_manager.dart';
import 'package:traveller_helper/services/repositories/user_repository.dart';
import 'package:traveller_helper/utilities/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ContractManager().initializeCreds();
  runApp(App(
    userRepository: UserRepository(),
  ));
}

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.userRepository,
  }) : super(key: key);

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: userRepository,
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: thThemeData,
      initialRoute: '/',
      routes: routes,
    );
  }
}
