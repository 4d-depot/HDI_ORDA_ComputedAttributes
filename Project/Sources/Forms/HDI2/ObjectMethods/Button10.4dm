If (Form:C1466.trace)
	TRACE:C157
End if 

Form:C1466.people:=ds:C1482.people.query("fullname = :1"; "C F")
