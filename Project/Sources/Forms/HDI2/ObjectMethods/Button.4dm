var $people : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

For each ($people; Form:C1466.people)
	$people.fullname:=Uppercase:C13($people.fullname)
	$people.save()
End for each 

Form:C1466.people:=Form:C1466.people

