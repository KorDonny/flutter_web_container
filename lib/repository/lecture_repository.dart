import '../data_source/remote_data_source.dart';
import '../model/lecture.dart';
        
class LectureRepository {
  final RemoteDataSource _dataSource = RemoteDataSource();
  
  Future<List<Lecture>> getLectureList() => _dataSource.getLectureList();

}