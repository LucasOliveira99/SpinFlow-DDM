class SalaDto {
  int? id;
  String nome;
  int capacidadeTotalBikes;
  int numeroFilas;
  int numeroBikesPorFila;
  bool ativo;

  SalaDto({
    this.id,
    required this.nome,
    required this.capacidadeTotalBikes,
    required this.numeroFilas,
    required this.numeroBikesPorFila,
    required this.ativo,
  });

  // Construtor a partir de JSON
  factory SalaDto.fromJson(Map<String, dynamic> json) {
    return SalaDto(
      id: json['id'],
      nome: json['nome'] ?? '',
      capacidadeTotalBikes: json['capacidade_total_bikes'] ?? 0,
      numeroFilas: json['numero_filas'] ?? 0,
      numeroBikesPorFila: json['numero_bikes_por_fila'] ?? 0,
      ativo: json['ativo'] ?? false,
    );
  }

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'capacidade_total_bikes': capacidadeTotalBikes,
      'numero_filas': numeroFilas,
      'numero_bikes_por_fila': numeroBikesPorFila,
      'ativo': ativo,
    };
  }
}