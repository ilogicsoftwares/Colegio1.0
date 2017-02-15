SET DATE BRITISH 
SQLEXEC(gnx,"select * from mensualidad where idperiodo=1 and saldo>0 order by idmensualidad","lista")


SQLEXEC(gnx,"select alumno.*,inscripcion.grado from alumno inner join inscripcion on inscripcion.idalumno=alumno.idalumno where egresado=0","alumn1")
SELECT alumn1.*," " as marca,"                 " as desde FROM alumn1 INTO CURSOR alumn READWRITE 

SELECT alumn 
GO TOP 
FOR i = 1 TO RECCOUNT('alumn')

alumx=alumn.idalumno

SELECT * FROM lista WHERE idalumno = alumx INTO CURSOR consul1

SELECT consul1
GO top
IF consul1.mes<DATE() then

replace alumn.marca WITH "1"
replace alumn.desde WITH DTOC(consul1.mes)

ENDIF

SELECT alumn 
skip

ENDFOR

SELECT * FROM alumn WHERE marca ="1" ORDER BY grado INTO CURSOR morosos 




REPORT FORM morosos.frx PREVIEW 





