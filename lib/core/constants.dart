enum Categories {
  electronics('electronics'),
  fashion("fashion"),
  grocery("grocery"),
  medicine("medicine"),
  toys("toys"),
  sports("sports"),
  books("books");

  const Categories(this.value);
  final String value;

  static Categories fromValue(String value) {
    return Categories.values
        .where((element) => element.value == value)
        .toList()
        .first;
  }
}
