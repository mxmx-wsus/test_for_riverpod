import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_for_riverpod/providers.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // counterProviderの前につけれるのは↓の２種類あって、
    // 修飾子：final/const/static
    // 型：string/int/boolなど
    // 今回は「final」が適切。
    // ↓この書き方はfinalとcounterProviderの間にvarが含まれてる
    final counterProvider = ref.watch(CounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              // counterProvider内の「count」を文字列として表示させる。
              counterProvider.count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // counterProvider内の関数「increment」を実行させる。
          counterProvider.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
