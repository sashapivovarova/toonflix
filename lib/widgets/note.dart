import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Next(),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(
                  Icons.question_mark_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Next extends StatefulWidget {
  const Next({
    super.key,
  });

  @override
  State<Next> createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('next initState!');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('next dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('next build!');
    return const Text('nothing');
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print('initState!');
  }

  @override
  void dispose() {
    super.dispose();
    print('disopose!');
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'MyLargeTitle',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
