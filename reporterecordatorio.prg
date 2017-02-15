SET DATE BRITISH
CREATE Cursor recordatorio (idalumno N(11),mensualidad d(11),Saldo N(11))
SQLEXEC(gnx,"select idperiodo from periodo where estatus=1","activo")
aax=activo.idperiodo
SQLEXEC(gnx,"select * from mensualidad where idperiodo=?aax and saldo>0 order by idmensualidad","lista")


SQLEXEC(gnx,"select alumno.*,inscripcion.grado from alumno inner join inscripcion on inscripcion.idalumno=alumno.idalumno where egresado=0","alumn1")
SELECT alumn1.*," " AS marca,"                 " AS desde FROM alumn1 INTO Cursor alumn READWRITE

SELECT alumn
GO Top

FOR Y=1 TO RECCOUNT('alumn')
	xzidalumno=alumn.idalumno
	SQLEXEC(gnx,"select * from mensualidad where idalumno=?xzidalumno","filter1")
	SELECT filter1
	GO Top

	FOR zed=1 TO RECCOUNT('filter1')
		IF filter1.Saldo<=0 then
		
		ELSE
			IF filter1.mes<DATE() then
				INSERT INTO recordatorio VALUES (xzidalumno,filter1.mes,filter1.Saldo)
				
			ELSE
			    

			ENDIF

		ENDIF

    SELECT filter1
	skip
	ENDFOR
	
	SELECT alumn
	Skip

ENDFOR
SELECT recordatorio.*,alumn1.* FROM recordatorio INNER JOIN alumn1 ON alumn1.idalumno=recordatorio.idalumno  INTO CURSOR recmaster1
SELECT * FROM recmaster1 ORDER BY recmaster1.idalumno_a,recmaster1.mensualidad,recmaster1.grado INTO CURSOR recmaster

REPORT FORM report1 PREVIEW 
