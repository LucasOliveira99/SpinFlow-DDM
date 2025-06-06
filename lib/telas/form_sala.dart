import 'package:flutter/material.dart';

class FormSala extends StatefulWidget {
  const FormSala({Key? key}) : super(key: key);

  @override
  _FormSalaState createState() => _FormSalaState();
}

class _FormSalaState extends State<FormSala> {
  final _formKey = GlobalKey<FormState>();

  // Campos do formulário
  int? id;
  String nome = '';
  int capacidadeTotalBikes = 0;
  int numeroFilas = 0;
  int numeroBikesPorFila = 0;
  bool ativo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Sala'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nome
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().length < 3) {
                    return 'Informe um nome com pelo menos 3 letras';
                  }
                  return null;
                },
                onSaved: (value) => nome = value!.trim(),
              ),
              const SizedBox(height: 16),

              // Capacidade Total de Bikes
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Capacidade Total de Bikes',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a capacidade total de bikes';
                  }
                  final parsed = int.tryParse(value);
                  if (parsed == null || parsed <= 0) {
                    return 'Informe um número válido maior que 0';
                  }
                  return null;
                },
                onSaved: (value) =>
                    capacidadeTotalBikes = int.parse(value!.trim()),
              ),
              const SizedBox(height: 16),

              // Número de Filas
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Número de Filas',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o número de filas';
                  }
                  final parsed = int.tryParse(value);
                  if (parsed == null || parsed <= 0) {
                    return 'Informe um número válido maior que 0';
                  }
                  return null;
                },
                onSaved: (value) => numeroFilas = int.parse(value!.trim()),
              ),
              const SizedBox(height: 16),

              // Número de Bikes por Fila
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Número de Bikes por Fila',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o número de bikes por fila';
                  }
                  final parsed = int.tryParse(value);
                  if (parsed == null || parsed <= 0) {
                    return 'Informe um número válido maior que 0';
                  }
                  return null;
                },
                onSaved: (value) =>
                    numeroBikesPorFila = int.parse(value!.trim()),
              ),
              const SizedBox(height: 16),

              // Checkbox Ativo
              Row(
                children: [
                  Checkbox(
                    value: ativo,
                    onChanged: (value) {
                      setState(() {
                        ativo = value ?? true;
                      });
                    },
                  ),
                  const Text('Ativo'),
                ],
              ),
              const SizedBox(height: 24),

              // Botão Salvar
              ElevatedButton(
                onPressed: _salvarFormulario,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Simulação: salvar
      debugPrint('Sala salva:');
      debugPrint('ID: $id');
      debugPrint('Nome: $nome');
      debugPrint('Capacidade Total de Bikes: $capacidadeTotalBikes');
      debugPrint('Número de Filas: $numeroFilas');
      debugPrint('Número de Bikes por Fila: $numeroBikesPorFila');
      debugPrint('Ativo: $ativo');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sala salva com sucesso!')),
      );
    }
  }
}