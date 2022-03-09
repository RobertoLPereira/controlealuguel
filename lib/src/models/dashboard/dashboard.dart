class DashBoard {
  List<Imoveis> imoveis;
  List<Contratos> contratos;
  List<Alugueisemdia> alugueisemdia;
  List<Alugueisvencidos> alugueisvencidos;
  List<Pagoscomatraso> pagoscomatraso;
  List<Pagosemdia> pagosemdia;
  List<Quantidadeimoveis> quantidadeimoveis;

  DashBoard(
      {this.imoveis,
      this.contratos,
      this.alugueisemdia,
      this.alugueisvencidos,
      this.pagoscomatraso,
      this.pagosemdia,
      this.quantidadeimoveis});

  factory DashBoard.toMap(Map<String, dynamic> map) {
    return DashBoard(
        imoveis: map['imoveis'],
        contratos: map['contratos'],
        alugueisemdia: map['alugueisemdia'],
        alugueisvencidos: map['alugueisvencidos'],
        pagoscomatraso: map['pagoscomatraso'],
        pagosemdia: map['pagosemdia'],
        quantidadeimoveis: map['quantidadeimoveis']);
  }

  DashBoard.fromJson(Map<String, dynamic> json) {
    if (json['imoveis'] != null) {
      imoveis = <Imoveis>[];
      json['imoveis'].forEach((v) {
        imoveis.add(new Imoveis.fromJson(v));
      });
    }
    if (json['contratos'] != null) {
      contratos = <Contratos>[];
      json['contratos'].forEach((v) {
        contratos.add(new Contratos.fromJson(v));
      });
    }
    if (json['alugueisemdia'] != null) {
      alugueisemdia = <Alugueisemdia>[];
      json['alugueisemdia'].forEach((v) {
        alugueisemdia.add(new Alugueisemdia.fromJson(v));
      });
    }
    if (json['alugueisvencidos'] != null) {
      alugueisvencidos = <Alugueisvencidos>[];
      json['alugueisvencidos'].forEach((v) {
        alugueisvencidos.add(new Alugueisvencidos.fromJson(v));
      });
    }
    if (json['pagoscomatraso'] != null) {
      pagoscomatraso = <Pagoscomatraso>[];
      json['pagoscomatraso'].forEach((v) {
        pagoscomatraso.add(new Pagoscomatraso.fromJson(v));
      });
    }
    if (json['pagosemdia'] != null) {
      pagosemdia = <Pagosemdia>[];
      json['pagosemdia'].forEach((v) {
        pagosemdia.add(new Pagosemdia.fromJson(v));
      });
    }
    if (json['quantidadeimoveis'] != null) {
      quantidadeimoveis = <Quantidadeimoveis>[];
      json['quantidadeimoveis'].forEach((v) {
        quantidadeimoveis.add(new Quantidadeimoveis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imoveis != null) {
      data['Imoveis'] = this.imoveis.map((v) => v.toJson()).toList();
    }
    if (this.contratos != null) {
      data['contratos'] = this.contratos.map((v) => v.toJson()).toList();
    }
    if (this.alugueisemdia != null) {
      data['alugueisemdia'] =
          this.alugueisemdia.map((v) => v.toJson()).toList();
    }
    if (this.alugueisvencidos != null) {
      data['alugueisvencidos'] =
          this.alugueisvencidos.map((v) => v.toJson()).toList();
    }
    if (this.pagoscomatraso != null) {
      data['pagoscomatraso'] =
          this.pagoscomatraso.map((v) => v.toJson()).toList();
    }
    // ignore: unnecessary_null_comparison
    if (this.pagosemdia != null) {
      data['pagosemdia'] = this.pagosemdia.map((v) => v.toJson()).toList();
    }
    if (this.quantidadeimoveis != null) {
      data['quantidadeimoveis'] =
          this.quantidadeimoveis.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Imoveis {
  int idimovel;
  String descricao;
  String unidades;

  Imoveis({this.idimovel, this.descricao, this.unidades});

  Imoveis.fromJson(Map<String, dynamic> json) {
    idimovel = json['idimovel'];
    descricao = json['descricao'];
    unidades = json['unidades'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idimovel'] = this.idimovel;
    data['descricao'] = this.descricao;
    data['unidades'] = this.unidades;
    return data;
  }

  factory Imoveis.toMap(Map<String, dynamic> map) {
    return Imoveis(
        idimovel: map['idimovel'] as int,
        descricao: map['descricao'],
        unidades: map['unidades']);
  }
}

class Contratos {
  String ativos;
  double sum;
  String inativos;

  Contratos({this.ativos, this.sum, this.inativos});

  Contratos.fromJson(Map<String, dynamic> json) {
    ativos = json['ativos'];
    sum = json['sum'];
    inativos = json['inativos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ativos'] = this.ativos;
    data['sum'] = this.sum;
    data['inativos'] = this.inativos;
    return data;
  }

  factory Contratos.toMap(Map<String, dynamic> map) {
    return Contratos(
        ativos: map['ativos'],
        inativos: map['inativos'],
        sum: map['sum'] as double);
  }
}

class Alugueisemdia {
  String emdia;
  double sum;

  Alugueisemdia({this.emdia, this.sum});

  Alugueisemdia.fromJson(Map<String, dynamic> json) {
    emdia = json['emdia'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emdia'] = this.emdia;
    data['sum'] = this.sum;
    return data;
  }

  factory Alugueisemdia.toMap(Map<String, dynamic> map) {
    return Alugueisemdia(emdia: map['emdia'], sum: map['sum'] as double);
  }
}

class Alugueisvencidos {
  String vencidos;
  double sum;

  Alugueisvencidos({this.vencidos, this.sum});

  Alugueisvencidos.fromJson(Map<String, dynamic> json) {
    vencidos = json['vencidos'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vencidos'] = this.vencidos;
    data['sum'] = this.sum;
    return data;
  }

  factory Alugueisvencidos.toMap(Map<String, dynamic> map) {
    return Alugueisvencidos(
        vencidos: map['vencidos'], sum: map['sum'] as double);
  }
}

class Pagoscomatraso {
  String pagosematraso;

  Pagoscomatraso({this.pagosematraso});

  Pagoscomatraso.fromJson(Map<String, dynamic> json) {
    pagosematraso = json['pagosematraso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pagosematraso'] = this.pagosematraso;
    return data;
  }

  factory Pagoscomatraso.toMap(Map<String, dynamic> map) {
    return Pagoscomatraso(pagosematraso: map['pagosematraso']);
  }
}

class Pagosemdia {
  String pagosemdia;
  double sum;

  Pagosemdia({this.pagosemdia, this.sum});

  Pagosemdia.fromJson(Map<String, dynamic> json) {
    pagosemdia = json['pagosemdia'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pagosemdia'] = this.pagosemdia;
    data['sum'] = this.sum;
    return data;
  }

  factory Pagosemdia.toMap(Map<String, dynamic> map) {
    return Pagosemdia(pagosemdia: map['pagosemdia'], sum: map['sum'] as double);
  }
}

class Quantidadeimoveis {
  int idimovel;
  String descricao;
  String unidades;

  Quantidadeimoveis({this.idimovel, this.descricao, this.unidades});

  Quantidadeimoveis.fromJson(Map<String, dynamic> json) {
    idimovel = json['idimovel'];
    descricao = json['descricao'];
    unidades = json['unidades'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idimovel'] = this.idimovel;
    data['descricao'] = this.descricao;
    data['unidades'] = this.unidades;
    return data;
  }

  factory Quantidadeimoveis.toMap(Map<String, dynamic> map) {
    return Quantidadeimoveis(
        idimovel: map['idimovel'] as int,
        descricao: map['descricao'],
        unidades: map['unidades']);
  }
}
