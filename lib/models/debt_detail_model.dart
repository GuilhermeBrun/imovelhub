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
  final bool vencido;

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
    required this.vencido,
  });

  factory DebtDetail.fromJson(Map<String, dynamic> json) {
    return DebtDetail(
      tributo: json['tributo'] ?? '',
      divida: json['divida'] ?? '',
      pc: json['pc'] ?? '',
      pl: json['pl'] ?? '',
      mes: json['mes'] ?? '',
      ano: json['ano'] ?? '',
      vencimento: json['vencimento'] ?? '',
      principal: json['principal'] ?? '',
      total: json['total'] ?? '',
      vencido: json['vencido'] ?? false,
    );
  }
}

class PropertyDebt {
  final String inscricao;
  final String total;
  final String qtd;
  final List<DebtDetail> parcelas;
  DebtDetail? closestParcel;

  PropertyDebt({
    required this.inscricao,
    required this.total,
    required this.qtd,
    required this.parcelas,
    this.closestParcel,
  });

  factory PropertyDebt.fromJson(Map<String, dynamic> json) {
    return PropertyDebt(
      inscricao: json['inscricao'],
      total: json['total'],
      qtd: json['qtd'],
      parcelas: (json['parcelas'] as List<dynamic>)
          .map((parcel) => DebtDetail.fromJson(parcel))
          .toList(),
    );
  }
}
