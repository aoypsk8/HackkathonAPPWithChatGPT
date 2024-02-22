class Lesson {
  final int lessonId;
  final String lessonName;
  final String lessonContent;

  Lesson({
    required this.lessonId,
    required this.lessonName,
    required this.lessonContent,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      lessonId: json['lesson_id'],
      lessonName: json['lesson_name'],
      lessonContent: json['lesson_content'],
    );
  }
}
