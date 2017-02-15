SET DATE BRITISH 
SET CENTURY on
SELECT alumno
GO TOP 

FOR i = 1 TO RECCOUNT('alumno')

aidalumno=alumno.cod_alumno
anombre=alumno.nomapealum
afechadenac=alumno.fecnac
adireccionfiscal=RTRIM(alumno.direccion)
adirection=RTRIM(alumno.direccion)
atelefonoab=alumno.telef_casa
atelefonocel=alumno.telef_otro
acedularep=transform(alumno.cedula)
anombrerep=alumno.representa
afotoalumno=""
afotorep=""
arifrep=alumno.rif
anombrejuridico=alumno.facturar
aedad=ROUND((DATE()-afechadenac)/365.25,0)
aegresado=alumno.retirado
TEXT TO consul noshow

insert into 
 alumno (idalumno,nombre,fechadenac,direccionfiscal,direction,telefonohab,telefonocel,cedularep,nombrerep,fotoalumno,fotorep,rifrep,nombrejuridico,edad,egresado) 
 values (?aidalumno,?anombre,?afechadenac,?adireccionfiscal,?adirection,?atelefonoab,?atelefonocel,?acedularep,?anombrerep,?afotoalumno,?afotorep,?arifrep,?anombrejuridico,?aedad,?aegresado)

ENDTEXT


a=SQLEXEC(gnx,consul)
?a
SKIP 

ENDFOR
