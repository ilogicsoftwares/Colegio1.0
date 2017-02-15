PUBLIC gnx
Store SQLConnect('colegio', 'root', '693693123456') To gnx
SET DEFAULT TO "c:\colegio\"
SET PROCEDURE TO procedures
procedure ejecutarsqls
LPARAMETERS sfile,dbmsf
Store SQLConnect('colegio', 'root', '693693123456') To gnx2
SQLEXEC(gnx2,'use ' + db)
sscript=FILETOSTR(sfile)

ALINES(marray,sscript)

FOR i=1 TO (ALEN(marray))

SQLEXEC(gnx2,marray(i))

ENDFOR

ENDPROC


PROCEDURE renobarinicio
LPARAMETERS bdnamex
SET SAFETY OFF

var1=FILETOSTR('firstini.cfg')
ALINES(mxarray,var1)
mxarray(1)="0"
mxarray(3)=bdnamex

STRTOFILE("","firstini.cfg",0)
FOR y=1 TO ALEN(mxarray)
STRTOFILE(mxarray(y) + Chr(13) + Chr(10),"firstini.cfg",1)

ENDFOR
SET SAFETY ON


ENDPROC

FUNCTION limpiardatosenform
LPARAMETERS nFormulario as Object 
FOR I=1 TO &nformulario..controlCount

IF UPPER(&nformulario->Controls(i).baseclass)='TEXTBOX' AND &nformulario->Controls(i).name <> "id" then
xtcontrol=&nformulario->Controls(i).value
IF TYPE('xtcontrol')='N' then
&nformulario->Controls(i).value=0
ENDIF
IF TYPE('xtcontrol')='C' then
&nformulario->Controls(i).value=""
ENDIF

IF TYPE('xtcontrol')='D' then
&nformulario->Controls(i).value={//}
ENDIF
ENDIF



IF UPPER(&nformulario->Controls(i).baseclass)='CHECKBOX' 
&nformulario->Controls(i).value=0
ENDIF
IF UPPER(&nformulario->Controls(i).baseclass)='OPTIONGROUP' 
&nformulario->Controls(i).value=1
ENDIF

IF UPPER(&nformulario->Controls(i).baseclass)='COMBOBOX' THEN
&nformulario->Controls(i).value=""
*&nformulario->Controls(i).rowsource=""
ENDif

ENDFOR
ENDFUNC 

FUNCTION Editardatosenform
*tabla a editar,nombre del campo indice,el valor del indice,el nombre del formulario
LPARAMETERS TABLA,NOMBREINDICE,VALORINDICE,nformulario
FOR i=1 TO &nformulario..ControlCount 
IF (UPPER(&nformulario..Controls(i).baseclass)='TEXTBOX' OR UPPER(&nformulario..Controls(i).baseclass)='CHECKBOX' OR UPPER(&nformulario..Controls(i).baseclass)='COMBOBOX' OR UPPER(&nformulario..Controls(i).baseclass)='OPTIONGROUP') AND &nformulario..Controls(i).tag<>"a" THEN
nombrecampo=&nformulario..Controls(i).name
valorcampo=&nformulario..Controls(i).value
valorbusqueda=VALORINDICE
***	MESSAGEBOX(&nformulario..Controls(i).name)
***MESSAGEBOX(TYPE('valorcampo'))
***	MESSAGEBOX(valorindice)

SQLL="UPDATE " + TABLA +" SET " + nombrecampo +"=" + "?valorcampo" + " where " + NOMBREINDICE + "=" + "?valorbusqueda"
*****MESSAGEBOX(SQLL)
sqlcx=SQLEXEC(GNX,sqll)

IF sqlcx<=0 THEN
MESSAGEBOX("No se pudieron actualizar los datos",48+0)
RETURN .F.
endif
ENDIF


ENDFOR

MESSAGEBOX("Datos Actualizados",64+0)

RETURN .T.
ENDFUNC



FUNCTION guardardatosenform
LPARAMETERS tabla,nformulario
Store SQLConnect('colegio', 'root', '693693123456') To gnx2
loscampos=""
losvalores=""
separador=","
FOR l=1 TO &nformulario..ControlCount

IF (UPPER(&nformulario..Controls(l).baseclass)='TEXTBOX' OR UPPER(&nformulario..Controls(l).baseclass)='CHECKBOX' OR UPPER(&nformulario..Controls(l).baseclass)='COMBOBOX' OR UPPER(&nformulario..Controls(l).baseclass)='OPTIONGROUP') AND &nformulario..Controls(l).tag<>'a' THEN

****control errores
*!*	a=&nformulario..Controls(l).value
*!*	MESSAGEBOX(&nformulario..Controls(l).name)
*!*	MESSAGEBOX(TYPE('a'))
******************++
loscampos=loscampos + &nformulario..Controls(l).name + separador
IF UPPER(&nformulario..Controls(l).baseclass)='COMBOBOX'
losvalores=losvalores + "?" + nformulario + "." + &nformulario..Controls(l).name + ".displayvalue"+ separador
ELSE
losvalores=losvalores + "?" + nformulario + "." + &nformulario..Controls(l).name + ".value"+ separador

ENDIF

endif
ENDFOR
t1=LEN(loscampos)
t2=LEN(losvalores)
loscampos=SUBSTR(loscampos,1,t1-1)
losvalores=SUBSTR(losvalores,1,t2-1)
****control errores
*!*	MESSAGEBOX(LOSCAMPOS)
*!*	MESSAGEBOX(LOSVALORES)
*********************
sqll="insert into " + tabla + " (" +loscampos+ ") " + "values (" +losvalores +")" 

ll=SQLEXEC(gnx2,sqll)
IF ll>=0 then
MESSAGEBOX("Datos guardados exitosamente",0+64)
RETURN .T.
ELSE
MESSAGEBOX("Los dato no fueron guardados",0+16)
RETURN .F.
endif
ENDFUNC

FUNCTION validardatosenform
LPARAMETERS nformulario

FOR I=1 TO &nformulario..ControlCount
IF UPPER(&nformulario..Controls(i).baseclass)='TEXTBOX' AND (&nformulario..Controls(i).wHATStHIShELPid)=-1

IF EMPTY(&nformulario..Controls(i).value) then

MESSAGEBOX("Debe completar todos los datos",0+64)
RETURN .f.
ELSE
RETURN .T.
endif
ENDIF



IF UPPER(&nformulario..Controls(i).baseclass)='CHECKBOX' AND EMPTY(&nformulario..Controls(i).tag)
ENDIF

IF UPPER(&nformulario..Controls(i).baseclass)='COMBOBOX' AND EMPTY(&nformulario..Controls(i).tag) THEN 

ENDif

ENDFOR

ENDFUNC



**************************++

Procedure CARGATEXTBOXS
Lparameters Combo As String,TABLA As String, campo As String,condicion as String 
If Used('CPRIME') Then
	Use In cprime
	bbr="_screen.ActiveForm" + "." +  Combo+"." +"clear"
	&bbr
Endif
prime="select " + campo + " from " + TABLA + " " +condicion + " order by " + campo
AAA=SQLExec(gnx, prime,"CPRIME")

If AAA >0 Then
	datosx="cprime." + campo
	CANTIDADR=Reccount('CPRIME')
	Select cprime
	Go Top
	For k =1 To CANTIDADR
		bbb="_screen.ActiveForm" + "." +  Combo+"." +"AddITEM"
		bba="_screen.ActiveForm" + "." +  Combo+"." +"style"
		&bba=2
		&bbb(&datosx,k,1)
		Skip
	Endfor


Else
	Messagebox("no se pudieron cargar los datos en el Combo Box")
	Return
Endif




Endproc



procedure cargadatosenform
*tabla a consultar,campo de busqueda,dato del campo de busqueda,los campos a retornar en el sql,nombre del formulario
*el parametro tabla ya no es necesario, dejado por compatibilidad
LPARAMETERS tabla,indice,dato,xcampos,formname

IF TYPE('dato')="N" then
datox=ALLTRIM(STR(dato))
ELSE
datox="'"+dato+"'"
*datox=VAL(dato)
endif
*SQLEXEC(gnx,"select "+ xcampos + " from " + tabla + " where " + indice + "=" + datox,"cursorp")

select  &xcampos  from  cursorpt  where   &indice  =  &datox INTO CURSOR cursorp
SELECT cursorp
DIMENSION campos(FCOUNT('cursorp'))
i=0
FOR each element IN campos
i=i+1
campos(i)=FIELD(i,'cursorp')
ENDFOR

FOR j=1 TO ALEN(campos)
temp=formname +"." +campos(j) + ".value"
temp2=formname +"." +campos(j) + ".Baseclass"
temp1="cursorp." + campos(j)

&temp=&temp1
IF isnull(&temp1) AND UPPER(&temp2)='TEXTBOX'  then
a=&temp
DO case
CASE TYPE('a')='N'
&temp=0 
CASE TYPE('a')='D'
&temp={}
CASE TYPE('a')='C'
&temp=""
ENDCASE



ENDIF

ENDFOR



ENDPROC

PROCEDURE abrirform()
LPARAMETERS nombreform

FOR EACH formulario as form IN _screen.Forms
IF UPPER(formulario.Name)=UPPER(nombreform)   then
EXIT
ELSE

DO FORM &nombreform
exit
ENDIF




ENDFOR


ENDPROC
FUNCTION cargadatosenform2
*tabla a consultar,campo de busqueda,dato del campo de busqueda,los campos a retornar en el sql,nombre del formulario
LPARAMETERS tabla,indice,dato,xcampos,formname

*!*	IF TYPE('dato')="N" then
*!*	datox=ALLTRIM(STR(dato))
*!*	ELSE
*!*	datox=VAL(dato)
*!*	endif
&xcampos
lecur=ALIAS()

*!*	SQLEXEC(gnx,"select "+ xcampos + " from " + tabla + " where " + indice + "=" + dato,"cursorp")
*select  &xcampos  from  cursorpt  where   &indice  =  &datox INTO CURSOR cursorp
SELECT * from &lecur WHERE TRANSFORM(&indice)==TRANSFORM(dato) INTO CURSOR cursorx readwrite
SELECT cursorx

IF RECCOUNT('CURSORX')=0 THEN
RETURN .F.
ENDIF
DIMENSION campos(FCOUNT('cursorx'))
i=0
FOR each element IN campos
i=i+1
campos(i)=FIELD(i,'cursorx')
ENDFOR

FOR j=1 TO ALEN(campos)
temp=formname +"." +campos(j) + ".value"
temp1="cursorx." + campos(j)
&temp=&temp1
ENDFOR

&formname..editar=2
RETURN .T.

ENDFUNC


PROCEDURE cargarconceptos
LPARAMETERS cline as Character 
CREATE CURSOR cargarconceptos (idconcepto n(11),nombre c(50))
counter=1

DO WHILE NOT EMPTY(GETWORDNUM(cline,counter,","))
bb=VAL(GETWORDNUM(cline,counter,","))
SQLEXEC(gnx,"select  idconcepto,nombre from conceptos  where idconcepto=?bb",'Consul1')

SELECT cargarconceptos
APPEND FROM dbf('consul1') 
counter=counter+1
GO TOP 
ENDDO


ENDPROC


PROCEDURE generarprenomina()



ENDPROC


PROCEDURE crearformulario()
LPARAMETERS tabla
Store SQLConnect('colegio', 'root', '693693123456') To gnx3
SET DEFAULT TO c:\colegio
CREATE form ? as formn FROM clases NOWAIT save

yx=SQLEXEC(gnx3,"select * from " + tabla,tabla)

IF yx>0 then
COPY TO "c:\colegio\" + tabla + ".dbf"
ELSE
MESSAGEBOX("No se pudieron crear los datos del form")
endif





ENDPROC

FUNCTION calcularmeses
LPARAMETERS fechamayor,fechamenor
SET DATE BRITISH


y=(fechamayor-fechamenor)
x=ROUND(y/365*12,0)
RETURN x


ENDFUNC

FUNCTION stringmes
LPARAMETERS fecha

DO CASE
CASE MONTH(fecha)=1
RETURN "Enero " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=2
RETURN "Febrero " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=3
RETURN "Marzo " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=4
RETURN "Abril " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=5
RETURN "Mayo " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=6
RETURN "Junio " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=7
RETURN "Julio " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=8
RETURN "Agosto " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=9
RETURN "Septiembre " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=10
RETURN "Octubre " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=11
RETURN "Noviembre " + TRANSFORM(YEAR(fecha))
CASE MONTH(fecha)=12
RETURN "Diciembre " + TRANSFORM(YEAR(fecha))



ENDCASE


ENDFUNC


FUNCTION calcularmorosos 
LPARAMETERS fecha



END TRANSACTION funct 


FUNCTION MSG
LPARAMETERS PRONT,TIPO
a=0
DO case
CASE UPPER(TIPO)="P"

a=MESSAGEBOX(PRONT,4+32,"Ilogic Softwares")

CASE UPPER(TIPO)="I"
a=MESSAGEBOX(PRONT,0+64,"Ilogic Softwares")

CASE UPPER(TIPO)="E"
a=MESSAGEBOX(PRONT,0+16,"Ilogic Softwares")
ENDCASE
RETURN a
ENDFUNC


FUNCTION Porcent
LPARAMETERS  cantidad,porcent
x = (porcent * cantidad)/100
RETURN x 

ENDFUNC
FUNCTION Edad(tdNac, tdHoy) 
LOCAL lnAnio 
IF EMPTY(tdHoy) 
tdHoy = DATE() 
ENDIF 
lnAnio = YEAR(tdHoy) - YEAR(tdNac) 
IF GOMONTH(tdNac, 12 * lnAnio) > tdHoy 
lnAnio = lnAnio - 1 
ENDIF 
RETURN lnAnio 
ENDFUNC 

FUNCTION AnularFactura
LPARAMETERS nfactura,idnotac
lreturn=0
SQLEXEC(gnx,"select * from factura where idfactura=?nfactura","productosf")
IF productosf.estatus=1 then
lreturn=1
RETURN lreturn
endif 
xidalumno=productosf.idalumno 




SELECT productosf
GO TOP 
FOR i=1 TO RECCOUNT('productosf')

DO CASE 
******** Reversa Inscripcion
CASE productosf.tipon=2
xid=VAL(GETWORDNUM(productosf.idproducto,2,"-"))
SQLEXEC(gnx,"update inscripcion set idfactura=?idnotac,facturada=0,estatus=3 where idinscripcion=?xid")
SQLEXEC(gnx,"delete from mensualidad where idinscripcion=?xid")
******** Reversa Mensualidad
CASE productosf.tipon=3
xid=VAL(GETWORDNUM(productosf.idproducto,2,"-"))
pre=(productosf.precio)
SQLEXEC(gnx,"update mensualidad set saldo=saldo+?pre,idtran=?idnotac where idmensualidad=?xid")
ENDCASE



SELECT productosf
skip
ENDFOR
SELECT productosf
GO TOP 

********* Reversar Notas de Credito

COUNTER=0
formasdePago=productosf.modosdepago
DO WHILE .T.


COUNTER=counter +1

stringNC=GETWORDNUM(NVL(formasdePago,""),counter,",")
IF EMPTY(stringNC) THEN 
EXIT
ENDIF
If At("N/C",stringNC)>0 Then
	montodenc=""
	monto1=Getwordnum(formasdePago,counter+1,",")
	If At(".",monto1)>0 Then
		montodenc=monto1
	Else
		monto2=Getwordnum(formasdePago,counter+2,",")
		If At(".",monto2)>0 Then
		montodenc=monto1+monto2
		Endif
	Endif
montofinal=VAL(montodenc)
stringgnx=STRTRAN(stringNC,"N/C","")
SQLEXEC(gnx,"update notadecredito set usada=0, saldo=saldo + ?montofinal where idnotacredito=?stringgnx")
Endif



ENDDO
SQLEXEC(gnx,"update factura set estatus=1 where idfactura=?nfactura")
RETURN 0
ENDFUNC




