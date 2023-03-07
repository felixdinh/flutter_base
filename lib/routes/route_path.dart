class RouteName {
  const RouteName._();

  static const home = 'home';
  static const categories = 'categories';
  static const products = 'products';
}

class RoutePaths {
  const RoutePaths._();
  static const home = '/';
  static const productListByCateId = 'products/:${RouteParam.category}';
  static const categories = 'categories';
}

class RouteParam{
  static const category = 'category';
}