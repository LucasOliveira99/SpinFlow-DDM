import 'package:flutter/material.dart';

class TelaDashboard extends StatefulWidget {
  const TelaDashboard({Key? key}) : super(key: key);

  @override
  _TelaDashboardState createState() => _TelaDashboardState();
}

class _TelaDashboardState extends State<TelaDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel da Professora'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Visão Geral'),
            Tab(text: 'Cadastros'),
            Tab(text: 'Aulas'),
            Tab(text: 'Manutenção'),
            Tab(text: 'Recados'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _visaoGeral(),
          _cadastros(),
          _aulasEAuloes(),
          _manutencao(),
          _recados(),
        ],
      ),
    );
  }

  Widget _visaoGeral() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _infoCard(Icons.message, '3', 'Recados'),
          _infoCard(Icons.person, '82', 'Alunos Ativos'),
          _infoCard(Icons.schedule, '12', 'Aulas Agendadas'),
          _infoCard(Icons.music_note, '4', 'Mix de Músicas'),
          _infoCard(Icons.directions_bike, '18', 'Bikes OK'),
        ],
      ),
    );
  }

  Widget _infoCard(IconData icon, String value, String title) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).primaryColor),
            const SizedBox(height: 12),
            Text(value,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _cadastros() {
    final List<Map<String, String>> cadastros = [
      {'label': 'Vídeo Aula', 'route': '/videoaula/form'},
      {'label': 'Aluno', 'route': '/aluno/form'},
      {'label': 'Fabricante', 'route': '/fabricante/form'},
      {'label': 'Sala', 'route': '/sala/form'},
      {'label': 'Tipo Manutenção', 'route': '/tipomanutencao/form'},
      {'label': 'Categoria Música', 'route': ''},
      {'label': 'Banda Artista', 'route': ''},
      {'label': 'Turma', 'route': ''},
      {'label': 'Bike', 'route': ''},
      {'label': 'Música', 'route': ''},
      {'label': 'Mix Aula (Playlist)', 'route': ''},
      {'label': 'Grupo Aluno', 'route': ''},
    ];

    return ListView.builder(
      itemCount: cadastros.length,
      itemBuilder: (context, index) {
        return _cadastroTile(
            cadastros[index]['label']!, cadastros[index]['route']!);
      },
    );
  }

  Widget _cadastroTile(String label, String route) {
    return ListTile(
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        if (route.isNotEmpty) {
          Navigator.pushNamed(context, route);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Rota para "$label" ainda não definida.')),
          );
        }
      },
    );
  }

  Widget _aulasEAuloes() {
    return ListView(
      children: [
        _cadastroTile('Gerenciar Aulas', ''),
        _cadastroTile('Agendar Aulões', ''),
      ],
    );
  }

  Widget _manutencao() {
    return ListView(
      children: [
        _cadastroTile('Relatar Problema', ''),
        _cadastroTile('Histórico de Manutenção', ''),
      ],
    );
  }

  Widget _recados() {
    return ListView(
      children: [
        _cadastroTile('Criar Recado', ''),
        _cadastroTile('Ver Recados', ''),
      ],
    );
  }
}
