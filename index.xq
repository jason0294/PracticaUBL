xquery version "3.0";

declare option exist:serialize "method=html media-type=text/html";

import module namespace ubl="urn:ubl:utils" at "ubl-utils.xqm";

let $list := ubl:process-list()
let $lang := request:get-parameter('lang','ES')

let $body := for $p in $list
    return <div>
            <h2> {$p/name/text()}</h2>
            {
                for $d in $p/doc-name
                   let $i:= <li><a href="idd.xq?lang={$lang}&amp;simple={replace($d/text()," ","")}">{$d/text()}<br/></a></li>
                   return <ul>{$i}</ul>
            }
            </div>
            
return
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
   <title>Home</title>
        </head>
        <body>
            <nav class="navbar navbar-inverse navbar-fixed-top">
            <div id="navbar" class="navbar-collapse collapse">
            <p class="navbar-brand" ><h2><font color="white">Bienvenido a tu diccionario UBL</font></h2></p>
            </div>
            </nav>
            <br/>
            <br/>
            <div class="jumbotron">
            <p class="lead">Pulsa el boton para buscar un documento por términos:</p>
            <a class="btn btn-info" href="buscar.xq">Buscar</a>
            <br/>
            
            <p class="lead"><h2>1. Escoje un lenguaje</h2></p>
            <form action="index.xq" method="GET">

                <select id="selectLang" name="lang" onchange="this.form.submit()" class="btn btn-mini">
                <option value="">Selecciona un lenguaje</option>
                <option value="DE">DE</option>
                <option value="ES">ES</option>
                <option value="IT">IT</option>
                <option value="Ingles">Ingles</option>
                <option value="ZH-CN">ZH-CN</option>
                <option value="ZH-TW">ZH-TW</option>
            </select>
            

            
            </form>
            <p class="lead"><h2>2. Click a uno de los links a continuación para ver su contenido:</h2></p>

            {$body}
             </div>
            </body>
            
            </html>