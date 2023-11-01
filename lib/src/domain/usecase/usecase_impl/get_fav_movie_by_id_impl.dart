import '../../../data/datasource/local/database_repository.dart';
import '../usecase_interface/i_get_fav_movie_by_id_usecase.dart';

class GetFavMovieByIdUseCase extends IGetFavMovieByIdUseCase {
  final DatabaseRepository databaseRepository;
  static const int _doNotExistCode = -1;

  GetFavMovieByIdUseCase({
    required this.databaseRepository,
  });

  @override
  Future<int> getFavMovieById(int id) async {
    final int? data = await databaseRepository.getFavMovieById(id);
    if (data != null) {
      return data;
    } else {
      return Future<int>.value(_doNotExistCode);
    }
  }
}
