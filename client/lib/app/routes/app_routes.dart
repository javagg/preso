abstract class Routes {
  Routes._();
  // static const home = Paths.home;
  static const root = Paths.root;
  static const admin =  Paths.admin;

  static const profile =  Paths.profile;
  static const settings = Paths.settings;

  static const products =  Paths.products;

  static const login = Paths.login;
  // static const dashboard = Paths.home + Paths.dashboard;
  // static const members = Paths.home + Paths.members;
  // static const orders = Paths.home + Paths.orders;
  static const dashboard =  Paths.dashboard;
  static const members =   Paths.members;
  static const orders =  Paths.orders;


  static const tanents =  Paths.tenants;
  static const stores =  Paths.admin + Paths.stores;

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String PRODUCT_DETAILS(String productId) => '$products/$productId';
}

abstract class Paths {
  // static const home = '/';

  static const root = '/';
  static const admin = '/admin';

  static const products = '/products';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetails = '/:productId';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const members = '/members';
  static const orders = '/orders';

  static const tenants = '/tenants';
  static const stores = '/stores';
}
