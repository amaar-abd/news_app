import 'package:hive/hive.dart';

part 'source_model.g.dart';

@HiveType(typeId: 1)
class Source  extends HiveObject{
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? id;

   Source(this.name, this.id);

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(json['name'], json['id']);
  }
  


}
