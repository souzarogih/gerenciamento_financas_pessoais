import 'package:flutter/material.dart';

class CadastroContaScreen extends StatelessWidget {
  CadastroContaScreen({super.key});

  final _nomeController = TextEditingController();
  final _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Conta'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Nome"),
                ),
                TextFormField(
                  controller: _valorController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print(_valorController);
                      },
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
