import '../../entities/entities.dart';

abstract class LoadOffers {
  Future<List<OffersEntity>> load(String id);
}
