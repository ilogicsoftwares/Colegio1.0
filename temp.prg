sQLEXEC(gnx,"select distinct(idalumno) from mensualidad where idperiodo=1","mens")

SELECT mens
GO top
FOR i =1 TO reccount('mens') 
xid=mens.idalumno

?SQLEXEC(gnx,"select saldo from mensualidad where idalumno=?xid and MONTH(mes)=7","mano")
xop=mano.saldo
?SQLEXEC(gnx,"update mensualidad set costo=?xop where idalumno=?xid")
SELECT mens
skip
ENDFOR


