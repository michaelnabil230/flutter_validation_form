extension ListExtensions<T> on List<T> {
  List<T> when(bool condition, List<T> list,
      [List<T> defaultRules = const []]) {
    addAll(condition ? list : defaultRules);

    return this;
  }

  List<T> unless(bool condition, List<T> list,
      [List<T> defaultRules = const []]) {
    when(!condition, list, defaultRules);

    return this;
  }
}
