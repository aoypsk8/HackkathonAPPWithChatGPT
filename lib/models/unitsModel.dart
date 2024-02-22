import 'package:flutter_toturial/models/lessonsModel.dart';

class Unit {
  final int unitId;
  final String unitName;
  final List<Lesson> lessons;

  Unit({
    required this.unitId,
    required this.unitName,
    required this.lessons,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    var lessonsList = json['lessons'] as List;
    List<Lesson> lessons =
        lessonsList.map((lessonJson) => Lesson.fromJson(lessonJson)).toList();

    return Unit(
      unitId: json['unit_id'],
      unitName: json['unit_name'],
      lessons: lessons,
    );
  }
}
