var $path; $reference; $color; $material : Text
var $page; $i; $val1; $val2 : Integer
var $pict : Picture
var $o : Object

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		WParea:=ds:C1482.doc.all().first().wp
		Form:C1466.trace:=False:C215
		
		START TRANSACTION:C239
		Form:C1466.people:=ds:C1482.people.all()
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		CANCEL TRANSACTION:C241
		
End case 