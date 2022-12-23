part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<Photo> photos;

  const HomeState({
    this.photos = const [],
  });

  HomeState copyWith({
    List<Photo>? photos,
  }) {
    return HomeState(
      photos: photos ?? this.photos,
    );
  }

  @override
  List<Object> get props => [
        photos,
      ];
}
