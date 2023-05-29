import 'package:auto_route/auto_route.dart';
import 'package:flutter_fundamental/gen/route.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: DetailRoute.page),
      ];
}
