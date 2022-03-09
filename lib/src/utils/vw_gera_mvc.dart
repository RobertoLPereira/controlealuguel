const String gera_mvc_flutter = """SELECT atr.table_name,
					atr.column_name,
					atr.is_nullable,
					atr.data_type,
					atr.character_maximum_length,
					k.constraint_name,
					
        CASE
            WHEN k.constraint_name IS NULL THEN concat(atr.column_name, ':{type:DataType.', upper(atr.data_type::text), '},')
            ELSE concat(atr.column_name, ':{type:DataType.', upper(atr.data_type::text), ',primaryKey: true,autoIncrement: true},')
        END AS model,
    atr.column_name AS descricao
   FROM information_schema.columns as atr
     LEFT JOIN information_schema.key_column_usage as  k ON k.column_name::name = atr.column_name::name 
	 AND k.table_name::name = atr.table_name::name
	 where atr.table_name =""";
