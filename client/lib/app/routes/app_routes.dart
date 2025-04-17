abstract class Routes {
  Routes._();
  static const root = Paths.root;
  static const home = Paths.home;
  static const admin = Paths.admin;
  static const reports = Paths.reports;

  static const profile = Paths.profile;
  static const settings = Paths.settings;

  static const products = Paths.products;

  static const login = Paths.login;
  static const dashboard = Paths.dashboard;
  static const members = Paths.members;
  static const trainers = Paths.trainers;
  static const orders = Paths.orders;
  static const logs = Paths.logs;

  static const tanents = Paths.tenants;
  static const stores = Paths.admin + Paths.stores;

  static const sales = Paths.reports + Paths.sales;

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String PRODUCT_DETAILS(String productId) => '$products/$productId';
}

abstract class Paths {
  // static const home = '/';

  static const root = '/';
  static const admin = '/admin';
  static const home = '/home'; // only for mobile

  static const products = '/products';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetails = '/:productId';
  static const login = '/login';
  static const dashboard = '/dashboard'; // only for web
  static const members = '/members';
  static const trainers = '/trainers';
  static const orders = '/orders';
  static const logs = '/logs';

  static const tenants = '/tenants';
  static const stores = '/stores';

  static const reports = '/reports';
  static const sales = '/sales';
}
