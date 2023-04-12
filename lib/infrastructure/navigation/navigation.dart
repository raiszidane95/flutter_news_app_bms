import 'package:get/get.dart';

import '../../presentation/bindings/articles_binding.dart';
import '../../presentation/bindings/cart/cart_binding.dart';
import '../../presentation/bindings/home_binding.dart';
import '../../presentation/bindings/search_binding.dart';
import '../../presentation/bindings/source_binding.dart';
import '../../presentation/pages/article_page.dart';
import '../../presentation/pages/cart/cart_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/search_result_page.dart';
import '../../presentation/pages/source_page.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.SOURCES,
      page: () => SourcePage(),
      binding: SourceBindings(),
    ),
    GetPage(
      name: Routes.ARTICLES,
      page: () => ArticlePage(),
      binding: ArticlesBinding(),
    ),
    GetPage(
      name: Routes.SEARCHRESULT,
      page: () => SearchResultPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
  ];
}
