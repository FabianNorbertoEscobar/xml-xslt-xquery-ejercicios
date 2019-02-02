(: contar los ítems :)
let $items := (1,2,3,4,5,6)
let $count := count($items)
return
   <result>
      <count>{$count}</count>     
   </result>,

(: sumar los ítems :)
let $items := (1,2,3,4,5,6)
let $sum := sum($items)
return
   <result>
      <sum>{$sum}</sum>     
   </result>,

(: calcular el promedio :)
let $items := (1,2,3,4,5,6)
let $avg := avg($items)
return
   <result>
      <avg>{$avg}</avg>     
   </result>,
   
(: hallar el mínimo :)
let $items := (1,2,3,4,5,6)
let $min := min($items)
return
   <result>
      <min>{$min}</min>     
   </result>,
   
(: hallar el máximo :)
let $items := (1,2,3,4,5,6)
let $max := max($items)
return
   <result>
      <max>{$max}</max>     
   </result>,
   
(: listar los valores distintos :)
let $items := (1,2,4,4,5,5)
let $unique-items := distinct-values($items)
return
   <result>      
      <items>
      {
         for $item in $unique-items
         return <item>{$item}</item>
      }
      </items>
   </result>,
  
(: listar la subsecuencia entre 2 y 4 inclusive :)
let $items := (1,2,3,4,5,6)
let $sub-items := subsequence($items,2,4)
return
   <result>   
      <items>
      {
         for $item in $sub-items
         return <item>{$item}</item>
      }
      </items>
   </result>,
   
(: insertar antes del sexto elemento :)
let $items := (1,2,3,4,5,9)
let $additional-items := (6,7,8)
let $new-items := insert-before($items,6,$additional-items)
return
   <result>   
      <items>
      {
         for $item in $new-items
         return <item>{$item}</item>
      }
      </items>   
   </result>,

(: eliminar el cuarto elemento :)
let $items := (1,2,3,4,5,6)
let $new-items := remove($items,4)
return
   <result>      
      <items>
      {
         for $item in $new-items
         return <item>{$item}</item>
      }
      </items>
   </result>,
   
(: listar en reversa :)
let $items := (1,2,3,4,5,6)
let $new-items := reverse($items)
return
   <result>      
      <items>
      {
         for $item in $new-items
         return <item>{$item}</item>
      }
      </items>   
   </result>,
   
(: hallar el cuarto elemento :)
let $items := (1,2,3,4,5,6)
let $indexOf := index-of($items,4)
return
   <result>   
      <indexof>{$indexOf}</indexof>
   </result>,
   
(: hallar el último elemento :)
let $items := (1,2,3,4,5,6)
let $lastElement := $items[last()]
return
  <result>   
     <lastElement>{$lastElement}</lastElement>
  </result>,

(: listar las posiciones de los impares :)
let $items := (1,2,3,4,5,6)
return
   <result>   
      <items>
      {
         for $item in $items[position() mod 2 eq 1]
         return <item>{$item}</item>
      }
      </items>
   </result>,
   
(: mostrar la fecha del sistema :)
let $date := current-date()
return
  <results>
     <date>{$date}</date>
  </results>,

(: listar la hora del sistema :)
let $time := current-time()
return
  <results>
     <time>{$time}</time>
  </results>,

(: listar la fecha y hora del sistema :)
let $datetime := current-dateTime()
return
  <results>
     <datetime>{$datetime}</datetime>
  </results>