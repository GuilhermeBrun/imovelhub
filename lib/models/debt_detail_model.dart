class DebtDetail {
  final String tributo;
  final String divida;
  final String pc;
  final String pl;
  final String mes;
  final String ano;
  final String vencimento;
  final String principal;
  final String total;

  DebtDetail({
    required this.tributo,
    required this.divida,
    required this.pc,
    required this.pl,
    required this.mes,
    required this.ano,
    required this.vencimento,
    required this.principal,
    required this.total,
  });

  factory DebtDetail.fromJson(Map<String, dynamic> json) {
    return DebtDetail(
      tributo: json['tributo'],
      divida: json['divida'],
      pc: json['pc'],
      pl: json['pl'],
      mes: json['mes'],
      ano: json['ano'],
      vencimento: json['vencimento'],
      principal: json['principal'],
      total: json['total'],
    );
  }
}
