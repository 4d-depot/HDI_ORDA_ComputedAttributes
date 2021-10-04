var $people : Object
var $col : Collection
var $fullName; $word : Text

If (Form:C1466.trace)
	TRACE:C157
End if 

For each ($people; Form:C1466.people)
	
	$fullName:=$people.fullname
	$col:=Split string:C1554($fullName; " ")
	$fullName:=""
	For each ($word; $col)
		$fullName:=$fullName+Uppercase:C13(Substring:C12($word; 1; 1))+Lowercase:C14(Substring:C12($word; 2))+" "
	End for each 
	
	$people.fullname:=$fullName
	$people.save()
	
End for each 

Form:C1466.people:=Form:C1466.people

