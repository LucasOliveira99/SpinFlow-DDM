import 'package:flutter/material.dart';

class FormVideoAula extends StatefulWidget {
  const FormVideoAula({Key? key}) : super(key: key);

  @override
  _FormVideoAulaState createState() => _FormVideoAulaState();
}

class _FormVideoAulaState extends State<FormVideoAula> {
  final _formKey = GlobalKey<FormState>();

  // Campos do formulário
  int? id; // Campo oculto, controlado pela lógica da aplicação
  String nome = '';
  String linkVideo = '';
  bool ativo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Video Aula'),
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

              // Link do vídeo
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Link do Vídeo',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o link do vídeo';
                  }

                  final uri = Uri.tryParse(value.trim());
                  if (uri == null || !uri.hasAbsolutePath) {
                    return 'Informe um link válido';
                  }

                  return null;
                },
                onSaved: (value) => linkVideo = value!.trim(),
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

      debugPrint('Video Aula salva:');
      debugPrint('ID: $id');
      debugPrint('Nome: $nome');
      debugPrint('Link do vídeo: $linkVideo');
      debugPrint('Ativo: $ativo');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vídeo Aula salva com sucesso!')),
      );
    }
  }
}
