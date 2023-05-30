enum Priority {
  high('High', 1),
  medium('Medium', 2),
  low('Low', 3);

  const Priority(this.value, this.priority);
  final String value;
  final int priority;
}
