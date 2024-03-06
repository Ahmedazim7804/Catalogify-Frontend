part of 'catalog_cubits.dart';

abstract class CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {}

class CatalogEmpty extends CatalogState {}
