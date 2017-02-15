
SELECT fin1
GO top
idins=3

FOR i=1 TO RECCOUNT('fin1')
idins=idins+1
idper=1
fcod_alumno=VAL(fin1.cod_alumno)
ffecha_inicio=fin1.fecha_inic
fmonto_insc=fin1.monto_insc
fmensualidad=1000
fgrado=fin1.grado
fidfac="FAC"+(fin1.RECIBO)
FREF=Fin1.depo_insc
TEXT TO txt NOSHOW 
insert into inscripcion 
 (idinscripcion,idalumno,idperiodo,mensualidad,inscripcion,grado,idfactura,facturada,beca,estatus,fechains,referencia) values
 (?idins,?fcod_alumno,1,?fmensualidad,?fmonto_insc,?fgrado,?fidfac,1,0,0,?ffecha_inicio,?fref)
ENDTEXT


?SQLEXEC(gnx,txt)


    iniciaren=(ffecha_inicio)
	iniciaren=DATE(YEAR(iniciaren),MONTH(iniciaren),1)
	xmonto=fmensualidad

    iniciaren=GOMONTH(iniciaren,-1)
	    
		SQLEXEC(gnx,"select MAX(idmensualidad) as ultimomes from mensualidad","men1")
		
		
        
		ultmes=men1.ultimomes
		FOR i=1 TO (11 +1)
			ultmes=ultmes+i
			contador=GOMONTH(iniciaren,i)
			ins=SQLEXEC(gnx,"insert into mensualidad (idmensualidad,idalumno,mes,saldo,idperiodo,idinscripcion) values (?ultmes,?fcod_alumno,?contador,?xmonto,1,?idins)")
		ENDFOR

SELECT fin1
skip

ENDFOR

