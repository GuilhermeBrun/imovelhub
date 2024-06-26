class Property {
  final String codigo;
  final String proprietario;
  final String tipo;
  final String inscricao;
  final String endereco;

  Property({
    required this.codigo,
    required this.proprietario,
    required this.tipo,
    required this.inscricao,
    required this.endereco,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      codigo: json['codigo'],
      proprietario: json['proprietario'],
      tipo: json['tipo'],
      inscricao: json['inscricao'],
      endereco: json['endereco'],
    );
  }
}
