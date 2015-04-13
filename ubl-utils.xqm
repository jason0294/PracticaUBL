xquery version "3.0";


module namespace ubl="urn:ubl:utils";

declare function ubl:document-list(){
    let $doc := doc('/db/Topicos/UBL-2.1.xml')

let $sections := $doc/article/section[3]/section[1]/section

for $s in $sections
return <documents>
    <process>{$s//tbody/row[1]/entry[2]/para/*}</process>
    <doc-name>{$s/title/text()}</doc-name>
    </documents>
};

declare function ubl:process-list(){
 let $list := ubl:document-list()

let $ordenado := distinct-values($list//process/link)

return      for $p in $ordenado
                return <process><name> { $p }</name>{ubl:docs-for-process($list,$p)}</process>
            
};

declare function ubl:docs-for-process($doc-list,$process-name){
     $doc-list[process//* = $process-name]/doc-name
};

