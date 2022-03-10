import 'dart:developer';

import 'package:fototeste/paginas/pagina2.dart';
import '/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key}) : super(key: key);

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 65,
            ),
            ElevatedButton(
              style: elevatedEstilo,
              onPressed: () {
                Get.back();
              },
              child: const Text('Voltar ao Menu'),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: FocusedMenuHolder(
                animateMenuItems: false,
                duration: const Duration(milliseconds: 200),
                blurSize: 1,
                blurBackgroundColor: Colors.black.withOpacity(.9),
                onPressed: () {},
                menuItems: <FocusedMenuItem>[
                  FocusedMenuItem(
                    title: const Text(
                      'Opc 1',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      log('clicado 1');
                    },
                    trailingIcon: const Icon(
                      Icons.access_alarm,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  FocusedMenuItem(
                    title: const Text(
                      'Opc 2',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      log('clicado 2');
                    },
                    trailingIcon: const Icon(
                      Icons.access_alarm,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  FocusedMenuItem(
                    title: const Text(
                      'Opc 3',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      log('clicado 3');
                    },
                    trailingIcon: const Icon(
                      Icons.access_alarm,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  FocusedMenuItem(
                    title: const Text(
                      'Opc 4',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      log('clicado 4');
                    },
                    trailingIcon: const Icon(
                      Icons.access_alarm,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.red,
                  ),
                ],
                child: Image.asset('assets/imagens/calendario.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
