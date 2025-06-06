import 'package:flutter/material.dart';
import 'package:flutter_application_1/dto/dto_fabricante.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_application_1/dto/dto_fabricante.dart'; 

class FormFabricante extends StatefulWidget {
  const FormFabricante({Key? key}) : super(key: key);

  @override
  _FormFabricanteState createState() => _FormFabricanteState();
}

class _FormFabricanteState extends State<FormFabricante> {
  final _formKey = GlobalKey<FormState>();

  // Campos do formulário
  int? id;
  String nome = '';
  String descricao = '';
  String nomeContatoPrincipal = '';
  String emailContato = '';
  String telefoneContato = '';
  bool ativo = true;

  // DTO para armazenar o resultado
  FabricanteDto? fabricanteDto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Fabricante'),
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

              // Descrição
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => descricao = value!.trim(),
              ),
              const SizedBox(height: 16),

              // Nome Contato Principal
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome do Contato Principal',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().length < 3) {
                    return 'Informe um nome de contato com pelo menos 3 letras';
                  }
                  return null;
                },
                onSaved: (value) => nomeContatoPrincipal = value!.trim(),
              ),
              const SizedBox(height: 16),

              // Email Contato
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email de Contato',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o email de contato';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                      .hasMatch(value.trim())) {
                    return 'Informe um email válido';
                  }
                  return null;
                },
                onSaved: (value) => emailContato = value!.trim(),
              ),
              const SizedBox(height: 16),

              // Telefone Contato
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Telefone de Contato',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  PhoneInputFormatter(defaultCountryCode: 'BR')
                ],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o telefone de contato';
                  }
                  if (value.replaceAll(RegExp(r'\D'), '').length < 10) {
                    return 'Telefone inválido';
                  }
                  return null;
                },
                onSaved: (value) => telefoneContato = value!.trim(),
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

      fabricanteDto = FabricanteDto(
        id: id,
        nome: nome,
        descricao: descricao,
        nomeContatoPrincipal: nomeContatoPrincipal,
        emailContato: emailContato,
        telefoneContato: telefoneContato,
        ativo: ativo,
      );
      debugPrint('FabricanteDto gerado:');
      debugPrint(fabricanteDto!.toJson().toString());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fabricante salvo com sucesso!')),
      );
    }
  }
}
