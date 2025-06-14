/* Definição: seção para código do usuário. */
import java_cup.runtime.Symbol;

%%

%cup
%unicode
%line
%column
%class MeuScanner

/* Macros */
letra = [a-zA-Z]
digito = [0-9]
ident = [a-zA-Z0-9_]([a-zA-Z0-9_])* 

%%


"SELECT"    { return new Symbol(sym.SELECT); }
"FROM"      { return new Symbol(sym.FROM); }
"WHERE"     { return new Symbol(sym.WHERE); }
","             { return new Symbol(sym.VIRG); }
";"             { return new Symbol(sym.PTVIRG); }
"="             { return new Symbol(sym.IGUAL); }
"."             { return new Symbol(sym.PONTO); }  /* Adicionamos o ponto */
{ident}         { return new Symbol(sym.ID, yytext()); }
[ \t\r\n]+      { /* Ignora */ }

/* Qualquer outro caractere é inválido */
.               { System.err.println("Caractere inválido: " + yytext() + " na linha: " + yyline); return null; }
