class FabricanteDto {
  int? id;
  String nome;
  String descricao;
  String nomeContatoPrincipal;
  String emailContato;
  String telefoneContato;
  bool ativo;

  FabricanteDto({
    this.id,
    required this.nome,
    required this.descricao,
    required this.nomeContatoPrincipal,
    required this.emailContato,
    required this.telefoneContato,
    required this.ativo,
  });

  // Construtor a partir de JSON
  factory FabricanteDto.fromJson(Map<String, dynamic> json) {
    return FabricanteDto(
      id: json['id'],
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
      nomeContatoPrincipal: json['nome_contato_principal'] ?? '',
      emailContato: json['email_contato'] ?? '',
      telefoneContato: json['telefone_contato'] ?? '',
      ativo: json['ativo'] ?? false,
    );
  }

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'nome_contato_principal': nomeContatoPrincipal,
      'email_contato': emailContato,
      'telefone_contato': telefoneContato,
      'ativo': ativo,
    };
  }
}