Map<String, int> unity = Map.from({'Un': 0, 'Kg': 3});

String dbName = 'rentadm.db';
int dbVersion = 1;

List<String> dbCreate = [
  //Centro de custo
  """CREATE TABLE centrocusto (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idtaxaadm integer,
    idpagamento integer,
    valor real
)""",
//Categoria de Imoveis
  """CREATE TABLE categoriadeimoveis
(
    idcategoriadeimoveis integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    denominacao TEXT
)
""",
  //Contrato
  """CREATE TABLE contrato
(
    idcontrato INTEGER PRIMARY KEY AUTOINCREMENT,
    idunidadeimovel integer,
    idlocador integer,
    idlocatario integer,
    diavencimento numeric,
    datacontrato numeric,
    status integer,
    validadecontrato numeric,
    valor real
)""",
//Faixa de consumo
  """CREATE TABLE faixadeconsumo
(
    idfaixadeconsumo integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    denominacao TEXT NOT NULL,
    faixainicial integer NOT NULL,
    faixafinal integer NOT NULL,
    tarifaagua numeric,
    tarifaesgoto numeric,
    "tfdi" numeric,
    idcategoriadeimoveis integer
)""",
//Imoveis
  """CREATE TABLE imovel
(
    idimovel INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao TEXT,
    endereco TEXT,
    idproprietario integer,
    status integer
)
""",
//Unidades do Imovel
  """CREATE TABLE imovelunidade
(
    idunidade INTEGER PRIMARY KEY AUTOINCREMENT,
    idimovel integer,
    idlocatario integer,
    descricao text,
    status integer,
    idimovelcategoria integer
)
""",
//Leitura de consumo de Agua
  """CREATE TABLE leituraaguaunidade
(
    idleituraaguaunidade integer NOT NULL  PRIMARY KEY AUTOINCREMENT,
    idunidadeimovel integer,
    leituraanterior numeric,
    leituraatual numeric,
    codigomedidor integer,
    dataleitura numeric,
    status integer DEFAULT 1
)
""",
//Leitura de consumo de Energia
  """CREATE TABLE leituraluzunidade
(
    idleituraluzunidade integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    idunidadeimovel integer,
    leituraanterior numeric,
    leituraatual numeric,
    codigomedidor integer,
    dataleitura numeric,
    status integer DEFAULT 1
)
""",
//Natureza do Relacionamento
  """CREATE TABLE naturezarelacionamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    denominacao text
)""",
  // Pagamentos
  """CREATE TABLE pagamentos
(
    idpagamento INTEGER PRIMARY KEY AUTOINCREMENT,
     idcontrato integer,
    datapagamento numeric,
    valorpago real,
    juros real,
    desconto real
)
""",

  // Pessoas
  """CREATE TABLE pessoas
(
    idpessoa INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    telefone TEXT,
    proprietario numeric,
    cadastradoem numeric,
    status integer
)""",
//Status
  """CREATE TABLE status (
    idstatus integer PRIMARY KEY AUTOINCREMENT,
    denominacao text
)""",
//Taxa de administracao
  """CREATE TABLE taxaadministracao (
    id integer PRIMARY KEY AUTOINCREMENT,
    idfavorecido integer,
    idcontrato integer,
    taxa real,
    valor real,    
    situacao integer
)""",
//Vinculos
  """CREATE TABLE vinculos (
    idvinculo integer PRIMARY KEY AUTOINCREMENT,
    idnaturezarelac integer,
    idpessoa integer ,
    inicio numeric,
    fim numeric,
    idimovel integer
)""",
];
