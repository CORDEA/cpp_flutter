import 'dart:ffi';

import 'package:cpp_flutter/main_bindings_generated.dart' as binding;
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';

class Component extends StatelessWidget {
  const Component({super.key, required this.kind, required this.element});

  final int kind;
  final binding.Element element;

  @override
  Widget build(BuildContext context) {
    switch (kind) {
      case binding.ComponentKind.Component_Text:
        return TextComponent(text: element.text);
      case binding.ComponentKind.Component_Column:
        return ColumnComponent(column: element.column);
      default:
        throw UnimplementedError();
    }
  }
}

class TextComponent extends StatelessWidget {
  const TextComponent({super.key, required this.text});

  final Pointer<binding.Text> text;

  @override
  Widget build(BuildContext context) {
    final str = text.ref.text.cast<Utf8>().toDartString();
    return Text(str);
  }
}

class ColumnComponent extends StatelessWidget {
  const ColumnComponent({super.key, required this.column});

  final Pointer<binding.Column> column;

  @override
  Widget build(BuildContext context) {
    var c = column.ref.first;
    final components = <Widget>[];
    while (c.address > 0) {
      final r = c.ref;
      components.add(Component(
        kind: r.kind,
        element: r.element,
      ));
      c = r.next;
    }
    return Column(children: components);
  }
}
