import 'package:auto_route/auto_route.dart';
import 'package:flutter_fundamental/gen/route.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TravelMainRoute.page, initial: true),
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: DetailRoute.page),
      ];
}
