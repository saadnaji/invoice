note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

deferred class EVT_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_integer_value: INTEGER
	last_real_value: REAL
	last_string_value: STRING

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when NUMBER then
				Result := "NUMBER"
			when REAL then
				Result := "REAL"
			when IDENT then
				Result := "IDENT"
			when CHAR_LIT then
				Result := "CHAR_LIT"
			when STR_LIT then
				Result := "STR_LIT"
			when TK_SYSTEM then
				Result := "TK_SYSTEM"
			when TK_BOOL then
				Result := "TK_BOOL"
			when TK_CHAR then
				Result := "TK_CHAR"
			when TK_INT then
				Result := "TK_INT"
			when TK_REAL then
				Result := "TK_REAL"
			when TK_STR then
				Result := "TK_STR"
			when TK_TUPLE then
				Result := "TK_TUPLE"
			when TK_ARRAY then
				Result := "TK_ARRAY"
			when TK_TRUE then
				Result := "TK_TRUE"
			when TK_FALSE then
				Result := "TK_FALSE"
			when TK_TRUE_LOWER then
				Result := "TK_TRUE_LOWER"
			when TK_FALSE_LOWER then
				Result := "TK_FALSE_LOWER"
			when TK_COMMA then
				Result := "TK_COMMA"
			when TK_COLON then
				Result := "TK_COLON"
			when TK_SEMI_COLON then
				Result := "TK_SEMI_COLON"
			when TK_LPAREN then
				Result := "TK_LPAREN"
			when TK_RPAREN then
				Result := "TK_RPAREN"
			when TK_LSBRAC then
				Result := "TK_LSBRAC"
			when TK_RSBRAC then
				Result := "TK_RSBRAC"
			when TK_LABRAC then
				Result := "TK_LABRAC"
			when TK_RABRAC then
				Result := "TK_RABRAC"
			when TK_DQUOTE then
				Result := "TK_DQUOTE"
			when TK_MINUS then
				Result := "TK_MINUS"
			when EOL then
				Result := "EOL"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	NUMBER: INTEGER = 258
	REAL: INTEGER = 259
	IDENT: INTEGER = 260
	CHAR_LIT: INTEGER = 261
	STR_LIT: INTEGER = 262
	TK_SYSTEM: INTEGER = 263
	TK_BOOL: INTEGER = 264
	TK_CHAR: INTEGER = 265
	TK_INT: INTEGER = 266
	TK_REAL: INTEGER = 267
	TK_STR: INTEGER = 268
	TK_TUPLE: INTEGER = 269
	TK_ARRAY: INTEGER = 270
	TK_TRUE: INTEGER = 271
	TK_FALSE: INTEGER = 272
	TK_TRUE_LOWER: INTEGER = 273
	TK_FALSE_LOWER: INTEGER = 274
	TK_COMMA: INTEGER = 275
	TK_COLON: INTEGER = 276
	TK_SEMI_COLON: INTEGER = 277
	TK_LPAREN: INTEGER = 278
	TK_RPAREN: INTEGER = 279
	TK_LSBRAC: INTEGER = 280
	TK_RSBRAC: INTEGER = 281
	TK_LABRAC: INTEGER = 282
	TK_RABRAC: INTEGER = 283
	TK_DQUOTE: INTEGER = 284
	TK_MINUS: INTEGER = 285
	EOL: INTEGER = 286

end