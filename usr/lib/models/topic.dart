class Topic {
  final String id;
  final String title;
  final String description;
  final String content;
  final String? codeExample;
  final String iconName;

  const Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    this.codeExample,
    required this.iconName,
  });
}
