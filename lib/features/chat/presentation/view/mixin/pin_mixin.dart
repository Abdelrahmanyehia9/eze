mixin PinMixin<T> {
  bool isPinned(T item);

  bool isAllPinned(Set<T> items) => items.isNotEmpty && items.every(isPinned);

  int get maxPinned => 5;

  bool canPin({required Set<T> selected, required Set<T> all}) {
    if (selected.isEmpty) return false;
    final allSelectedPinned = isAllPinned(selected);
    final selectedUnpinned = selected.where((e) => !isPinned(e)).length;
    final totalPinned = all.where(isPinned).length;
    return !allSelectedPinned && (totalPinned + selectedUnpinned) <= maxPinned;
  }

  Future<void> onPin(List<T> items);
  Future<void> onUnpin(List<T> items);
}
