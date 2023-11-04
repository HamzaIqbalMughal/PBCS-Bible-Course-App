class CourseModel{
  int lessonNo = -1;
  List<LessonModel> lessonList = [];
  CourseModel(this.lessonNo){

  }
}
class LessonModel{
  LessonModel(this.content);
  String content = '';
}