import 'package:flutter/material.dart';
import 'package:flutter_application_1/dto/dto_tipo_manutencao.dart';
import 'package:flutter_application_1/dto/dto_tipo_manutencao.dart';

class FormTipoManutencao extends StatefulWidget {
  const FormTipoManutencao({Key? key}) : super(key: key);

  @override
  _FormTipoManutencaoState createState() => _FormTipoManutencaoState();
}

class _FormTipoManutencaoState extends State<FormTipoManutencao> {
  final _formKey = GlobalKey<FormState>();

  // Campos do formulário
  int? id;
  String nome = '';
  String descricao = '';
  bool ativo = true;

  // DTO para armazenar o resultado
  TipoManutencaoDto? tipoManutencaoDto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Tipo de Manutenção'),
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

      // Instanciar o DTO
      tipoManutencaoDto = TipoManutencaoDto(
        id: id,
        nome: nome,
        descricao: descricao,
        ativo: ativo,
      );

      // Exemplo: você agora tem o DTO pronto para usar
      debugPrint('TipoManutencaoDto gerado:');
      debugPrint(tipoManutencaoDto!.toJson().toString());

      // Exemplo: poderia chamar service
      // await TipoManutencaoService.salvar(tipoManutencaoDto!);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tipo de Manutenção salvo com sucesso!')),
      );
    }
  }
}