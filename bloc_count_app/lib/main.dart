import 'package:bloc_count_app/app_bloc.dart';
import 'package:bloc_count_app/app_events.dart';
import 'package:bloc_count_app/app_states.dart';
import 'package:bloc_count_app/visibility/visibility_bloc.dart';
import 'package:bloc_count_app/visibility/visibility_state.dart';
import 'package:bloc_count_app/visibility/visibity_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(),
        ),
        BlocProvider(create: (context) => VisibilityBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<AppBloc, AppStates>(builder: (context, snapshot) {
              return Text(
                '${snapshot.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            BlocBuilder<VisibilityBloc,VisibilityState>(builder: (context, state) {
              return Visibility(
                visible: state.isVisible,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  height: 200,color: Colors.amber,
                                ),
                ));
            })
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<AppBloc>(context).add(Increament()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<AppBloc>(context).add(Decreament()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<VisibilityBloc>(context)
                .add(VisibilityShowEvent()),
            tooltip: 'Decrement',
            child: const Text("show"),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<VisibilityBloc>(context)
                .add(VisibilityHideEvent()),
            tooltip: 'Decrement',
            child: const Text("hide"),
          ),
        ],
      ),
    );
  }
}
