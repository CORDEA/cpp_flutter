// ignore_for_file: always_specify_types
// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings for `src/main.h`.
///
/// Regenerate bindings with `flutter pub run ffigen --config ffigen.yaml`.
///
class MainBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  MainBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  MainBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<Component> build() {
    return _build();
  }

  late final _buildPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<Component> Function()>>('build');
  late final _build = _buildPtr.asFunction<ffi.Pointer<Component> Function()>();
}

abstract class ComponentKind {
  static const int Component_Text = 0;
  static const int Component_Tile = 1;
  static const int Component_Column = 2;
}

class Element extends ffi.Union {
  external ffi.Pointer<Text> text;

  external ffi.Pointer<Tile> tile;

  external ffi.Pointer<Column> column;
}

class Text extends ffi.Struct {
  external ffi.Pointer<ffi.Char> text;
}

class Tile extends ffi.Struct {
  external ffi.Pointer<ChildComponent> title;

  external ffi.Pointer<ChildComponent> subtitle;
}

class ChildComponent extends ffi.Struct {
  @ffi.Int32()
  external int kind;

  external Element element;

  external ffi.Pointer<ChildComponent> next;
}

class Column extends ffi.Struct {
  external ffi.Pointer<ChildComponent> first;
}

class Component extends ffi.Struct {
  @ffi.Int32()
  external int kind;

  external Element element;
}
