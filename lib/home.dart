import 'dart:ffi';

import 'package:cpp_flutter/component.dart';
import 'package:cpp_flutter/main.dart';
import 'package:cpp_flutter/main_bindings_generated.dart' as binding;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late binding.Component component;

  @override
  void initState() {
    super.initState();
    component = bindings.build().ref;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Component(kind: component.kind, element: component.element),
    );
  }
}
