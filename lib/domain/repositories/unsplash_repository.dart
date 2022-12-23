import 'package:test_task_tony_pyzev/data/models/photo.dart';
import 'package:test_task_tony_pyzev/domain/api/unsplash_api.dart';

class UnsplashRepository {
  final UnsplashApi _api = UnsplashApi();

  Future<List<Photo>> fetchPhotos({
    bool isRandom = true,
    int count = 30,
  }) async {
    try {
      final jsonData = await _api.fetchData(isRandom, count);
      List<Photo> photos = [];

      for (var element in jsonData) {
        photos.add(Photo.fromJson(element));
      }
      return photos;
    } catch (e) {
      throw Exception(e);
    }
  }
}
