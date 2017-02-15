
SQLEXEC(gnx,"select mensualidad.*,MAX(saldo) as cuotamax from mensualidad where idperiodo=1 and saldo>0 group by idalumno order by idalumno","lista")
SELECT lista 

GO top


FOR I=1 TO RECCOUNT('LISTA')
alum=lista.idalumno
mon=lista.cuotamax
IF mon>=800 THEN
aa=SQLEXEC(gnx,'update mensualidad set costo=?mon where idalumno=?alum and (year(mes)>2014 or MONTH(mes)=12)')
ENDIF
?aa
SELECT lista
skip

ENDFOR
