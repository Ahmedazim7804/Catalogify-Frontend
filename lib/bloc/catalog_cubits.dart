import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/data/post_endpoints.dart';
import 'package:inno_hack/data/user_endpoints.dart';
import 'package:inno_hack/models/catalog.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(CatalogLoading()) {
    getUserCatalogs();
  }

  List<Catalog> catalogs = [];

  void getUserCatalogs() async {
    final unparsedPosts = await listPosts();

    for (final unparsedPost in unparsedPosts) {
      Catalog catalog = Catalog(
          title: unparsedPost['title'],
          price: (unparsedPost['cost'] as double).toInt(),
          category: Categories.fromValue(unparsedPost['category']),
          description: unparsedPost['description'],
          brand: unparsedPost['brand'],
          warranty: unparsedPost['warranty_yrs'],
          returnPeriod: unparsedPost['return_days'],
          state: unparsedPost['seller_location'],
          images: unparsedPost['images']);

      catalogs.add(catalog);
    }

    if (catalogs.isNotEmpty) {
      emit(CatalogLoaded());
    } else {
      emit(CatalogEmpty());
    }
  }
}
