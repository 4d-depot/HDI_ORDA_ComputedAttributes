Class extends Entity

//  ****************      GETTER       ****************
Function get fullname($event : Object)->$fullname : Text
	
	Case of 
		: (This:C1470.firstname=Null:C1517) & (This:C1470.lastname=Null:C1517)
			$fullname:=""
		: (This:C1470.firstname=Null:C1517)
			$fullname:=This:C1470.lastname
		: (This:C1470.lastname=Null:C1517)
			$fullname:=This:C1470.firstname
		Else 
			$fullname:=This:C1470.firstname+" "+This:C1470.lastname
	End case 
	
	//  ****************      SETTER       ****************
Function set fullname($fullname : Text)  // ex : "Peter Paul/Smith(†36)"
	
	var $p : Integer
	$p:=Position:C15("/"; $fullname)  // Pablo Antonio/de la Casa Del Mar
	If ($p<=0)
		$p:=Position:C15(" "; $fullname)  // John Smith
	End if 
	
	This:C1470.firstname:=Substring:C12($fullname; 1; $p-1)  // "" if $p<0
	This:C1470.lastname:=Substring:C12($fullname; $p+1)
	
	//  ****************      QUERIES      ****************
Function query fullname($event : Object)->$result : Object
	
	var $fullname; $firstname; $lastname; $query : Text
	var $operator : Text
	var $p : Integer
	var $parameters : Collection
	
	$operator:=$event.operator
	$fullname:=$event.value
	
	$p:=Position:C15(" "; $fullname)
	If ($p>0)
		$firstname:=Substring:C12($fullname; 1; $p-1)+"@"
		$lastname:=Substring:C12($fullname; $p+1)+"@"
		$parameters:=New collection:C1472($firstname; $lastname)
	Else 
		$fullname:=$fullname+"@"
		$parameters:=New collection:C1472($fullname)
	End if 
	
	Case of 
		: ($operator="==") | ($operator="===")
			If ($p>0)
				$query:="(firstname = :1 and lastname = :2) or (firstname = :2 and lastname = :1)"
			Else 
				$query:="firstname = :1 or lastname = :1"
			End if 
		: ($operator="!=")
			If ($p>0)
				$query:="firstname != :1 and lastname != :2 and firstname != :2 and lastname != :1"
			Else 
				$query:="firstname != :1 and lastname != :1"
			End if 
	End case 
	
	$result:=New object:C1471("query"; $query; "parameters"; $parameters)
	
	
	//  ****************      ORDER BY       ****************
Function orderBy fullname($event : Object)->$result : Text
	
	If ($event.descending)
		$result:="lastname desc, firstname desc"
	Else 
		$result:="lastname asc, firstname asc"
	End if 
	