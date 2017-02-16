PUBLIC gnx
PUBLIC odbcnombre,odbcclave,odbcusuario,odbcdatabase,npath
SET DEFAULT TO ADDBS(JUSTPATH(SYS(16)))
initf=FILETOSTR('firstini.cfg')

ALINES(initarray,initf)

iniciovar=VAL(ALLTRIM(SUBSTR(initarray(1),1,29)))
npath=ALLTRIM(SUBSTR(initarray(2),1,29))
SET DEFAULT TO (npath)
SET PROCEDURE TO procedures.prg
odbcnombre=ALLTRIM(SUBSTR(initarray(4),1,29))
odbcclave=ALLTRIM(SUBSTR(initarray(6),1,29))
odbcusuario=ALLTRIM(SUBSTR(initarray(5),1,29))
odbcdatabase=ALLTRIM(SUBSTR(initarray(3),1,29))

Store SQLConnect(odbcnombre, odbcusuario, odbcclave) To gnx
SQLSETPROP(gnx,"DispWarnings",.T.)