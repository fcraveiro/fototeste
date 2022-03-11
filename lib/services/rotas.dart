import 'package:fototeste/paginas/pagina3.dart';

import '/menu.dart';
import '/paginas/pagina1.dart';
import 'package:get/get.dart';

rotas() {
  return [
    GetPage(name: '/', page: () => const Menu()),
    GetPage(
        name: '/menu/', page: () => const Menu(), transition: Transition.zoom),
    GetPage(
        name: '/semrota/',
        page: () => const Pagina1(),
        transition: Transition.zoom),
    GetPage(
        name: '/picker/',
        page: () => const Picker(),
        transition: Transition.zoom),
  ];
}
