import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
%%
%public
%class Lexer
%standalone

%{
    private List<String> tokens= new ArrayList<>();
%}

%{
    public List<String> analizar(String archivo){
        FileReader in = null;
        try{
            in = new FileReader(archivo);
            Lexer lexer = new Lexer(in);
            while(!lexer.zzAtEOF){
                lexer.yylex();
        }
        }catch(Exception ex){
            System.out.println("Error al analizar el archivo");
        }finally{
            try{
                in.close();
                }catch(Exception ex){
                    System.out.println("Error al cerrar el archivo");
                }
        }
        return tokens;
    }
%}

%%

">"  {tokens.add(">"); System.out.println("MAYOR QUE");}
"<"  {tokens.add("<"); System.out.println("MENOR QUE");}
"=="  {tokens.add("="); System.out.println("COMPARATIVO");}
"%"{2} {tokens.add("="); System.out.println("MODULO");}
["_" A-Z a-z] [A-Z a-z]+ {tokens.add("id"); System.out.println("IDENTIFICADOR");}
[0-9]+  {tokens.add("num"); System.out.println("NUMERO");}
