import 'dart:convert';

import 'package:controlealuguel/src/models/apoio/gera_mvc_flutter.dart';
import 'package:controlealuguel/src/utils/vw_gera_mvc.dart';
import 'package:http/http.dart' as http;

class GeraMvcFlutterApi {
  final uriREST = Uri.parse(
      'https://apialugueis.herokuapp.com/Consultar/$gera_mvc_flutter' +
          'imovel');
  var entidade;
  Future<String> find() async {
    var resposta = await http.get(uriREST);
    if (resposta.statusCode != 200) throw Exception('Erro REST API.');
    //print(resposta.body);
    Iterable listDart = json.decode(resposta.body);
    var listImovelunidade = List<GeraMvcFlutter>.from(
        listDart.map((modelo) => GeraMvcFlutter(model: modelo['model'])));
    print(listImovelunidade);

    return ' ';
  }
}
/*        if (modelo.model.contains('%type%' ) { 
	  	   

      	wmap := wmap || '''' || modelo.column_name || ''':' || modelo.column_name || ',' || chr(13);
      	wfactory:= wfactory || modelo.column_name || ':' || 'map[''' || modelo.column_name || '''],' || chr(13);
      	wtostring:= wtostring || modelo.column_name || ':' || '$' || modelo.column_name || ',';
      	
        definicao := definicao || replace( modelo.data_type,'CHARACTER VARYING','String? ') || ' '|| modelo.column_name|| ';' || chr(13);		 
		construtor := construtor || 'this.' || modelo.column_name || ',';
		wvalues := wvalues || 'wtb.' || modelo.column_name || ',';
		winsert := winsert || modelo.column_name || ',';
		winsertvalues := winsertvalues || '?,';
		wupdate := wupdate || modelo.column_name || ' = ?,';
		campos:= campos || 'field' || INITCAP(modelo.column_name) || '(_back),'|| chr(13);
		bolcampos:= bolcampos || 'bool _'|| modelo.column_name || 'IsValid; ' || chr(13);
  		getcampos:= getcampos || ' _'||modelo.column_name || 'IsValid &&';
		camposbackDetalhes:= camposbackDetalhes || 'launch'|| INITCAP(modelo.column_name) || '(Function(BuildContext context) showModalError){
				_launchApp('''|| modelo.column_name ||':${wtb.'||modelo.column_name ||'}'', showModalError);
			  }' || chr(13);
		witerator:= witerator || modelo.column_name ||':  wtb[''' || modelo.column_name ||'''],';
		xiterator:= xiterator || '''' || modelo.column_name || '''' || ':  wtb.' || modelo.column_name ||',';
            	IF modelo.constraint_name LIKE '%pkey%' THEN
            		validar:= validar || chr(13) || ' validate'|| INITCAP(modelo.column_name) || '(String? '||modelo.column_name || '){'||chr(13);
            		validar:= validar || chr(13) || 'if('||modelo.column_name||' == null){
				throw new DomainLayerException(''O '||modelo.column_name||' é obrigatório.'');
				} }';
			chamaApi:= replace(chamaApi,'wchave',modelo.column_name);
			chamavalidar:= chamavalidar || chr(13) || ' validate'|| INITCAP(modelo.column_name) || '(wtb.'||modelo.column_name || ');'||chr(13);
            	ELSE
            		validar:= validar || chr(13) || '//'|| modelo.column_name || ' ? seja obrigat�rio, tenha no m�nimo 3 caracteres e no m�ximo 50 ';
					validar:= validar || chr(13) || ' validate'|| INITCAP(modelo.column_name) || '(String? '||modelo.column_name || '){'||chr(13);
					validar:= validar || chr(13) || ' 	  var min = 3;'; 
					validar:= validar || chr(13) || ' 	  var max = 50;'; 
					validar:= validar || chr(13) || 'if('||modelo.column_name||' == null){
				throw new DomainLayerException(''O '||modelo.column_name||' � obrigat�rio.'');
			  }else if('||modelo.column_name||'.length < min){
				throw new DomainLayerException(''O '||modelo.column_name||' deve possuir pelo menos $min caracteres.'');
			  }else if('||modelo.column_name||'.length > max){
				throw new DomainLayerException(''O '||modelo.column_name||' deve possuir no m�ximo $max caracteres.'');
			  }
			} ';
			chamavalidar:= chamavalidar || chr(13) || ' validate'|| INITCAP(modelo.column_name) || '(wtb.'||modelo.column_name || ');'||chr(13);
            	END IF;
		
		validacoes:= validacoes || INITCAP(modelo.data_type) || ' validate'|| INITCAP(modelo.column_name) || '(' || INITCAP(modelo.data_type) || ' '|| modelo.column_name ||' ){
			try{
			  _service.validate'||INITCAP(modelo.column_name) ||' ('||modelo.column_name||');' || chr(13) || '
			  _'||modelo.column_name||'IsValid = true;
			  return null;
			}catch(e){
			  _'||modelo.column_name||'IsValid = false;
			  return e.toString();
			}
		  }
		';
		IF modelo.constraint_name LIKE '%pkey%' THEN 
			daoImpl:= replace(daoImpl,'wchave',modelo.column_name);
			daoImpl:= replace(daoImpl,'wtb',wtable);
			daoImpl:= replace(daoImpl,'xtb',INITCAP(wtable));
		END IF;
		widgetCampo := widgetCampo  || 'Widget field' || INITCAP(modelo.column_name) ||'(' ||INITCAP(wtable) || 'FormBack back) {';
		 IF modelo.column_name LIKE '%fone%' THEN 
				widgetCampo := widgetCampo || 'var mask = MaskTextInputFormatter(mask: ''(##) # ####-####'');' || chr(13);
		END IF;
		
		widgetCampo := widgetCampo || 'return TextFormField (  
		  validator: back.validate'|| INITCAP(modelo.column_name)||',
		  onSaved: (newValue) => back.' || wtable ||'!.' ||modelo.column_name||' = newValue,
		  initialValue: back.' || wtable || '!.'|| modelo.column_name||',';
		
		IF modelo.column_name LIKE '%fone%' THEN 				  
			widgetCampo := widgetCampo || 'inputFormatters: [mask],'||chr(13);
		END IF;
		IF modelo.column_name LIKE '%fone%' THEN 				  
			widgetCampo := widgetCampo || '		  keyboardType: TextInputType.number,' || chr(13);
		END IF;
		widgetCampo := widgetCampo || '		  decoration: InputDecoration ( 
					labelText: '''|| modelo.column_name||':'',' || CHR(13); 
		IF modelo.column_name LIKE '%fone%' THEN 				  
			widgetCampo := widgetCampo || '			hintText: ''(99) 9 9999-9999''';
		END IF;
		widgetCampo := widgetCampo || '
				  )
				);
			  }
			';
      END IF;
	  IF qtd = 0 THEN
	  	 telaListaf:= telaListaf || 'trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton((){
                                _back.goToForm(context, wtb);
                              }),
                              iconRemoveButton(context, (){
                                _back.remove(wtb.'|| modelo.column_name ||');
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
';
	  END IF;
	  IF qtd = 1 THEN
	  	telaLista:= telaLista || 'title: Text(''$wtb.'|| modelo.column_name ||'''),
                        onTap: (){
                          _back.goToDetails(context, wtb);
                        },';
	  END IF;
	   IF qtd = 2 THEN
	   	telaLista:= telaLista || 'subtitle: Text(
		 ''$wtb.'||modelo.column_name||'''),';
	   END IF;
	   qtd:=qtd + 1;
   };
*/