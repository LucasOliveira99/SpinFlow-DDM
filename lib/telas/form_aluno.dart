import 'package:flutter/material.dart';
import 'package:flutter_application_1/dto/dto_aluno.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class FormAluno extends StatefulWidget {
  const FormAluno({Key? key}) : super(key: key);

  @override
  _FormAlunoState createState() => _FormAlunoState();
}

class _FormAlunoState extends State<FormAluno> {
  final _formKey = GlobalKey<FormState>();

  // Campos do formulário
  int? id;
  String nome = '';
  String email = '';
  DateTime? dataNascimento;
  String genero = '';
  String telefoneContato = '';
  String perfilInstagram = '';
  String perfilFacebook = '';
  String perfilTiktok = '';
  bool ativo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Aluno'),
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

              // Email
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                      .hasMatch(value)) {
                    return 'Informe um email válido';
                  }
                  return null;
                },
                onSaved: (value) => email = value!.trim(),
              ),
              const SizedBox(height: 16),

              // Data Nascimento
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.red),
                ),
                child: ListTile(
                  title: Text(
                    dataNascimento != null
                        ? '${dataNascimento!.day}/${dataNascimento!.month}/${dataNascimento!.year}'
                        : 'Selecione a data',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: _selecionarDataNascimento,
                ),
              ),
              if (dataNascimento == null)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 12),
                  child: Text(
                    'Data de nascimento obrigatória',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 16),

              // Genero
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Gênero',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o gênero';
                  }
                  return null;
                },
                onSaved: (value) => genero = value!.trim(),
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
                  if (value == null || value.isEmpty) {
                    return 'Informe o telefone';
                  }
                  if (value.replaceAll(RegExp(r'\D'), '').length < 10) {
                    return 'Telefone inválido';
                  }
                  return null;
                },
                onSaved: (value) => telefoneContato = value!.trim(),
              ),
              const SizedBox(height: 16),

              // Perfil Instagram
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Perfil Instagram',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => perfilInstagram = value!.trim(),
              ),
              const SizedBox(height: 16),

              // Perfil Facebook
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Perfil Facebook',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => perfilFacebook = value!.trim(),
              ),
              const SizedBox(height: 16),

              // Perfil TikTok
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Perfil TikTok',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => perfilTiktok = value!.trim(),
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

  void _selecionarDataNascimento() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dataNascimento ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dataNascimento = picked;
      });
    }
  }

  void _salvarFormulario() {
    // Validação extra da data
    bool dataValida = dataNascimento != null;

    if (_formKey.currentState!.validate() && dataValida) {
      _formKey.currentState!.save();

      // Instanciar o DTO
      final alunoDto = AlunoDto(
        id: id,
        nome: nome,
        email: email,
        dataNascimento: dataNascimento,
        genero: genero,
        telefoneContato: telefoneContato,
        perfilInstagram: perfilInstagram,
        perfilFacebook: perfilFacebook,
        perfilTiktok: perfilTiktok,
        ativo: ativo,
      );

      // Aqui você poderia chamar um service, exemplo:
      // await AlunoService.salvar(alunoDto);

      // Por enquanto, só um debugPrint:
      debugPrint('AlunoDto para salvar:');
      debugPrint(alunoDto.toJson().toString());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aluno salvo com sucesso!')),
      );
    } else if (!dataValida) {
      setState(() {}); // Atualiza a tela para mostrar erro de data
    }
  }
}
