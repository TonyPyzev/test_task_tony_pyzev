import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task_tony_pyzev/data/models/photo.dart';
import 'package:test_task_tony_pyzev/domain/repositories/unsplash_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UnsplashRepository _unsplashRepository = UnsplashRepository();

  HomeCubit() : super(const HomeState());

  void initState() async {
    final photos = await _unsplashRepository.fetchPhotos();

    emit(state.copyWith(photos: photos));
  }

  void loadMorePhotos() async {
    final newPhotos = await _unsplashRepository.fetchPhotos(count: 15);

    emit(state.copyWith(photos: state.photos + newPhotos));
  }
}
