// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoStateHash() => r'6c16f469d984317fa9340c8459720e67a5161e2b';

/// See also [TodoState].
@ProviderFor(TodoState)
final todoStateProvider =
    AutoDisposeNotifierProvider<TodoState, List<Task>>.internal(
  TodoState.new,
  name: r'todoStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoState = AutoDisposeNotifier<List<Task>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions