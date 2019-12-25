/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : lab_manager

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 26/12/2019 00:12:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `Pno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Leader` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Funds` float NOT NULL,
  `StartTime` date NOT NULL,
  `EndTime` date NOT NULL,
  `Funds4Teacher` float NULL DEFAULT NULL,
  `Funds4Student` float NULL DEFAULT NULL,
  `Funds4Temporary` float NULL DEFAULT NULL,
  PRIMARY KEY (`Pno`) USING BTREE,
  INDEX `FK_Lead`(`Leader`) USING BTREE,
  INDEX `Pno`(`Pno`) USING BTREE,
  INDEX `Pno_2`(`Pno`) USING BTREE,
  INDEX `Pno_3`(`Pno`) USING BTREE,
  INDEX `Pno_4`(`Pno`) USING BTREE,
  INDEX `Pno_5`(`Pno`) USING BTREE,
  INDEX `Pno_6`(`Pno`) USING BTREE,
  INDEX `Pno_7`(`Pno`) USING BTREE,
  CONSTRAINT `FK_Lead` FOREIGN KEY (`Leader`) REFERENCES `teacher` (`tno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('p00', 't00', '数据库', 1000, '2019-12-01', '2019-12-25', 0.5, 0.3, 0.2);
INSERT INTO `project` VALUES ('p01', 't00', '计组', 500, '2019-12-01', '2019-12-25', 0.4, 0.2, 0.4);
INSERT INTO `project` VALUES ('p02', 't00', '人工智能', 10000, '2019-12-01', '2019-12-31', 0.2, 0.3, 0.5);
INSERT INTO `project` VALUES ('p03', 't01', '运筹学', 5000, '2019-12-01', '2019-12-31', -1, -1, -1);

-- ----------------------------
-- Table structure for s_participate_in_p
-- ----------------------------
DROP TABLE IF EXISTS `s_participate_in_p`;
CREATE TABLE `s_participate_in_p`  (
  `Sno` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Pno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Performance` float NULL DEFAULT NULL,
  `Wage` float NULL DEFAULT NULL,
  `PayTime` date NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`, `Pno`) USING BTREE,
  INDEX `FK_S_Participate_In_P2`(`Pno`) USING BTREE,
  CONSTRAINT `FK_S_Participate_In_P` FOREIGN KEY (`Sno`) REFERENCES `student` (`sno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_S_Participate_In_P2` FOREIGN KEY (`Pno`) REFERENCES `project` (`pno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_participate_in_p
-- ----------------------------
INSERT INTO `s_participate_in_p` VALUES ('s00', 'p00', 90, 90, '2019-12-23');
INSERT INTO `s_participate_in_p` VALUES ('s00', 'p01', 95, 50, '2019-12-23');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Sno` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sex` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Age` int(11) NOT NULL,
  `Dept` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PhoneNum` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Password` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EMail` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`) USING BTREE,
  INDEX `Sno`(`Sno`) USING BTREE,
  INDEX `Sno_2`(`Sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('s00', '学生张三', '男', 20, '信息学院', '188100001000', '000000', 'zhangsan@ruc.edu.cn');

-- ----------------------------
-- Table structure for t_participate_in_p
-- ----------------------------
DROP TABLE IF EXISTS `t_participate_in_p`;
CREATE TABLE `t_participate_in_p`  (
  `Tno` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Pno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Performance` float NULL DEFAULT NULL,
  `Wage` float NULL DEFAULT NULL,
  `PayTime` date NULL DEFAULT NULL,
  PRIMARY KEY (`Tno`, `Pno`) USING BTREE,
  INDEX `FK_T_Participate_In_P2`(`Pno`) USING BTREE,
  CONSTRAINT `FK_T_Participate_In_P` FOREIGN KEY (`Tno`) REFERENCES `teacher` (`tno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_T_Participate_In_P2` FOREIGN KEY (`Pno`) REFERENCES `project` (`pno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_participate_in_p
-- ----------------------------
INSERT INTO `t_participate_in_p` VALUES ('t00', 'p00', 95, 100, '2019-12-26');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `Tno` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sex` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Age` int(11) NOT NULL,
  `Dept` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PhoneNum` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Password` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EMail` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Tno`) USING BTREE,
  INDEX `Tno`(`Tno`) USING BTREE,
  INDEX `Tno_2`(`Tno`) USING BTREE,
  INDEX `Tno_3`(`Tno`) USING BTREE,
  INDEX `Tno_4`(`Tno`) USING BTREE,
  INDEX `Tno_5`(`Tno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('t00', '教师李四', '男', 40, '信息学院', '18810002000', '000000', 'lisi@ruc.edu.cn');
INSERT INTO `teacher` VALUES ('t01', '教师赵四', '男', 35, '信息学院', '18810000909', '000000', 'zhaosi@ruc.edu.cn');

-- ----------------------------
-- Table structure for tem_participate_in_p
-- ----------------------------
DROP TABLE IF EXISTS `tem_participate_in_p`;
CREATE TABLE `tem_participate_in_p`  (
  `Account` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Pno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Performance` float NULL DEFAULT NULL,
  `Wage` float NULL DEFAULT NULL,
  `PayTime` date NULL DEFAULT NULL,
  PRIMARY KEY (`Account`, `Pno`) USING BTREE,
  INDEX `FK_Tem_Participate_In_P2`(`Pno`) USING BTREE,
  CONSTRAINT `FK_Tem_Participate_In_P` FOREIGN KEY (`Account`) REFERENCES `temporary` (`account`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Tem_Participate_In_P2` FOREIGN KEY (`Pno`) REFERENCES `project` (`pno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tem_participate_in_p
-- ----------------------------
INSERT INTO `tem_participate_in_p` VALUES ('tem00', 'p00', 90, 100, '2019-12-26');

-- ----------------------------
-- Table structure for temporary
-- ----------------------------
DROP TABLE IF EXISTS `temporary`;
CREATE TABLE `temporary`  (
  `Account` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sex` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Age` int(11) NOT NULL,
  `IDNum` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNum` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Address` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMail` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Account`) USING BTREE,
  INDEX `Account`(`Account`) USING BTREE,
  INDEX `Account_2`(`Account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of temporary
-- ----------------------------
INSERT INTO `temporary` VALUES ('tem00', '临时王二', '男', 25, '100000000000000000', '18810003000', '000000', '人大', 'wanger@163.com');

-- ----------------------------
-- Table structure for tmp_project
-- ----------------------------
DROP TABLE IF EXISTS `tmp_project`;
CREATE TABLE `tmp_project`  (
  `Pno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Leader` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Funds` float NOT NULL,
  `StartTime` date NOT NULL,
  `EndTime` date NOT NULL,
  `Funds4Teacher` float NULL DEFAULT NULL,
  `Funds4Student` float NULL DEFAULT NULL,
  `Funds4Temporary` float NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tmp_project
-- ----------------------------
INSERT INTO `tmp_project` VALUES ('p00', 't00', '数据库', 1000, '2019-12-01', '2019-12-25', 0.5, 0.3, 0.2);
INSERT INTO `tmp_project` VALUES ('p01', 't00', '计组', 500, '2019-12-01', '2019-12-25', 0.4, 0.2, 0.4);

-- ----------------------------
-- Procedure structure for create_project
-- ----------------------------
DROP PROCEDURE IF EXISTS `create_project`;
delimiter ;;
CREATE PROCEDURE `create_project`(IN `_pno` char(10),IN `_leader` char(20),IN `_name` char(50),IN `_funds` float,IN `_start_time` date,IN `_end_time` date,IN `_t_funds` float,IN `_s_funds` float,IN `_tem_funds` float)
BEGIN
	#Routine body goes here...
	if isnull((select pno from project where project.pno=`_pno`)) then
			INSERT INTO project VALUES(`_pno`,`_leader`,`_name`,`_funds`,`_start_time`,`_end_time`,`_t_funds`,`_s_funds`,`_tem_funds`) ;
	else
		select 'error';
	end if;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_other_project
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_other_project`;
delimiter ;;
CREATE PROCEDURE `get_other_project`(IN `acc` char(20),IN `p_no` char(10),IN `other_acc` char(20),IN `acc_type` char(5))
label:BEGIN
#SELECT * FROM project WHERE project.pno=`p_no` AND project.Leader=`acc` ;

drop table if exists tmp_project;
CREATE TABLE tmp_project AS (SELECT * FROM project WHERE  project.Leader=`acc`);

	#acc_type表示账户类型，s为学生，t为教师，tem为临时雇佣人员
	SET @fulltype = CASE `acc_type`
	WHEN 't' THEN
		'teacher'
	WHEN 's' THEN
	  'student'
	ELSE
		'temporary'
	END;
	
	#ano_type
	SET @a_no = CASE `acc_type`
	WHEN 't' THEN
		'tno'
	WHEN 's' THEN
	  'sno'
	ELSE
		'account'
	END;
	SET @p_no = `p_no`;
	SET @acc = `other_acc`;
	#SELECT @fulltype;
	SET @exist_p_no = IF(`p_no`='#','','tmp_project.pno=@p_no and ');
	#SELECT @exist_p_no;  
	SET @participate = CONCAT(`acc_type`,'_participate_in_p');
	


if `p_no`!='#' then 
#输入pno进行查询
	if isnull((select pno from tmp_project where tmp_project.pno=`p_no`)) then
	#该项目不由此老师负责
		select 'error';
		leave label;		
	elseif `other_acc`!='#' then
	#该项目由此老师负责，并且输入待查人
			SET @strsql = CONCAT('SELECT ',@fulltype,'.name,tmp_project.name,wage,paytime FROM tmp_project,',@fulltype,',',@participate,
	' where ',@exist_p_no,'tmp_project.pno=',@participate,'.pno and ',@participate,'.',@a_no,'=',@fulltype,'.',@a_no,' and ',
	@participate,'.',@a_no,'=','@acc',';');
	    ## 预处理需要执行的动态SQL，其中stmt是一个变量
    PREPARE stmt FROM @strsql;  
    ## 执行SQL语句
    EXECUTE stmt;  
    ## 释放掉预处理段
    deallocate prepare stmt;
	else
	#该项目由此老师负责，不输入待查人
		select student.name ,tmp_project.name,wage,paytime from student,s_participate_in_p,tmp_project where student.sno=s_participate_in_p.sno and s_participate_in_p.pno=tmp_project.pno and tmp_project.pno=`p_no`
		union all
		select teacher.name ,tmp_project.name,wage,paytime from teacher,t_participate_in_p,tmp_project where teacher.tno=t_participate_in_p.tno and t_participate_in_p.pno=tmp_project.pno and tmp_project.pno=`p_no`
		union all
		select temporary.name ,tmp_project.name,wage,paytime from temporary,tem_participate_in_p,tmp_project where temporary.account=tem_participate_in_p.account and tem_participate_in_p.pno=tmp_project.pno and tmp_project.pno=`p_no`;
	
	end if;
else
#不输入pno进行查询
	if `other_acc`!='#' then
	#输入待查人，代码和上面一样的
		SET @strsql = CONCAT('SELECT ',@fulltype,'.name,tmp_project.name,wage,paytime FROM tmp_project,',@fulltype,',',@participate,
	' where ',@exist_p_no,'tmp_project.pno=',@participate,'.pno and ',@participate,'.',@a_no,'=',@fulltype,'.',@a_no,' and ',
	@participate,'.',@a_no,'=','@acc',';');
	    ## 预处理需要执行的动态SQL，其中stmt是一个变量
    PREPARE stmt FROM @strsql;  
    ## 执行SQL语句
    EXECUTE stmt;  
    ## 释放掉预处理段
    deallocate prepare stmt;
	else 
	#不输入待查人，代码也和上面差不多
		select student.name ,tmp_project.name,wage,paytime from student,s_participate_in_p,tmp_project where student.sno=s_participate_in_p.sno and s_participate_in_p.pno=tmp_project.pno
		union all
		select teacher.name ,tmp_project.name,wage,paytime from teacher,t_participate_in_p,tmp_project where teacher.tno=t_participate_in_p.tno and t_participate_in_p.pno=tmp_project.pno
		union all
		select temporary.name ,tmp_project.name,wage,paytime from temporary,tem_participate_in_p,tmp_project where temporary.account=tem_participate_in_p.account and tem_participate_in_p.pno=tmp_project.pno;
	
	end if;
	
end if;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_own_project
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_own_project`;
delimiter ;;
CREATE PROCEDURE `get_own_project`(IN `acc` char(20),IN `acc_type` char(5),IN `p_no` char(10))
BEGIN
	#acc_type表示账户类型，s为学生，t为教师，tem为临时雇佣人员
	SET @fulltype = CASE `acc_type`
	WHEN 't' THEN
		'teacher'
	WHEN 's' THEN
	  'student'
	ELSE
		'temporary'
	END;
	
	#ano_type
	SET @a_no = CASE `acc_type`
	WHEN 't' THEN
		'tno'
	WHEN 's' THEN
	  'sno'
	ELSE
		'account'
	END;
	
	SET @p_no = `p_no`;
	SET @acc = `acc`;
	
	#SELECT @fulltype;
	SET @exist_p_no = IF(`p_no`='#','','project.pno=@p_no and ');
	#SELECT @exist_p_no;  
	SET @participate = CONCAT(`acc_type`,'_participate_in_p');
	
	#动态拼接sql
	SET @strsql = CONCAT('SELECT ',@fulltype,'.name,project.name,wage,paytime FROM project,',@fulltype,',',@participate,
	' where ',@exist_p_no,'project.pno=',@participate,'.pno and ',@participate,'.',@a_no,'=',@fulltype,'.',@a_no,' and ',
	@participate,'.',@a_no,'=','@acc',';');
    ## 预处理需要执行的动态SQL，其中stmt是一个变量
    PREPARE stmt FROM @strsql;  
    ## 执行SQL语句
    EXECUTE stmt;  
    ## 释放掉预处理段
    deallocate prepare stmt;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_student_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_student_password`;
delimiter ;;
CREATE PROCEDURE `get_student_password`(IN `s_no` char(20))
BEGIN
	SELECT `password` FROM student WHERE sno=s_no;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_teacher_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_teacher_password`;
delimiter ;;
CREATE PROCEDURE `get_teacher_password`(IN `t_no` char(20))
BEGIN
	SELECT `password` FROM teacher WHERE tno=t_no;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_temporary_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_temporary_password`;
delimiter ;;
CREATE PROCEDURE `get_temporary_password`(IN `tem_account` char(20))
BEGIN
	SELECT `password` FROM `temporary` WHERE account=tem_account;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
