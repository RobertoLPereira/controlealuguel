class DashboardPiza {
  int ativos;
  dynamic valortotalcontrato;
  int inativos;
  dynamic vencidos;
  dynamic pagosematraso;
  dynamic pagosnovencimento;
  dynamic emdia;

  DashboardPiza(
      {this.ativos,
      this.valortotalcontrato,
      this.inativos,
      this.vencidos,
      this.pagosematraso,
      this.pagosnovencimento,
      this.emdia});
/*
  DashboardPiza.fromJson(Map<String, dynamic> json) {
    ativos = json['ativos'];
    valortotalcontrato = json['valortotalcontrato'];
    inativos = json['inativos'];
    vencidos = json['vencidos'];
    pagosematraso = json['pagosematraso'];
    pagosnovencimento = json['pagosnovencimento'];
    emdia = json['emdia'];
  }
*/
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ativos'] = this.ativos;
    data['valortotalcontrato'] = this.valortotalcontrato;
    data['inativos'] = this.inativos;
    data['vencidos'] = this.vencidos;
    data['pagosematraso'] = this.pagosematraso;
    data['pagosnovencimento'] = this.pagosnovencimento;
    data['emdia'] = this.emdia;
    return data;
  }

  factory DashboardPiza.toMap(Map<String, dynamic> map) {
    return DashboardPiza(
        ativos: map['ativos'],
        valortotalcontrato: map['valortotalcontrato'],
        inativos: map['inativos'],
        vencidos: map['vencidos'],
        pagosematraso: map['pagosematraso'],
        pagosnovencimento: map['pagosnovencimento'],
        emdia: map['emdia']);
  }
}
