import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'bloc/my_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => MyBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SealedBlocBuilder4<MyBloc, MyState, Initial, Loading, Success, Failure>(
          builder: (context, states) => states(
                (initial) => const Text('Initial'),
                (loading) => const CircularProgressIndicator(),
                (success) => const Text('Success'),
                (failure) => const Text('Failure'),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: const Icon(Icons.check),
              onPressed: () => context.read<MyBloc>().add(DataRequested()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: const Icon(Icons.error),
              onPressed: () => context.read<MyBloc>().add(ErrorOccurred()),
            ),
          ),
        ],
      ),
    );
  }
}
