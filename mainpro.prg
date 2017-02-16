Set Century On
SET DATE BRITISH 
SET SEPARATOR TO ","
Set Decimals To 2


PUBLIC odbcnombre,odbcclave,odbcusuario,odbcdatabase,npath,frmmain,frmmenu,elgue
PUBLIC gnx
PUBLIC esteform
PUBLIC idxfac1,idxnota
PUBLIC idxalum1,idxperiodo1,idxins1
PUBLIC agregarmes
agregarmes=0
PUBLIC REIMP
REIMP=0

odbcnombre=""
odbcclave=""
odbcusuario=""
odbcdatabase=""
*SET DEFAULT TO "\colegio1.0"
SET DEFAULT TO ADDBS(JUSTPATH(SYS(16)))
initf=FILETOSTR('firstini.cfg')

ALINES(initarray,initf)

iniciovar=VAL(ALLTRIM(SUBSTR(initarray(1),1,29)))
npath=ALLTRIM(SUBSTR(initarray(2),1,29))
SET DEFAULT TO (npath)
SET PROCEDURE TO procedures.prg
IF iniciovar=1 then







odbcnombre=ALLTRIM(SUBSTR(initarray(4),1,29))
odbcclave=ALLTRIM(SUBSTR(initarray(6),1,29))
odbcusuario=ALLTRIM(SUBSTR(initarray(5),1,29))
odbcdatabase=ALLTRIM(SUBSTR(initarray(3),1,29))

Store SQLConnect(odbcnombre, odbcusuario, odbcclave) To gnx

SQLSETPROP(gnx,"DispWarnings",.T.)



IF gnx<=0 then
MESSAGEBOX("No se pudo conectar a la base de datos")
quit
ENDIF
*DO FORM frmfirstini
ELSE
odbcnombre=ALLTRIM(SUBSTR(initarray(4),1,29))
odbcclave=ALLTRIM(SUBSTR(initarray(6),1,29))
odbcusuario=ALLTRIM(SUBSTR(initarray(5),1,29))
odbcdatabase=ALLTRIM(SUBSTR(initarray(3),1,29))

Store SQLConnect(odbcnombre, odbcusuario, odbcclave) To gnx
SQLSETPROP(gnx,"DispWarnings",.T.)
SQLEXEC(gnx,"select idperiodo from periodo where estatus=1","perx")
PUBLIC periact as Integer 
periact=perx.idperiodo
USE IN perx

DO FORM "frmmain.Scx" NAME frmmain

Read Events

Close All
Clear All
ENDIF



