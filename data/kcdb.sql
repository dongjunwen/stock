/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.0.96-community-nt : Database - kcdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kcdb` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `kcdb`;

/*Table structure for table `kc_comp_base` */

DROP TABLE IF EXISTS `kc_comp_base`;

CREATE TABLE `kc_comp_base` (
  `COMP_NO` varchar(32) NOT NULL,
  `COMP_NAME` varchar(128) default NULL,
  `HOME_PAGE` varchar(64) default NULL,
  `COMP_PRESENT` varchar(32) default NULL,
  `COMP_TYPE` varchar(2) default NULL,
  `ADDRESS` varchar(64) default NULL,
  `TEL` varchar(16) default NULL,
  `CONTACT` varchar(32) default NULL,
  `MOBILE` varchar(16) default NULL,
  `COMP_MAIL_ADDR` varchar(32) default NULL,
  `OPEN_BANK` varchar(64) default NULL,
  `COMP_ACCT` varchar(32) default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`COMP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `kc_comp_base` */

insert  into `kc_comp_base`(`COMP_NO`,`COMP_NAME`,`HOME_PAGE`,`COMP_PRESENT`,`COMP_TYPE`,`ADDRESS`,`TEL`,`CONTACT`,`MOBILE`,`COMP_MAIL_ADDR`,`OPEN_BANK`,`COMP_ACCT`,`MEMO`) values ('BAI.DU','百度公司','www.baidu.com','李彦宏',NULL,'北京中关村','182399909','小李','1222221','dsdsdas@qq.com','中国银行eeee','8787877878',NULL),('KANG.CHANG','康畅商贸','www.baidu.com','小李飞刀',NULL,'上海虹桥','021-889755444','小李','1129564411','qqq@qq.con','招商银行eeee9090','722222222',NULL),('SHUN.FA','顺发科技','www.shunfa.com','周润发',NULL,'上海康庄','021-98893333','小周','12213322323','sddsf@163.com8898998','上海浦发银行ee909009','2232322323',NULL),('YI.POU','上海一抔科技','www.yipou.com','李连杰',NULL,'上海虹口','021-22389987','小王','1287678839','qqq@qq.com','中国建设银行0990','988899999',NULL);

/*Table structure for table `kc_emp_base` */

DROP TABLE IF EXISTS `kc_emp_base`;

CREATE TABLE `kc_emp_base` (
  `EMP_NO` varchar(32) NOT NULL,
  `EMP_NAME` varchar(64) default NULL,
  `GENDER` char(1) default NULL,
  `BIRTH_DAY` date default NULL,
  `MOBILE` varchar(16) default NULL,
  `ADDR` varchar(64) default NULL,
  `EMAIL` varchar(64) default NULL,
  `ID_NO` varchar(64) default NULL,
  `BANK_NAME` varchar(64) default NULL,
  `BANK_ACCT` varchar(64) default NULL,
  `JOIN_DATE` datetime default NULL,
  `IF_LEAVE` char(1) default NULL,
  `LEAVE_DATE` date default NULL,
  `EMP_TYPE` varchar(2) default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`EMP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `kc_emp_base` */

insert  into `kc_emp_base`(`EMP_NO`,`EMP_NAME`,`GENDER`,`BIRTH_DAY`,`MOBILE`,`ADDR`,`EMAIL`,`ID_NO`,`BANK_NAME`,`BANK_ACCT`,`JOIN_DATE`,`IF_LEAVE`,`LEAVE_DATE`,`EMP_TYPE`,`MEMO`) values ('hong','hong  ','女','2014-12-02','22112','sdssdds','ssdss','sddssd','dsds','sdds','2014-12-10 00:00:00',NULL,'2014-12-02',NULL,NULL),('lisi','李四','男','2014-12-09','187663333222','巍峨嗡嗡嗡','sddsds@qq.comeeee','909090','9090','099090',NULL,NULL,NULL,NULL,NULL),('zhangsan','张三','男','2014-12-31','15865522323','上海虹口道场','111@qq.comeee','343433443','9090','9090','2014-12-17 00:00:00',NULL,'2015-01-02',NULL,NULL);

/*Table structure for table `kc_login_base` */

DROP TABLE IF EXISTS `kc_login_base`;

CREATE TABLE `kc_login_base` (
  `LOGIN_NO` varchar(32) NOT NULL,
  `PASS_WORD` varchar(512) default NULL,
  `NICK_NAME` varchar(64) default NULL,
  `STATUS` char(1) default NULL,
  `LAST_LOGIN_TIME` datetime default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`LOGIN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `kc_login_base` */

insert  into `kc_login_base`(`LOGIN_NO`,`PASS_WORD`,`NICK_NAME`,`STATUS`,`LAST_LOGIN_TIME`,`MEMO`) values ('ADMIN','ADMIN','管理员','1',NULL,'管理员');

/*Table structure for table `kc_matter_base` */

DROP TABLE IF EXISTS `kc_matter_base`;

CREATE TABLE `kc_matter_base` (
  `MAT_CODE` varchar(32) NOT NULL,
  `MAT_NAME` varchar(64) default NULL,
  `MAT_GAUGE` varchar(64) default NULL,
  `MAT_UNIT` varchar(12) default NULL,
  `MAT_TYPE` varchar(12) default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`MAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `kc_matter_base` */

insert  into `kc_matter_base`(`MAT_CODE`,`MAT_NAME`,`MAT_GAUGE`,`MAT_UNIT`,`MAT_TYPE`,`MEMO`) values ('chi.zi','尺子','大号','把','批号',NULL),('jian.dao','剪刀','sasas','把','批号','899889'),('mian.mo','面膜','小号','袋','批号',''),('ping.zi','瓶子','asas','个','SN',''),('zhi.zhang','纸张','asassa','袋','SN','89898998');

/*Table structure for table `kc_stor_in` */

DROP TABLE IF EXISTS `kc_stor_in`;

CREATE TABLE `kc_stor_in` (
  `STOR_IN_NO` varchar(32) NOT NULL,
  `BSN_NO` varchar(128) NOT NULL,
  `MAT_CODE` varchar(32) default NULL,
  `MAT_NAME` varchar(64) default NULL,
  `MAT_GAUGE` varchar(64) default NULL,
  `MAT_UNIT` varchar(16) default NULL,
  `IN_NUM` double default NULL,
  `VALIDATE_DATE` datetime default NULL,
  `DEGREE` double default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`BSN_NO`,`STOR_IN_NO`),
  UNIQUE KEY `STOR_INDEX_01` (`BSN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='入库信息表';

/*Data for the table `kc_stor_in` */

insert  into `kc_stor_in`(`STOR_IN_NO`,`BSN_NO`,`MAT_CODE`,`MAT_NAME`,`MAT_GAUGE`,`MAT_UNIT`,`IN_NUM`,`VALIDATE_DATE`,`DEGREE`,`MEMO`) values ('STRIN20141230753','1223343434','jian.dao','剪刀','sasas','把',1,'2014-12-25 00:00:00',NULL,NULL),('STRIN20141221335','6954708000029','mian.mo','面膜','小号','袋',88,'2014-12-02 00:00:00',NULL,NULL),('STRIN20141221433','9787536689985','ping.zi','瓶子','asas','12',1,'2014-12-30 00:00:00',34,NULL),('STRIN20141221433','9787542851222','ping.zi','瓶子','asas','12',1,'2014-12-30 00:00:00',34,NULL),('STRIN20141221433','9787560013466','ping.zi','瓶子','asas','12',1,'2014-12-30 00:00:00',34,NULL),('STRIN20141221433','9787564209520','ping.zi','瓶子','asas','12',1,'2014-12-30 00:00:00',34,NULL),('STRIN20141221433','eesdsdsd','ping.zi','瓶子','asas','12',1,'2014-12-10 00:00:00',34,NULL),('STRIN20141230753','qwdqweqw','jian.dao','剪刀','sasas','把',2,'2014-05-06 00:00:00',NULL,NULL),('STRIN20141230753','sdasdzxzx1212','jian.dao','剪刀','sasas','把',1,'2014-12-25 00:00:00',NULL,NULL),('STRIN20141230753','sdssdds','jian.dao','剪刀','sasas','把',2,'2014-05-01 00:00:00',NULL,NULL),('STRIN20141230753','wewewewe','jian.dao','剪刀','sasas','把',2,'2015-01-08 00:00:00',NULL,NULL);

/*Table structure for table `kc_stor_info` */

DROP TABLE IF EXISTS `kc_stor_info`;

CREATE TABLE `kc_stor_info` (
  `MAT_CODE` varchar(32) default NULL,
  `MAT_NAME` varchar(64) default NULL,
  `MAT_GAUGE` varchar(64) default NULL,
  `MAT_UNIT` varchar(16) default NULL,
  `DEGREE` double default NULL,
  `ACT_NUM` double default NULL,
  `IN_NUM` double default NULL,
  `OUT_NUM` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `kc_stor_info` */

insert  into `kc_stor_info`(`MAT_CODE`,`MAT_NAME`,`MAT_GAUGE`,`MAT_UNIT`,`DEGREE`,`ACT_NUM`,`IN_NUM`,`OUT_NUM`) values ('jian.dao','剪刀','sasas','把',NULL,8,8,0),('mian.mo','面膜','小号','袋',NULL,32,88,56),('ping.zi','瓶子','asas','12',34,3,5,2);

/*Table structure for table `kc_stor_out` */

DROP TABLE IF EXISTS `kc_stor_out`;

CREATE TABLE `kc_stor_out` (
  `STOR_OUT_NO` varchar(32) NOT NULL,
  `BSN_NO` varchar(128) NOT NULL,
  `STOR_IN_NO` varchar(32) default NULL,
  `MAT_CODE` varchar(32) default NULL,
  `MAT_NAME` varchar(64) default NULL,
  `MAT_GAUGE` varchar(64) default NULL,
  `MAT_UNIT` varchar(16) default NULL,
  `OUT_NUM` double default NULL,
  `DEGREE` double default NULL,
  `VALIDATE_DATE` datetime default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`STOR_OUT_NO`,`BSN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='出库信息表';

/*Data for the table `kc_stor_out` */

insert  into `kc_stor_out`(`STOR_OUT_NO`,`BSN_NO`,`STOR_IN_NO`,`MAT_CODE`,`MAT_NAME`,`MAT_GAUGE`,`MAT_UNIT`,`OUT_NUM`,`DEGREE`,`VALIDATE_DATE`,`MEMO`) values ('STROUT20141223493','9787536689985','STRIN20141221433','ping.zi','瓶子','asas','个',1,34,'2014-12-30 00:00:00',NULL),('STROUT20141223493','9787542851222','STRIN20141221433','ping.zi','瓶子','asas','个',1,34,'2014-12-30 00:00:00',NULL),('STROUT20141223958','6954708000029','STRIN20141221335','mian.mo','面膜','小号','袋',56,NULL,'2014-05-01 00:00:00',NULL);

/*Table structure for table `pur_order_base` */

DROP TABLE IF EXISTS `pur_order_base`;

CREATE TABLE `pur_order_base` (
  `ORDER_NO` varchar(32) NOT NULL,
  `ORDER_DATE` date default NULL,
  `SUP_CODE` varchar(32) default NULL,
  `INVOICE_NUM` varchar(64) default NULL,
  `AMOUNT` double default NULL,
  `COMP_ACCT` varchar(32) default NULL,
  `ADDRESS` varchar(64) default NULL,
  `TEL` varchar(16) default NULL,
  `CONTACT` varchar(32) default NULL,
  `INSERT_TIME` datetime default NULL,
  `LAST_UPT_TIME` datetime default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`ORDER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='购货单信息表';

/*Data for the table `pur_order_base` */

insert  into `pur_order_base`(`ORDER_NO`,`ORDER_DATE`,`SUP_CODE`,`INVOICE_NUM`,`AMOUNT`,`COMP_ACCT`,`ADDRESS`,`TEL`,`CONTACT`,`INSERT_TIME`,`LAST_UPT_TIME`,`MEMO`) values ('P2014121423','2014-12-25','KANG.CHANG','额额外热文',192,'722222222','上海虹桥','021-889755444','小李',NULL,NULL,NULL),('P2014121431','2014-12-14',NULL,'所得税法大地上',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('P2014121434','2014-12-02',NULL,'SAAAAA001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('P2014121488','2014-12-14',NULL,'sdsd1231221',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p20141221470','2014-12-10','KANG.CHANG','556566556',2043.96,'722222222','上海虹桥','021-889755444','小李',NULL,NULL,NULL),('p20141230137','2014-12-29','SHUN.FA','sdssdsdsd',NULL,'2232322323','上海康庄','021-98893333','小周',NULL,NULL,NULL),('p20141230168','2014-12-17','SHUN.FA','sddsdssd',NULL,'2232322323','上海康庄','021-98893333','小周',NULL,NULL,NULL),('p20141230210','2014-12-25','BAI.DU','weewe',NULL,'8787877878','北京中关村','182399909','小李',NULL,NULL,NULL),('p20141230287','2014-12-25','KANG.CHANG','6567677667',NULL,'722222222','上海虹桥','021-889755444','小李',NULL,NULL,NULL),('p20141230370','2014-12-25','YI.POU','yuuyyuuyyu',NULL,'988899999','上海虹口','021-22389987','小王',NULL,NULL,NULL),('p20141230416','2014-12-26','BAI.DU','qwqwqwqw',NULL,'8787877878','北京中关村','182399909','小李',NULL,NULL,NULL),('p20141230442','2014-12-25','BAI.DU','23232323',NULL,'8787877878','北京中关村','182399909','小李',NULL,NULL,NULL),('p20141230453','2014-12-25','BAI.DU','wewew',NULL,'8787877878','北京中关村','182399909','小李',NULL,NULL,NULL),('p20141230499','2014-12-19','BAI.DU',NULL,NULL,'8787877878','北京中关村','182399909','小李',NULL,NULL,NULL),('p20141230505','2014-12-18','SHUN.FA','ewweweewew',NULL,'2232322323','上海康庄','021-98893333','小周',NULL,NULL,NULL),('p20141230507','2015-01-02','YI.POU','wewee',NULL,'988899999','上海虹口','021-22389987','小王',NULL,NULL,NULL),('p20141230536','2014-12-27','BAI.DU','wwewe',NULL,'8787877878','北京中关村','182399909','小李',NULL,NULL,NULL),('p2014123057','2014-12-31','BAI.DU','wwewewewe',NULL,'8787877878','北京中关村','182399909','小李',NULL,NULL,NULL),('p20141230574','2014-12-18','KANG.CHANG','sewew',NULL,'722222222','上海虹桥','021-889755444','小李',NULL,NULL,NULL),('p20141230577','2015-01-19','YI.POU','wescxcxcxc',NULL,'988899999','上海虹口','021-22389987','小王',NULL,NULL,NULL),('p20141230602','2014-12-17','KANG.CHANG','dssddsds',NULL,'722222222','上海虹桥','021-889755444','小李',NULL,NULL,NULL),('p20141230634','2014-12-17','KANG.CHANG','wewewewe',NULL,'722222222','上海虹桥','021-889755444','小李',NULL,NULL,NULL),('p201412307','2014-12-18','BAI.DU','wewewewewe',NULL,'8787877878','北京中关村','182399909','小李',NULL,NULL,NULL),('p20141230897','2014-12-17','YI.POU','wewwewe',NULL,'988899999','上海虹口','021-22389987','小王',NULL,NULL,NULL),('p20141230930','2014-12-11','KANG.CHANG','12121212',NULL,'722222222','上海虹桥','021-889755444','小李',NULL,NULL,NULL);

/*Table structure for table `pur_order_dtl` */

DROP TABLE IF EXISTS `pur_order_dtl`;

CREATE TABLE `pur_order_dtl` (
  `ORDER_NO` varchar(32) NOT NULL,
  `STOR_IN_NO` varchar(32) NOT NULL,
  `MAT_CODE` varchar(32) default NULL,
  `MAT_NAME` varchar(64) default NULL,
  `MAT_GAUGE` varchar(64) default NULL,
  `MAT_UNIT` varchar(16) default NULL,
  `ORDER_NUM` double default NULL,
  `PRICE` double default NULL,
  `AMOUNT` double default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`ORDER_NO`,`STOR_IN_NO`),
  UNIQUE KEY `STOR_INDEX_02` (`STOR_IN_NO`,`MAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='购货单详细信息表';

/*Data for the table `pur_order_dtl` */

insert  into `pur_order_dtl`(`ORDER_NO`,`STOR_IN_NO`,`MAT_CODE`,`MAT_NAME`,`MAT_GAUGE`,`MAT_UNIT`,`ORDER_NUM`,`PRICE`,`AMOUNT`,`MEMO`) values ('P2014121423','STRIN20141230753','jian.dao','剪刀','sasas','把',8,24,192,'232323'),('p20141221470','STRIN20141221335','mian.mo','面膜','小号','袋',88,20.67,1818.96,NULL),('p20141221470','STRIN20141221433','ping.zi','瓶子','asas','12',5,45,225,'12');

/*Table structure for table `pur_sale_base` */

DROP TABLE IF EXISTS `pur_sale_base`;

CREATE TABLE `pur_sale_base` (
  `ORDER_NO` varchar(32) NOT NULL,
  `ORDER_DATE` date default NULL,
  `CUST_CODE` varchar(32) default NULL,
  `ADDRESS` varchar(64) default NULL,
  `TEL` varchar(16) default NULL,
  `CONTACT` varchar(32) default NULL,
  `SALER` varchar(64) default NULL,
  `AMOUNT` double default NULL,
  `PROFIT` double default NULL,
  `LOGIST_NUM` varchar(32) default NULL,
  `INSERT_TIME` datetime default NULL,
  `LAST_UPT_TIME` datetime default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`ORDER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='销售单信息表';

/*Data for the table `pur_sale_base` */

insert  into `pur_sale_base`(`ORDER_NO`,`ORDER_DATE`,`CUST_CODE`,`ADDRESS`,`TEL`,`CONTACT`,`SALER`,`AMOUNT`,`PROFIT`,`LOGIST_NUM`,`INSERT_TIME`,`LAST_UPT_TIME`,`MEMO`) values ('S20141221251','2014-12-23','SHUN.FA','上海康庄','021-98893333','小周','hong',48,42,NULL,NULL,NULL,NULL),('S20141221794','2014-12-17','BAI.DU','北京中关村','182399909','小李','lisi',184,176,'wewe',NULL,NULL,NULL),('S20141221884','2014-12-23','YI.POU','上海虹口','021-22389987','小王','lisi',1232,112,'wewewe',NULL,NULL,NULL),('S20141230256','2014-12-16','SHUN.FA','上海康庄','021-98893333','小周','hong',NULL,NULL,'weweweweewwe',NULL,NULL,NULL),('S20141230998','2014-12-24','KANG.CHANG','上海虹桥','021-889755444','小李','hong',NULL,NULL,'weweew121221',NULL,NULL,NULL);

/*Table structure for table `pur_sale_dtl` */

DROP TABLE IF EXISTS `pur_sale_dtl`;

CREATE TABLE `pur_sale_dtl` (
  `SALE_NO` varchar(32) NOT NULL,
  `STOR_OUT_NO` varchar(32) NOT NULL,
  `MAT_CODE` varchar(32) default NULL,
  `MAT_NAME` varchar(64) default NULL,
  `MAT_GAUGE` varchar(64) default NULL,
  `MAT_UNIT` varchar(16) default NULL,
  `ORDER_NUM` double default NULL,
  `STOR_PRICE` double default NULL,
  `SALE_PRICE` double default NULL,
  `AMOUNT` double default NULL,
  `SALE_PROFIT` double default NULL,
  `INVOICE_NUM` double default NULL,
  `ACT_AMOUNT` double default NULL,
  `MEMO` varchar(512) default NULL,
  PRIMARY KEY  (`SALE_NO`,`STOR_OUT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='销售单详细信息表';

/*Data for the table `pur_sale_dtl` */

insert  into `pur_sale_dtl`(`SALE_NO`,`STOR_OUT_NO`,`MAT_CODE`,`MAT_NAME`,`MAT_GAUGE`,`MAT_UNIT`,`ORDER_NUM`,`STOR_PRICE`,`SALE_PRICE`,`AMOUNT`,`SALE_PROFIT`,`INVOICE_NUM`,`ACT_AMOUNT`,`MEMO`) values ('S20141221251','STROUT20141223493','ping.zi','瓶子','asas','个',2,24,45,48,42,23,23,NULL),('S20141221794','STROUT20141221493','mian.mo','面膜','小号','袋',8,23,45,184,176,2,110,NULL),('S20141221884','STROUT20141223958','mian.mo','面膜','小号','袋',56,22,24,1232,112,56,156,NULL);

/* Procedure structure for procedure `SP_ACTSTOR_PROC` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_ACTSTOR_PROC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTSTOR_PROC`(IN matCode varchar(32))
BEGIN
          declare tempCode varchar(32);
          DECLARE done INT DEFAULT FALSE;
	   -- 游标
	  DECLARE cur CURSOR FOR SELECT mat_code FROM kc_matter_base;
	  -- 将结束标志绑定到游标
	  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        if matCode='' then    
        
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
	   SELECT * FROM `kc_stor_info`;          
	else 
	
	--  asdjldasj
	    CALL SP_GETMATSTOR_INFO(matCode);
	  select * from `kc_stor_info` where mat_code=matCode;
	   
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_GETMATSTOR_INFO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_GETMATSTOR_INFO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETMATSTOR_INFO`(IN matCode VARCHAR(32))
BEGIN
	DECLARE outNum int default 0;    
	     
             delete from kc_stor_info where mat_code=matCode;
              
	     INSERT INTO `kcdb`.`kc_stor_info`
		    (`MAT_CODE`,
		     `MAT_NAME`,
		     `MAT_GAUGE`,
		     `MAT_UNIT`,
		     `DEGREE`,
		     `IN_NUM`)
	      select `MAT_CODE`,
		     `MAT_NAME`,
		     `MAT_GAUGE`,
		     `MAT_UNIT`,
		     `DEGREE`,
		     sum(IN_NUM) as in_num
	      from `kcdb`.`kc_stor_in`
	       where MAT_CODE=matCode
	       GROUP BY mat_code,degree; 
	       
         select sum(out_num) into outNum 
         from `kc_stor_out` 
         where mat_code=matCode 
         group by mat_code,degree;
         
         update kc_stor_info 
         set out_num=outNum,act_num=in_num-out_num 
         WHERE mat_code=matCode; 
	       
       
    END */$$
DELIMITER ;

/*Table structure for table `v_cust_total` */

DROP TABLE IF EXISTS `v_cust_total`;

/*!50001 DROP VIEW IF EXISTS `v_cust_total` */;
/*!50001 DROP TABLE IF EXISTS `v_cust_total` */;

/*!50001 CREATE TABLE  `v_cust_total`(
 `cust_code` varchar(32) ,
 `actAmount` double 
)*/;

/*View structure for view v_cust_total */

/*!50001 DROP TABLE IF EXISTS `v_cust_total` */;
/*!50001 DROP VIEW IF EXISTS `v_cust_total` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cust_total` AS (select `a`.`CUST_CODE` AS `cust_code`,sum(`b`.`ACT_AMOUNT`) AS `actAmount` from (`pur_sale_base` `a` join `pur_sale_dtl` `b` on((`a`.`ORDER_NO` = `b`.`SALE_NO`))) group by `a`.`CUST_CODE`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
