for $x in doc("Passengers.xml")/passengers/passenger
order by $x/firstname
where $x/class="Business" return $x