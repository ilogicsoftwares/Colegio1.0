   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Microsoft XPS Document Writer
OUTPUT=XPSPort:
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=120
COLOR=2
DUPLEX=1
YRESOLUTION=72
TTOPTION=2
COLLATE=0
                                                  K  1  winspool  Microsoft XPS Document Writer  XPSPort:                                                                    �Microsoft XPS Document Writer    � X�    �
od   x   H    Letter                                                        ����                DINU" L ���r                            	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               SMTJ      M i c r o s o f t   X P S   D o c u m e n t   W r i t e r   InputBin FORMSOURCE RESDLL UniresDLL Interleaving OFF ImageType JPEGMed Orientation PORTRAIT Collate OFF Resolution Option1 PaperSize LETTER ColorMode 24bpp                                           MXDW            Courier New                                                   "colegio.jpg"..\colegio1.0\colegio.jpg"                       �'Centro Educacional Incial "Lucila Palacios"Av. Las Delicias,Urb.Barrio SucreCalle Urdaneta N� 14 Maracay, Edo. Aragua.www.ceilucilapalacios.comTelefonos: (0243) 2425212 / (0424)3190191'                                                                Arial                                                         "@I"                                                          	"Alumno:"                                                     Courier New                                                   "Direccion:"                                                  Courier New                                                   "Representante:"                                              Courier New                                                   "Datos de la inscripcion"                                     Courier New                                                   "Matricula"                                                   Courier New                                                   "Inscripcion"                                                 Courier New                                                   "Seguro"                                                      Courier New                                                   	"Escolar"                                                     Courier New                                                   "Cuota"                                                       Arial                                                         "Monto"                                                       Arial                                                         	"Estatus"                                                     Arial                                                         "Observaciones:"                                              Arial                                                         "Por la Direccion"                                            Arial                                                         "Firma y Sello"                                               Arial                                                         nombre                                                        Courier New                                                   	direction                                                     Courier New                                                   	nombrerep                                                     Courier New                                                   
idalumno_a                                                    Courier New                                                   inscripcion                                                   Courier New                                                   stringmes(mes)                                                Courier New                                                   "Tlf:"                                                        Courier New                                                   telefonohab                                                   Courier New                                                   "Grado:"                                                      Courier New                                                   
"Periodo:"                                                    Courier New                                                   grado                                                         Courier New                                                   descripcion                                                   Courier New                                                   "N� Factura"                                                  Arial                                                         Courier New                                                   Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 179
Left = 173
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                            GPROCEDURE Init
TEXT TO otromas noshow
select inscripcion.*,alumno.*,periodo.descripcion from inscripcion inner join alumno on alumno.idalumno=inscripcion.idalumno inner join periodo on periodo.idperiodo=inscripcion.idperiodo where inscripcion.idalumno=?idxalum1 and inscripcion.idperiodo=?idxperiodo1 and inscripcion.estatus=0
ENDTEXT

RT=SQLEXEC(gnx,otromas,"ins")


SQLEXEC(gnx,"select *  from mensualidad where idalumno=?idxalum1 and idperiodo=?idxperiodo1 and idinscripcion=?ins.idinscripcion","men")
SELECT ins.*,men.* FROM ins INNER JOIN men ON men.idalumno=ins.idalumno INTO CURSOR filtrado

SELECT filtrado


ENDPROC
PROCEDURE BeforeOpenTables
*!*	        idxalum=thisform.idaLUMNO.Value 
*!*	        idxperiodo=thisform.idpeRIODo.Value 
*!*	        idxins=thisform.idinscripcion.Value 








ENDPROC
                                                      ,���                              A�   %   ~      �  
   �          �  U  	 M(�  ��&� select inscripcion.*,alumno.*,periodo.descripcion from inscripcion inner join alumno on alumno.idalumno=inscripcion.idalumno inner join periodo on periodo.idperiodo=inscripcion.idperiodo where inscripcion.idalumno=?idxalum1 and inscripcion.idperiodo=?idxperiodo1 and inscripcion.estatus=0� � T� �C� �  � ins�i��� ��C� �s select *  from mensualidad where idalumno=?idxalum1 and idperiodo=?idxperiodo1 and idinscripcion=?ins.idinscripcion� men�i��9 o� ins��� men �� � � � �� �� Ǽ�� filtrado� F� � U  OTROMAS RT GNX INS MEN IDALUMNO FILTRADO  U   Init,     �� BeforeOpenTablesw    ��1 � aA ���r 4 <                       u     	   �  <      )                                       �DRIVER=winspool
DEVICE=Microsoft XPS Document Writer
OUTPUT=XPSPort:
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=120
COLOR=2
DUPLEX=1
YRESOLUTION=72
TTOPTION=2
COLLATE=0
                                                  K  1  winspool  Microsoft XPS Document Writer  XPSPort:                                                                    �Microsoft XPS Document Writer    � X�    �
od   x   H    Letter                                                        ����                DINU" L ���r                            	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               SMTJ      M i c r o s o f t   X P S   D o c u m e n t   W r i t e r   InputBin FORMSOURCE RESDLL UniresDLL Interleaving OFF ImageType JPEGMed Orientation PORTRAIT Collate OFF Resolution Option1 PaperSize LETTER ColorMode 24bpp                                           MXDW            Courier New                                                   '"..\..\..\..\..\colegio1.0\colegio.jpg"                       �"Centro Educacional Incial "Lucila Palacios"Av. Las Delicias,Urb.Barrio SucreCalle Urdaneta N� 14 Maracay, Edo. Aragua.www.ceilucilapalacios.comTelefonos: (0243) 2425212 / (0424)3190191"                                                                Arial                                                         	"Alumno:"                                                     Courier New                                                   "Direccion:"                                                  Courier New                                                   "Representante:"                                              Courier New                                                   "Datos de la inscripcion"                                     Courier New                                                   "Matricula"                                                   Courier New                                                   "Inscripcion"                                                 Courier New                                                   "Seguro"                                                      Courier New                                                   	"Escolar"                                                     Courier New                                                   "Cuota"                                                       Arial                                                         "Monto"                                                       Arial                                                         	"Estatus"                                                     Arial                                                         "Observaciones:"                                              Arial                                                         "Por la Direccion"                                            Arial                                                         "Firma y Sello"                                               Arial                                                         nombre                                                        Courier New                                                   	direction                                                     Courier New                                                   	nombrerep                                                     Courier New                                                   
idalumno_a                                                    Courier New                                                   inscripcion                                                   Courier New                                                   stringmes(mes)                                                Courier New                                                   "Tlf:"                                                        Courier New                                                   telefonohab                                                   Courier New                                                   "Grado:"                                                      Courier New                                                   
"Periodo:"                                                    Courier New                                                   grado                                                         Courier New                                                   descripcion                                                   Courier New                                                   "N� Factura"                                                  Arial                                                         Courier New                                                   Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 179
Left = 173
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                            GPROCEDURE BeforeOpenTables
*!*	        idxalum=thisform.idaLUMNO.Value 
*!*	        idxperiodo=thisform.idpeRIODo.Value 
*!*	        idxins=thisform.idinscripcion.Value 








ENDPROC
PROCEDURE Init
TEXT TO otromas noshow
select inscripcion.*,alumno.*,periodo.descripcion from inscripcion inner join alumno on alumno.idalumno=inscripcion.idalumno inner join periodo on periodo.idperiodo=inscripcion.idperiodo where inscripcion.idalumno=?idxalum1 and inscripcion.idperiodo=?idxperiodo1 and inscripcion.estatus=0
ENDTEXT

RT=SQLEXEC(gnx,otromas,"ins")


SQLEXEC(gnx,"select *  from mensualidad where idalumno=?idxalum1 and idperiodo=?idxperiodo1 and idinscripcion=?ins.idinscripcion","men")
SELECT ins.*,men.* FROM ins INNER JOIN men ON men.idalumno=ins.idalumno INTO CURSOR filtrado

SELECT filtrado


ENDPROC
                                                      ,���                              A�   %   ~      �  
   �          �  U    U  	 M(�  ��&� select inscripcion.*,alumno.*,periodo.descripcion from inscripcion inner join alumno on alumno.idalumno=inscripcion.idalumno inner join periodo on periodo.idperiodo=inscripcion.idperiodo where inscripcion.idalumno=?idxalum1 and inscripcion.idperiodo=?idxperiodo1 and inscripcion.estatus=0� � T� �C� �  � ins�i��� ��C� �s select *  from mensualidad where idalumno=?idxalum1 and idperiodo=?idxperiodo1 and idinscripcion=?ins.idinscripcion� men�i��9 o� ins��� men �� � � � �� �� Ǽ�� filtrado� F� � U  OTROMAS RT GNX INS MEN IDALUMNO FILTRADO BeforeOpenTables,     �� Init3     ��1 = � aA ���r 3                       �         �   <      )                                 