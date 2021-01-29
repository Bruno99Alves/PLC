%option noyywrap

%% 
(?i:VAR)                    { return(VAR); } 
(?i:TRUE)                   { return(TRUE); } 
(?i:FALSE)                  { return(FALSE); } 
\=\=                        { return(EQ); }
\!\=                        { return(NE); }
\<                          { return(LT); }
\<\=                        { return(LE); }
\>                          { return(GT); }
\>\=                        { return(GE); }
(?i:IF)                     { return(IF); }
(?i:ELSE)                   { return(ELSE); }
(?i:FOR)                    { return(FOR); }
(?i:DO)                     { return(DO); }
(?i:INPUT)                  { return(INPUT); }
(?i:OUTPUT)                 { return(OUTPUT); }
[\=\(\)\{\}\;\+\-\*\/\|\%\[\]]  { return yytext[0]; }
[a-zA-Z][0-9a-zA-Z]*        { yylval.valS=strdup(yytext); return(ID); }
[0-9]+                      { yylval.valN=atoi(yytext); return(NUM); } 
\/\/.*\n                    { ; }
[ \t\n]                     { ; }
.                           { printf("Ficheiro Rattle contém caracter inválido [%c]\n", yytext[0]); }
%%

