SELECT saldo_colegio
GO top
FOR i =1 TO RECCOUNT('saldo_colegio')

ida=alumno
idsaldo=saldo

ra=SQLEXEC(gnx,"update bono set saldo=saldo+?idsaldo where idalumno=?ida")
?ra
SKIP

ENDFOR