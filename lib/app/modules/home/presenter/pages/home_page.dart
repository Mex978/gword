import 'dart:developer';

import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.controller.counter.addListener(_listener);
  }

  void _listener() {
    if (widget.controller.counterValue == 10) {
      log('counter: ${widget.controller.counter.value}');
    }
  }

  @override
  void dispose() {
    widget.controller.counter.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build', name: 'Home');

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: widget.controller.counter,
            builder: (context, child) {
              return Center(
                child: Text(
                  '${widget.controller.counterValue}',
                  key: const ValueKey('text'),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: widget.controller.counter2,
            builder: (context, child) {
              return Center(
                child: Text('${widget.controller.counterValue2}'),
              );
            },
          ),
          TextButton(onPressed: widget.controller.increment2, child: const Text('Patrick gay'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.controller.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
