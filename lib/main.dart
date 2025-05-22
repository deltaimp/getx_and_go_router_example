import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'controllers/home_controller.dart';
import 'controllers/shop_controller.dart';
import 'views/home_view.dart';
import 'views/shop_view.dart';
import 'views/shop_detail_view.dart';
import 'views/main_scaffold.dart';

// configurazione router principale
// inizializzazione controller
// struttura applicazione

void main() {
  Get.put(HomeController()); // inizializzazione controller 1
  Get.put(ShopController()); // inizializzazione controller 2
  runApp(const MyApp());
}

// keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shopNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();

// configurazione router
final _router = GoRouter(
  navigatorKey: _rootNavigatorKey, // key
  initialLocation: '/home',       // pagina iniziale
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        // Shop Branch
        StatefulShellBranch(
          navigatorKey: _shopNavigatorKey, // key
          routes: [
            GoRoute(
              path: '/shop',
              builder: (context, state) => const ShopView(),
              routes: [
                GoRoute(
                  path: 'detail',
                  builder: (context, state) => const ShopDetailView(),
                ),
              ],
            ),
          ],
        ),
        // Home Branch
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routeInformationProvider ascolta i cambiamenti
      // routeInformationParser interpreta informazioni
      // routerDelegate esegue navigazione

      /*routeInformationProvider, utile per tenere traccia cambiementi route
      * serve per Avanti/ Indietro*/
      routeInformationProvider: _router.routeInformationProvider,

      /*routeInformationParser serve per mappare URL, serializzare/deserializzare*/
      routeInformationParser: _router.routeInformationParser,

      /* routerDelegate controlla la navigazione, coordina transizioni, costruisce screen*/
      routerDelegate: _router.routerDelegate,
     //  debugShowCheckedModeBanner: false,
      title: 'App',
    );
  }
}