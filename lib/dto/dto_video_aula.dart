class VideoAulaDto {
  int? id;
  String nome;
  String linkVideo;
  bool ativo;

  VideoAulaDto({
    this.id,
    required this.nome,
    required this.linkVideo,
    required this.ativo,
  });

  // Construtor para criar a partir de um JSON
  factory VideoAulaDto.fromJson(Map<String, dynamic> json) {
    return VideoAulaDto(
      id: json['id'],
      nome: json['nome'] ?? '',
      linkVideo: json['link_video'] ?? '',
      ativo: json['ativo'] ?? false,
    );
  }

  // Método para converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'link_video': linkVideo,
      'ativo': ativo,
    };
  }
}
