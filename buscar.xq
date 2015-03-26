declare option exist:serialize "method=html media-type=text/html";
<html>
    <head>
        <title>
Buscar
</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div id="navbar" class="navbar-collapse collapse">
                <p class="navbar-brand">
                    <h2>
                        <font color="white">Buscar por término</font>
                    </h2>
                </p>
            </div>
        </nav>
        <br/>
        <br/>
        <div class="jumbotron">
            <form action="idd2.xq" method="GET">
                <p class="lead"> Ingrese Termino: 
                <br/>
                    <input type="text" name="simple"/>
                </p>
                <select id="selectLang" name="lang" class="btn btn-mini">
                    <option value="">Selecciona un lenguaje</option>
                    <option value="DE">DE</option>
                    <option value="ES">ES</option>
                    <option value="IT">IT</option>
                    <option value="Ingles">Ingles</option>
                    <option value="ZH-CN">ZH-CN</option>
                    <option value="ZH-TW">ZH-TW</option>
                </select>
                <br/>
                <br/>
                <input type="submit" class="btn btn-info"/>
            </form>
        </div>
    </body>
</html>

