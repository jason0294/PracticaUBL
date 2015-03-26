xquery version "3.0";
declare option exist:serialize "method=html media-type=text/html";

let $simple := request:get-parameter('simple','')
let $lang := request:get-parameter('lang','')

let $doc := concat("UBL-",$simple,"-2.1")


let $nombre := concat("/db/Topicos/UBL-IDD-2.1-",$lang,".xml")

let $path := doc($nombre)/idd/section[@xml:id = $doc]/entry
   

let $filas := for $p in $path
return <tr>
            <td>{$p/ubl-name/text()}</td>
            <td>{$p/business-terms/text()}</td>
            <td>{$p/definition/text()}</td>
        </tr>
        
return <html>
    <head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
 <title>Table</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div id="navbar" class="navbar-collapse collapse">
            <p class="navbar-brand" ><h2><font color="white">Documentos</font></h2></p>
            </div>
            </nav>
            <br/>
            <br/>
            <br/>
    <h2>{$simple}</h2>
   
       <table class="table table-bordered">
       
        <tr>
            <td><b>Ubl-name</b></td>
            <td><b>Term</b></td>
            <td><b>Definition</b></td>
        </tr>

          { $filas } 
        </table>
        
    </body>
    
</html>