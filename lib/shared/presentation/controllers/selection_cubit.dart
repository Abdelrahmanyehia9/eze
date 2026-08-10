import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionCubit<T> extends Cubit<SelectionState<T>> {
  SelectionCubit() : super(SelectionState<T>());
  Set<T> _all = {};

  Set<T> get all => _all;

  void toggle(T item) {
    final updated = Set<T>.from(state.selected);
    updated.contains(item) ? updated.remove(item) : updated.add(item);
    emit(state.copyWith(selected: updated));
  }

  void selectAll([List<T>? items]) =>
      emit(state.copyWith(selected: Set<T>.from(items ?? _all)));

  void unselectAll() => emit(state.copyWith(selected: {}));

  void setAll(List<T> list) {
    _all = list.toSet();
  }

  void clear() => emit(state.copyWith(selected: {}));
}

class SelectionState<T> {
  final Set<T> selected;
  SelectionState({Set<T>? selected}) : selected = selected ?? {};
  bool get isSelectionMode => selected.isNotEmpty;
  bool isSelected(T item) => selected.contains(item);
  int get count => selected.length;
  bool isAllSelected(List<T> items) => selected.length == items.length;
  SelectionState<T> copyWith({Set<T>? selected}) =>
      SelectionState(selected: selected ?? this.selected);
}

class SelectionBuilder<T> extends StatelessWidget {
  final Widget Function(SelectionCubit<T> bloc, SelectionState<T> state)
  builder;
  const SelectionBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit<T>, SelectionState<T>>(
      builder: (context, state) => PopScope(
        canPop: !state.isSelectionMode,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && state.isSelectionMode) {
            context.read<SelectionCubit<T>>().unselectAll();
          }
        },
        child: builder(context.read<SelectionCubit<T>>(), state),
      ),
    );
  }
}
