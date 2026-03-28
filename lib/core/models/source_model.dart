class Source {
  final String? name;
  final String? id;

  const Source(this.name, this.id);

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(json['name'], json['id']);
  }
}
