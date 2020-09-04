SET ECHO OFF
SET LINESIZE 300
SET LONG 900
SET LONGCHUNKSIZE 900
SET WRAP OFF
SET HEADING OFF
SET COLSEP ';'
SET FEEDBACK ON
SET TRIMSPOOL ON
SET TRIMOUT ON
SET PAGESIZE 0
SET NEWPAGE None
SET VERIFY OFF
SET UNDERLINE '-'
SET TERMOUT ON
SET LINE 8

SELECT DISTINCT TO_CHAR(L.LOCALTIME, 'yyyy-mm-dd hh24:mi:ss'), source, condition, sub_cond, a.nbr_value, L.MESSAGE
FROM  OPS$OCSHIS.MSG16 L, OPS$OCSHIS.MsgAttrs16 A, OPS$OCSHIS.MsgVendors V
 
WHERE L.LocalTime >= sysdate-1 and L.IDX = A.idx and v.event_type=4 and v.attr_name = 'Class' and v.attr_id = a.attr_id and a.nbr_value >= 3000 and a.nbr_value <= 3999;
SPOOL C:\LOMA\T.txt
/

SELECT source
FROM  OPS$OCSHIS.MSG16 L, OPS$OCSHIS.MsgAttrs16 A, OPS$OCSHIS.MsgVendors V
 
WHERE L.LocalTime >= sysdate-90 and L.IDX = A.idx and v.event_type=4 and v.attr_name = 'Class' and v.attr_id = a.attr_id and a.nbr_value >= 3000 and a.nbr_value <= 3999;
SPOOL C:\LOMA\source.txt
/

SELECT L.MESSAGE
FROM  OPS$OCSHIS.MSG16 L, OPS$OCSHIS.MsgAttrs16 A, OPS$OCSHIS.MsgVendors V
 
WHERE L.LocalTime >= sysdate-90 and L.IDX = A.idx and v.event_type=4 and v.attr_name = 'Class' and v.attr_id = a.attr_id and a.nbr_value >= 3000 and a.nbr_value <= 3999;
SPOOL C:\LOMA\lmessage.txt
/

SELECT condition
FROM  OPS$OCSHIS.MSG16 L, OPS$OCSHIS.MsgAttrs16 A, OPS$OCSHIS.MsgVendors V
 
WHERE L.LocalTime >= sysdate-90 and L.IDX = A.idx and v.event_type=4 and v.attr_name = 'Class' and v.attr_id = a.attr_id and a.nbr_value >= 3000 and a.nbr_value <= 3999;
SPOOL C:\LOMA\condition.txt
/

SELECT sub_cond
FROM  OPS$OCSHIS.MSG16 L, OPS$OCSHIS.MsgAttrs16 A, OPS$OCSHIS.MsgVendors V
 
WHERE L.LocalTime >= sysdate-90 and L.IDX = A.idx and v.event_type=4 and v.attr_name = 'Class' and v.attr_id = a.attr_id and a.nbr_value >= 3000 and a.nbr_value <= 3999;
SPOOL C:\LOMA\sub_cond.txt
/

SELECT a.nbr_value
FROM  OPS$OCSHIS.MSG16 L, OPS$OCSHIS.MsgAttrs16 A, OPS$OCSHIS.MsgVendors V
 
WHERE L.LocalTime >= sysdate-90 and L.IDX = A.idx and v.event_type=4 and v.attr_name = 'Class' and v.attr_id = a.attr_id and a.nbr_value >= 3000 and a.nbr_value <= 3999;
SPOOL C:\LOMA\a_nbr_value1.txt
/
/
END SPOOL
