class TogglePinUseCase<T> {
  List<T> call({
    required List<T> allItems,
    required List<T> target,
    required bool pinned,
    required Object Function(T item) idSelector,
    required T Function(T item, bool pinned) copyWithPinned,
    required bool Function(T item) pinnedSelector,
  }) {
    final targetIds = target.map(idSelector).toSet();

    final updated = allItems.map((item) {
      return targetIds.contains(idSelector(item))
          ? copyWithPinned(item, pinned)
          : item;
    }).toList();

    updated.sort((a, b) {
      final aPinned = pinnedSelector(a) ? 1 : 0;
      final bPinned = pinnedSelector(b) ? 1 : 0;
      return bPinned.compareTo(aPinned);
    });

    return updated;
  }
}
