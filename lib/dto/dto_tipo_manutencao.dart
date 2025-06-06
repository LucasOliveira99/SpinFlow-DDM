class TipoManutencaoDto {
  int? id;
  String nome;
  String descricao;
  bool ativo;

  TipoManutencaoDto({
    this.id,
    required this.nome,
    required this.descricao,
    required this.ativo,
  });

  // Construtor a partir de JSON
  factory TipoManutencaoDto.fromJson(Map<String, dynamic> json) {
    return TipoManutencaoDto(
      id: json['id'],
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
      ativo: json['ativo'] ?? false,
    );
  }

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'ativo': ativo,
    };
  }
}
