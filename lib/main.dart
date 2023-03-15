import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:fremypro/presentation/home_screen.dart';
//import 'package:fremypro/presentation/home_view_model.dart';
//import 'package:provider/provider.dart';
import 'package:reformpro/presentation/home_view_model.dart';

import 'authentication/login.dart';
import 'presentation/home_screen.dart';
import 'remote/repository/board_repository_impl.dart';
import 'remote/source/board_api.dart';

//import 'data/repository/board_repository_impl.dart';
//import 'data/source/remote/board_api.dart';

// 리버포트 고치기 2

// void main() {
//   runApp(
//     ChangeNotifierProvider.value(
//       value: HomeViewModel(BoardRepositoryImpl(api: BoardApi())),
//       child: const MyApp(),
//     ),
//   );
// }

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// final counterProvider = ChangeNotifierProvider(
//   (ref) => Counter(),
// );

// 리버포트 고치기 3
final homeViewModelProvider = ChangeNotifierProvider(
    (ref) => HomeViewModel(BoardRepositoryImpl(api: BoardApi())));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const LoginPage(),

      //home: const HomeScreen(),
    );
  }
}



/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
