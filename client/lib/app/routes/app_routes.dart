abstract class Routes {
  Routes._();
  static const home = Paths.home;

  static const profile = Paths.home + Paths.profile;
  static const settings = Paths.settings;

  static const products = Paths.home + Paths.products;

  static const login = Paths.login;
  static const dashboard = Paths.home + Paths.dashboard;
  static const mebmers = Paths.home + Paths.members;

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String PRODUCT_DETAILS(String productId) => '$products/$productId';
}

abstract class Paths {
  static const home = '/home';
  static const products = '/products';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetails = '/:productId';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const members = '/members';
}
