import '../../../core/util/data_state.dart';
import '../../../data/model/genres_model.dart';

abstract class IGetGenresUseCase {
  Future<DataState<GenreModel>> getGenresModel();
}
