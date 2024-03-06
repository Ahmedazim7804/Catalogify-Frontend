import 'package:flutter_bloc/flutter_bloc.dart';
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
      // Catalog(
      //     title: unparsedPost['title'],
      //     price: unparsedPost['price'],
      //     category: unparsedPost['category'],
      //     description: unparsedPost['description'],
      //     brand: unparsedPost['brand'],
      //     warranty: unparsedPost['warranty'],
      //     returnPeriod: unparsedPost['returnPeriod'],
      //     state: unparsedPost['state'],
      //     userId: unparsedPost['uid'],
      //     images: unparsedPost['images']);
    }
  }
}
