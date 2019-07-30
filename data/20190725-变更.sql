
DROP TABLE IF EXISTS `kc_stor_valid`;

CREATE TABLE `kc_stor_valid` (
  `MAT_CODE` varchar(32) DEFAULT NULL,
  `MAT_NAME` varchar(64) DEFAULT NULL,
  `MAT_GAUGE` varchar(64) DEFAULT NULL,
  `MAT_UNIT` varchar(16) DEFAULT NULL,
  `DEGREE` double DEFAULT NULL,
  `ACT_NUM` double DEFAULT NULL,
  `IN_NUM` double DEFAULT NULL,
  `OUT_NUM` double DEFAULT NULL,
  `VALIDATE_DATE` datetime DEFAULT NULL,
  `BSN_NO` varchar(128) DEFAULT NULL COMMENT 'SN��',
  `MEMO` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DELIMITER $$



DROP PROCEDURE IF EXISTS `SP_STORVALID_PROC`$$

CREATE DEFINER=`root`@`%` PROCEDURE `SP_STORVALID_PROC`(IN matCode VARCHAR(32),IN validMonth INTEGER)
BEGIN
          DECLARE tempCode VARCHAR(32);
          DECLARE validEndDate DATE;
          DECLARE done INT DEFAULT FALSE;
         
	   -- �α�
	  DECLARE cur CURSOR FOR SELECT mat_code FROM kc_matter_base;
	  -- ��������־�󶨵��α�
	  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
       IF matCode IS NULL THEN       
	  -- ��������	  
	  -- ���α�
	  OPEN cur;
	  -- ��ʼѭ��
	  read_loop: LOOP
	    -- ��ȡ�α�������ݣ�����ֻ��һ��������Ļ�Ҳһ����
	    FETCH cur INTO tempCode;
	    -- ����������ʱ��
	    IF done THEN
	      LEAVE read_loop;
	    END IF;
	    -- ��������������ѭ�����¼�
               CALL SP_GETVALIDSTOR_INFO(tempCode);		
	  END LOOP;
	  -- �ر��α�
	  CLOSE cur;  
	ELSE 	
	--  ִ�м������
	    CALL SP_GETVALIDSTOR_INFO(matCode); 	   
	END IF;
	
	SET validEndDate = DATE_ADD(NOW(), INTERVAL validMonth MONTH);
 
	 SELECT * FROM kc_stor_valid 
	   WHERE 1=1 
	   AND (matCode IS  NULL OR mat_code=matCode)
	   AND (validEndDate IS  NULL OR VALIDATE_DATE<=validEndDate)
	   AND VALIDATE_DATE>=NOW();
	   
	
END$$

DELIMITER ;









DELIMITER $$



DROP PROCEDURE IF EXISTS `SP_GETVALIDSTOR_INFO`$$

CREATE DEFINER=`root`@`%` PROCEDURE `SP_GETVALIDSTOR_INFO`(IN matCode VARCHAR(32))
BEGIN
	DECLARE outNum INT DEFAULT 0;    
	 DECLARE matType VARCHAR(32);
	      
             DELETE FROM kc_stor_valid WHERE mat_code=matCode;
		SELECT `MAT_TYPE` INTO matType FROM `kc_matter_base` WHERE mat_code=matCode;
             
              
	     INSERT INTO \`kc_stor_valid`
		    (`MAT_CODE`,
		     `MAT_NAME`,
		     `MAT_GAUGE`,
		     `MAT_UNIT`,
		     `DEGREE`,
		     `IN_NUM`,
		      VALIDATE_DATE,
		      BSN_NO,
		      MEMO	
		     )
	      SELECT `MAT_CODE`,
		     `MAT_NAME`,
		     `MAT_GAUGE`,
		     `MAT_UNIT`,
		     `DEGREE`,
		     SUM(IN_NUM) AS in_num,
		     VALIDATE_DATE,
		      BSN_NO,
		      MEMO	 
	      FROM \`kc_stor_in`
	       WHERE MAT_CODE=matCode
	       GROUP BY mat_code,BSN_NO,degree; 
	       
         
       IF(STRCMP(matType,'SN')=0) THEN          
		 UPDATE kc_stor_valid a
		 SET out_num=(
		  SELECT  IFNULL(SUM(out_num),0)
		 FROM kc_stor_out b
		 WHERE a.mat_code=b.mat_code 
		 AND a.BSN_NO=b.BSN_NO 
		 AND IFNULL(a.`DEGREE`,'ABC')=IFNULL(b.`DEGREE`,'ABC')
		 ),
		 act_num=in_num-(
		 SELECT IFNULL(SUM(out_num),0) 
		 FROM kc_stor_out b
		 WHERE a.mat_code=b.mat_code 
		 AND a.BSN_NO=b.BSN_NO 
		 AND IFNULL(a.`DEGREE`,'ABC')=IFNULL(b.`DEGREE`,'ABC')
		 )
		 WHERE mat_code=matCode; 
	ELSE 
		  UPDATE kc_stor_valid a
		 SET out_num=(
		 SELECT  IFNULL(SUM(out_num),0) AS out_num
		 FROM kc_storbatch_out b
		 WHERE a.mat_code=b.mat_code 
		  AND a.BSN_NO=b.BSN_NO 
		 ),
		 act_num=in_num-out_num
		 WHERE a.mat_code=matCode; 
		
         END IF;
         
    END$$

DELIMITER ;




DROP TABLE IF EXISTS `kc_sys_menu`;

CREATE TABLE `kc_sys_menu` (
  `MENU_NO` varchar(32) NOT NULL,
  `MENU_NAME` varchar(64) DEFAULT NULL,
  `IFUSE` char(1) DEFAULT NULL,
  `FH_MENU_NO` varchar(32) DEFAULT NULL,
  `FORM_NAME` varchar(100) DEFAULT NULL,
  `MEMO` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`MENU_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `kc_sys_menu` */

insert  into `kc_sys_menu`(`MENU_NO`,`MENU_NAME`,`IFUSE`,`FH_MENU_NO`,`FORM_NAME`,`MEMO`) values ('SYS01000000','��������','1',NULL,NULL,NULL),('SYS01000001','������Ϣ','1','SYS01000000','TFrmMatInfo',NULL),('SYS01000002','��˾����','1','SYS01000000','TFrmCompBase',NULL),('SYS01000003','Ա������','1','SYS01000000','TFrmEmpBase',NULL),('SYS02000000','�ճ�����','1',NULL,NULL,NULL),('SYS02000001','������','1','SYS02000000','TFrmOrderForm',NULL),('SYS02000002','���۵�','1','SYS02000000','TFrmSaleForm',NULL),('SYS03000000','�����ѯ','1',NULL,NULL,NULL),('SYS03000001','����������','1','SYS03000000','TFrmOrderReport',NULL),('SYS03000002','���۵�����','1','SYS03000000','TFrmSaleReport',NULL),('SYS03000003','������Աҵ��','1','SYS03000000','TFrmSalerReport',NULL),('SYS03000004','��Ʒ��ѯ(��)','1','SYS03000000','TFrmMatOrderReport',NULL),('SYS03000005','��Ʒ��ѯ(��)','1','SYS03000000','TFrmMatSaleRepot',NULL),('SYS03000006','����ѯ','1','SYS03000000','TFrmStorInfo',NULL),('SYS03000007','���ڲ�ѯ','1','SYS03000000','TFrmStorValid',NULL),('SYS04000000','�߼�����','1',NULL,NULL,NULL),('SYS04000001','�˺ż�Ȩ�޹���','1','SYS04000000','TFrmAcctManage',NULL);


insert  into `kc_role_permit`(`ROLE_NO`,`PERMIT_NO`,`MEMO`) values ('MANAGE_000','SYS03000007',''),('MANAGE_001','SYS03000007',''),('SALER_0000','SYS03000007',''),('STORLER_0001','SYS03000007','');
