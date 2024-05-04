import '../model/SeriesToAdd.dart';

abstract class AddSeriesService {
  Future<void> add(SeriesToAdd seriesToAdd);
}
