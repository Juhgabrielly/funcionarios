import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:produtos/root/pallet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> funcionarios = [];
  int indice = 0;

  ValueChanged<dynamic>? get onChanged => null;

  @override
  void initState() {
    super.initState();
    carrearMockupJSON();
  }

  Future<void> carrearMockupJSON() async {
    String dados = await rootBundle.loadString('assets/mockup/funcionarios.json');
    setState(() {
      funcionarios = json.decode(dados);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EducaFinança")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              funcionarios.isNotEmpty
                  ? funcionarios[indice]['nome']
                  : "Nome do funcionario",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.azul2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  spacing: 10,
                  children: [
                    funcionarios.isNotEmpty
                        ? Image.network(
                            funcionarios[indice]['avatar'],
                            width: 200,
                            errorBuilder:
                                (
                                  BuildContext context,
                                  Object exception,
                                  StackTrace? stackTrace,
                                ) =>
                                    Image.asset('assets/icone.png', width: 200),
                          )
                        : Image.asset(
                            'assets/icone.png',
                            height: 200,
                            width: 200,
                          ),
                    Text(
                      funcionarios.isNotEmpty
                          ? funcionarios[indice]['cargo']
                          : "Cargo",
                    ),
                    Text(
                      funcionarios.isNotEmpty
                          ? "R\$ ${funcionarios[indice]['salario'].toStringAsFixed(2).replaceAll('.', ',')}"
                          : "R\$ 0.00",
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: indice > 0
                      ? () => setState(() {
                          indice--;
                        })
                      : null,
                  child: Text("Anterior"),
                ),
                ElevatedButton(
                  onPressed: indice < funcionarios.length - 1
                      ? () => setState(() {
                          indice++;
                        })
                      : null,
                  child: Text("Proximo"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
