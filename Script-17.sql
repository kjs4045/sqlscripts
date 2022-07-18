INSERT INTO tbl_buy (custon_id,PCODE,quantity,byuno)
VALUES ('sana97', 'GALAXYS22',1,tblbuy_seq.nextval);

SELECT * FROM TBL_BUY tb ;

--commit 과 rollback 테스트 ---
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID ='twice';
DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='twice';

SELECT * FROM TBL_BUY tb ;

SELECT * FROM TBL_CUSTOM tc ;
ROLLBACK;