import '../data_source/remote_data_source.dart';
import '../model/lecture.dart';

class LectureRepository {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<List<Lecture>> getLectureList() {
    return _remoteDataSource.getLectureList();
  }
}