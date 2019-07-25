DELIMITER $$



DROP PROCEDURE IF EXISTS `SP_ACTSTOR_PROC`$$

CREATE DEFINER=`root`@`%` PROCEDURE `SP_ACTSTOR_PROC`(IN matCode varchar(32))
BEGIN
          declare tempCode varchar(32);
          DECLARE done INT DEFAULT FALSE;
         
	   -- 游标
	  DECLARE cur CURSOR FOR SELECT mat_code FROM kc_matter_base;
	  -- 将结束标志绑定到游标
	  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
       IF matCode is null THEN       
	  -- 遍历数据	  
	  -- 打开游标
	  OPEN cur;
	  -- 开始循环
	  read_loop: LOOP
	    -- 提取游标里的数据，这里只有一个，多个的话也一样；
	    FETCH cur INTO tempCode;
	    -- 声明结束的时候
	    IF done THEN
	      LEAVE read_loop;
	    END IF;
	    -- 这里做你想做的循环的事件
               CALL SP_GETMATSTOR_INFO(tempCode);		
	  END LOOP;
	  -- 关闭游标
	  CLOSE cur;  
	else 	
	--  执行计算过程
	    CALL SP_GETMATSTOR_INFO(matCode); 	   
	end if;
 
	 SELECT * FROM kc_stor_info 
	   WHERE 1=1 
	   and (matCode is  null or mat_code=matCode);
	
END$$

DELIMITER ;



DELIMITER $$



DROP PROCEDURE IF EXISTS `SP_GETMATSTOR_INFO`$$

CREATE DEFINER=`root`@`%` PROCEDURE `SP_GETMATSTOR_INFO`(IN matCode VARCHAR(32))
BEGIN
	DECLARE outNum INT DEFAULT 0;    
	 DECLARE matType VARCHAR(32);
	      
             DELETE FROM kc_stor_info WHERE mat_code=matCode;
		SELECT `MAT_TYPE` INTO matType FROM `kc_matter_base` WHERE mat_code=matCode;
             
              
	     INSERT INTO `kcdb`.`kc_stor_info`
		    (`MAT_CODE`,
		     `MAT_NAME`,
		     `MAT_GAUGE`,
		     `MAT_UNIT`,
		     `DEGREE`,
		     `IN_NUM`	
		     )
	      SELECT `MAT_CODE`,
		     `MAT_NAME`,
		     `MAT_GAUGE`,
		     `MAT_UNIT`,
		     `DEGREE`,
		     SUM(IN_NUM) AS in_num
	      FROM `kcdb`.`kc_stor_in`
	       WHERE MAT_CODE=matCode
	       GROUP BY mat_code,degree; 
	       
         
       IF(STRCMP(matType,'SN')=0) THEN 
         
         UPDATE kc_stor_info a
         SET out_num=(SELECT  IFNULL(SUM(out_num),0)
         FROM kc_stor_out b
         WHERE a.mat_code=b.mat_code 
         AND IFNULL(a.`DEGREE`,'ABC')=IFNULL(b.`DEGREE`,'ABC')),act_num=in_num-(SELECT IFNULL(SUM(out_num),0) 
         FROM kc_stor_out b
         WHERE a.mat_code=b.mat_code 
         AND IFNULL(a.`DEGREE`,'ABC')=IFNULL(b.`DEGREE`,'ABC'))
         WHERE mat_code=matCode; 
	ELSE 
		  UPDATE kc_stor_info a
		 SET out_num=(SELECT  IFNULL(SUM(out_num),0) AS out_num
		 FROM kc_storbatch_out 
		 WHERE mat_code=matCode ),
		 act_num=in_num-out_num
		 WHERE a.mat_code=matCode; 
		
         END IF;
         
    END$$

DELIMITER ;