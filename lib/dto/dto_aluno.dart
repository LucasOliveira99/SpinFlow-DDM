class AlunoDto {
  int? id;
  String nome;
  String email;
  DateTime? dataNascimento;
  String genero;
  String telefoneContato;
  String perfilInstagram;
  String perfilFacebook;
  String perfilTiktok;
  bool ativo;

  AlunoDto({
    this.id,
    required this.nome,
    required this.email,
    this.dataNascimento,
    required this.genero,
    required this.telefoneContato,
    required this.perfilInstagram,
    required this.perfilFacebook,
    required this.perfilTiktok,
    required this.ativo,
  });

  // Construtor a partir de JSON
  factory AlunoDto.fromJson(Map<String, dynamic> json) {
    return AlunoDto(
      id: json['id'],
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      dataNascimento: json['data_nascimento'] != null
          ? DateTime.parse(json['data_nascimento'])
          : null,
      genero: json['genero'] ?? '',
      telefoneContato: json['telefone_contato'] ?? '',
      perfilInstagram: json['perfil_instagram'] ?? '',
      perfilFacebook: json['perfil_facebook'] ?? '',
      perfilTiktok: json['perfil_tiktok'] ?? '',
      ativo: json['ativo'] ?? false,
    );
  }

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'data_nascimento':
          dataNascimento != null ? dataNascimento!.toIso8601String() : null,
      'genero': genero,
      'telefone_contato': telefoneContato,
      'perfil_instagram': perfilInstagram,
      'perfil_facebook': perfilFacebook,
      'perfil_tiktok': perfilTiktok,
      'ativo': ativo,
    };
  }
}
