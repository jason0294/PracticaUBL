xquery version "3.0";
declare option exist:serialize "method=html media-type=text/html";

declare function local:fix($s){
  let $sFix : = substring-after($s,"UBL-")
  return substring-before($sFix,"-2.1")
};


let $simple := request:get-parameter('simple','')
let $lang := request:get-parameter('lang','')

let $doc := concat("UBL-",$simple,"-2.1")


let $nombre := concat("/db/Topicos/UBL-IDD-2.1-",$lang,".xml")



let $path := doc($nombre)/idd/section/entry/business-terms/text()[.=$simple]/ ../ ../ ../@xml:id
   
let $list:=for $d in $path
    return
        <tr>
            <td> <a href="idd.xq?lang={$lang}&amp;simple={replace(local:fix(string($d))," ","")}">{local:fix((string($d)))}</a> </td>
           
        </tr>
        

return <html>
    <head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
 <title>Table</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div id="navbar" class="navbar-collapse collapse">
            <p class="navbar-brand" ><h2><font color="white">Terminos</font></h2></p>
            </div>
            </nav>
            <br/>
            <br/>
            <br/>
    <h2>{$simple}</h2>
   
       <table class="table table-bordered">
       
        <tr>
            <td><b>Documentos/Term</b></td>
           
        </tr>

          { $list } 
        </table>
        
    </body>
    
</html>