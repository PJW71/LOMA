SELECT DISTINCT TO_CHAR(L.LOCALTIME, 'yyyy-mm-dd hh24:mi:ss'), source, L.MESSAGE, condition, sub_cond, a.nbr_value 

FROM  OPS$OCSHIS.MSG16 L, OPS$OCSHIS.MsgAttrs16 A, OPS$OCSHIS.MsgVendors V
 
WHERE L.LocalTime >= sysdate-90 and L.IDX = A.idx and v.event_type=4 and v.attr_name = 'Class' and v.attr_id = a.attr_id and a.nbr_value >= 3000 and a.nbr_value <= 3999;
