-- 创建网上书店数据库
DROP database IF EXISTS `bookstore`;
create database bookstore
default character set utf8;
use bookstore;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books （图书表）
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `ISBN` varchar(20) NOT NULL,
  `bname` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `price` decimal(20,0) NOT NULL,
  `press` varchar(50) NOT NULL,
  `pages` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `FK_belong` (`press`),
  CONSTRAINT `FK_belong` FOREIGN KEY (`press`) REFERENCES `press` (`press`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('978-7-04-040664-1', '数据库系统概论', '王珊', '42', '西安交通大学出版社', '417');
INSERT INTO `books` VALUES ('978-7-5101-3674-0', '三国演义', '罗贯中', '20', '人民文学出版社', '3621');
INSERT INTO `books` VALUES ('978-7-5164-1147-6', '红楼梦', '曹雪芹', '30', '人民教育出版社', '6993');
INSERT INTO `books` VALUES ('978-7-5402-4439-2', '人间失格', '太宰治', '30', '中国友谊出版公司', '713');
INSERT INTO `books` VALUES ('978-7-5422-4811-4', '活着', '余华', '19', '作家出版社', '766');
INSERT INTO `books` VALUES ('978-7-5449-7147-8', '水浒传', '施耐庵', '20', '人民教育出版社', '6336');
INSERT INTO `books` VALUES ('978-7-5472-3193-5', '梦的解析', '弗洛伊德', '38', '科学出版社', '1813');
INSERT INTO `books` VALUES ('978-7-5492-3192-5', '计算机网络', '谢希仁', '27', '北京邮电大学出版社', '426');
INSERT INTO `books` VALUES ('978-7-5492-3193-5', '西游记', '吴承恩', '50', '人民教育出版社', '4459');
INSERT INTO `books` VALUES ('978-7-5492-3293-6', '白夜行', '东野圭吾', '42', '人民文学出版社', '2337');

-- ----------------------------
-- Table structure for b_staff （书店职员表）
-- ----------------------------
DROP TABLE IF EXISTS `b_staff`;
CREATE TABLE `b_staff` (
  `S_id` int(11) NOT NULL,
  `S_name` varchar(50) NOT NULL,
  `S_num` decimal(20,0) NOT NULL,
  `S_class` varchar(50) NOT NULL,
  PRIMARY KEY (`S_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_staff
-- ----------------------------
INSERT INTO `b_staff` VALUES ('1', '张杨', '13978845241', '系统管理员');
INSERT INTO `b_staff` VALUES ('2', '李丽', '15428755390', '系统管理员');
INSERT INTO `b_staff` VALUES ('3', '李进步', '13690722487', '职员');
INSERT INTO `b_staff` VALUES ('4', '刘念念', '19725684231', '职员');
INSERT INTO `b_staff` VALUES ('5', '田祺瑞', '13740976368', '职员');
INSERT INTO `b_staff` VALUES ('6', '徐阳羽', '15805973685', '职员');
INSERT INTO `b_staff` VALUES ('7', '张阳辉', '13686387791', '职员');
INSERT INTO `b_staff` VALUES ('8', '杨建木', '18275455270', '职员');
INSERT INTO `b_staff` VALUES ('9', '熊嘉欣', '17800165249', '职员');

-- ----------------------------
-- Table structure for dc  （配送公司表）
-- ----------------------------
DROP TABLE IF EXISTS `dc`;
CREATE TABLE `dc` (
  `DC_person` varchar(50) NOT NULL,
  `DC_name` varchar(50) NOT NULL,
  `DC_address` varchar(50) NOT NULL,
  `DC_num` decimal(20,0) NOT NULL,
  `DC_email` varchar(50) NOT NULL,
  `DC_id` int(11) NOT NULL,
  PRIMARY KEY (`DC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc
-- ----------------------------
INSERT INTO `dc` VALUES ('吕乐成', '武汉中百物流配送有限公司', '湖北省武汉市东西湖区六顺路特1号', '15029044891', 'zhongbai@zhongbai.com', '1');
INSERT INTO `dc` VALUES ('石弘文', '武汉世通物流股份有限公司', '湖北省武汉市洪山区解放大道2022', '18677542343', '31672653@qq.com', '2');
INSERT INTO `dc` VALUES ('潘元亮', '武汉飞狮物流配送有限公司', '湖北省武汉市东西湖区', '13078860437', '2651787446@qq.com', '3');

-- ----------------------------
-- Table structure for d_distribution  （配送单表）
-- ----------------------------
DROP TABLE IF EXISTS `d_distribution`;
CREATE TABLE `d_distribution` (
  `D_id` int(11) NOT NULL,
  `O_id` int(11) NOT NULL,
  `bname` varchar(50) NOT NULL,
  `bnum` decimal(10,0) NOT NULL,
  `R_name` varchar(50) NOT NULL,
  `R_num` decimal(20,0) NOT NULL,
  `R_address` varchar(50) NOT NULL,
  `D_status` varchar(50) NOT NULL,
  PRIMARY KEY (`D_id`),
  KEY `FK_depend` (`O_id`),
  CONSTRAINT `FK_depend` FOREIGN KEY (`O_id`) REFERENCES `orders` (`O_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_distribution
-- ----------------------------
INSERT INTO `d_distribution` VALUES ('1', '1', '三国演义', '1', '唐和雅', '15172568808', '四川省攀枝花盐边县', '未发货');
INSERT INTO `d_distribution` VALUES ('2', '2', '活着', '1', '谭高扬', '13965446768', '湖北湖北省宜昌市西陵区', '已发货');
INSERT INTO `d_distribution` VALUES ('3', '3', '西游记', '2', '萧方雅', '15572276942', '湖北省咸宁市咸安区', '已发货');
INSERT INTO `d_distribution` VALUES ('4', '4', '西游记', '1', '王依玉', '17290294383', '甘肃省兰州市七里河区', '已送到');
INSERT INTO `d_distribution` VALUES ('5', '5', '水浒传', '2', '唐铭', '1938779216', '湖北省襄阳市襄州区', '已发货');
INSERT INTO `d_distribution` VALUES ('6', '6', '三国演义', '2', '王依玉', '17290294383', '甘肃省兰州市七里河区', '已发货');
INSERT INTO `d_distribution` VALUES ('7', '7', '人间失格', '1', '范才俊', '13965590617', '上海市徐汇', '已送到');
INSERT INTO `d_distribution` VALUES ('8', '8', '白夜行', '1', '张静静', '188432675211', '北京市朝阳区', '未发货');
INSERT INTO `d_distribution` VALUES ('9', '9', '数据库系统概论', '2', '何承恩', '15377257916', '河南省洛阳市吉利区', '未发货');
INSERT INTO `d_distribution` VALUES ('10', '10', '梦的解析', '1', '杨芳雨', '15835587182', '广东省深圳南山区', '已发货');
INSERT INTO `d_distribution` VALUES ('11', '11', '白夜行', '1', '谭高扬', '13965446768', '湖北省宜昌市西陵区', '未发货');
INSERT INTO `d_distribution` VALUES ('12', '13', '活着', '1', '易锐锋', '18642977531', '浙江省嘉兴市南湖区', '未发货');

-- ----------------------------
-- Table structure for member  （会员表）
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `M_id` int(11) NOT NULL,
  `M_nickname` varchar(50) NOT NULL,
  `M_gender` varchar(50) NOT NULL,
  `M_age` decimal(10,0) NOT NULL,
  `M_address` varchar(50) NOT NULL,
  `M_name` varchar(50) NOT NULL,
  `M_num` varchar(20) NOT NULL,
  `M_password` varchar(20) NOT NULL,
  `M_level` int(10) NOT NULL,
  `summoney` int(255) DEFAULT NULL,
  PRIMARY KEY (`M_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'Moon', '女', '20', '湖北省襄阳市老河口市', '刘静', '15072265439', '000001', '0', '20');
INSERT INTO `member` VALUES ('2', 'Echo', '女', '16', '甘肃省兰州市七里河区', '王依玉', '17290294383', '000002', '0', '99');
INSERT INTO `member` VALUES ('3', '会飞的鱼', '女', '30', '湖北省咸宁市咸安区', '萧方雅', '15572276942', '000003', '0', '289');
INSERT INTO `member` VALUES ('4', '骑猪看夕阳', '男', '38', '湖北省宜昌市西陵区', '谭高扬', '13965446768', '000004', '3', '10001');
INSERT INTO `member` VALUES ('5', '笨小孩', '女', '27', '北京市朝阳区', '张静静', '188432675211', '000005', '0', '500');
INSERT INTO `member` VALUES ('6', '秃头女孩', '女', '21', '广东省深圳南山区', '杨芳雨', '15835587182', '000006', '0', '261');
INSERT INTO `member` VALUES ('7', '自由如风', '男', '40', '河南省洛阳市吉利区', '何承恩', '15377257916', '000007', '0', '104');
INSERT INTO `member` VALUES ('8', '上善若水', '男', '25', '海南省海口龙华区', '谭高扬', '18265277893', '000008', '0', '90');
INSERT INTO `member` VALUES ('9', '洪荒少女', '女', '15', '四川省攀枝花盐边县', '唐和雅', '15172568808', '000009', '0', '30');
INSERT INTO `member` VALUES ('10', '五行缺钱', '男', '21', '上海市徐汇', '范才俊', '13965590617', '000010', '0', '198');
INSERT INTO `member` VALUES ('11', '风向决定发型', '男', '28', '浙江省嘉兴市南湖区', '易锐锋', '18642977531', '000011', '0', '90');

-- ----------------------------
-- Table structure for message  （留言表）
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `Ms_id` int(20) NOT NULL AUTO_INCREMENT,
  `releaseDate` datetime NOT NULL,
  `content` varchar(200) NOT NULL,
  `M_id` int(11) DEFAULT NULL,
  `Re_content` varchar(200) DEFAULT NULL,
  `S_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ms_id`),
  KEY `FK_issue` (`M_id`),
  KEY `FK_staff` (`S_id`),
  CONSTRAINT `FK_staff` FOREIGN KEY (`S_id`) REFERENCES `b_staff` (`S_id`),
  CONSTRAINT `FK_issue` FOREIGN KEY (`M_id`) REFERENCES `member` (`M_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2019-08-02 10:41:49', '是我想要的书了!', '2', '感谢您的支持！', '3');
INSERT INTO `message` VALUES ('2', '2020-04-02 16:44:03', '书的质量很好哦，爱了爱了。', '4', '感谢您的支持！', '3');
INSERT INTO `message` VALUES ('3', '2020-03-04 22:45:12', '客服太温柔了吧，下次还来。', '8', null, null);

-- ----------------------------
-- Table structure for orders  （订单表）
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ISBN` varchar(20) NOT NULL,
  `O_status` varchar(50) NOT NULL,
  `D_status` varchar(50) NOT NULL,
  `integral` decimal(20,0) NOT NULL,
  `createDate` datetime NOT NULL,
  `payDate` datetime NOT NULL,
  `R_address` varchar(50) NOT NULL,
  `R_num` decimal(20,0) NOT NULL,
  `R_name` varchar(50) NOT NULL,
  `O_id` int(11) NOT NULL,
  `M_id` int(11) NOT NULL,
  PRIMARY KEY (`O_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('978-7-5101-3674-0', '未审核', '未配送', '200', '2020-01-23 16:35:09', '2020-01-23 17:31:30', '四川省攀枝花盐边县', '15172568808', '唐和雅', '1','1');
INSERT INTO `orders` VALUES ('978-7-5101-3674-0', '已审核', '未配送', '183', '2020-04-02 15:37:37', '2020-04-02 18:37:53', '湖北省宜昌市西陵区', '13965446768', '谭高扬', '2','2');
INSERT INTO `orders` VALUES ('978-7-5101-3674-0', '退回', '未配送', '276', '2020-04-22 13:40:02', '2020-04-22 13:40:08', '湖北省咸宁市咸安区', '15572276942', '萧方雅', '3','3');
INSERT INTO `orders` VALUES ('978-7-5101-3674-0', '已处理结束', '已全部送到', '198', '2020-05-12 09:41:49', '2020-05-12 09:41:59', '甘肃省兰州市七里河区', '17290294382', '王依', '4','4');
INSERT INTO `orders` VALUES ('978-7-5101-3674-0', '审核中', '未配送', '210', '2020-06-28 08:43:01', '2020-06-28 13:43:12', '湖北省襄阳市襄州区', '1938779216', '唐铭', '5','5');
INSERT INTO `orders` VALUES ('978-7-5101-3674-0', '已全部配送', '已全部配送', '200', '2020-06-30 16:45:48', '2020-05-12 17:46:01', '甘肃省兰州市七里河区', '17290294383', '王依玉', '6','4');
INSERT INTO `orders` VALUES ('978-7-5101-3674-0', '已处理结束', '已部分配送', '300', '2020-07-01 15:51:26', '2020-07-01 15:51:33', '上海市徐汇', '13965590617', '范才俊', '7','7');
INSERT INTO `orders` VALUES ('978-7-5472-3193-5', '审核中', '未配送', '165', '2020-07-02 09:17:37', '2020-07-02 09:17:45', '北京市朝阳区', '188432675211', '张静静', '8','8');
INSERT INTO `orders` VALUES ('978-7-04-040664-1', '审核中', '未配送', '231', '2020-07-07 09:27:32', '2020-07-07 09:27:37', '河南省洛阳市吉利区', '15377257916', '何承恩', '9','9');
INSERT INTO `orders` VALUES ('978-7-5472-3193-5', '已审核', '已全部配送', '123', '2020-07-07 09:32:30', '2020-07-07 09:32:34', '广东省深圳南山区', '15835587182', '杨芳雨', '10','10');
INSERT INTO `orders` VALUES ('978-7-5492-3293-6', '已审核', '未配送', '156', '2020-07-08 09:38:23', '2020-07-08 09:38:27', '湖北省宜昌市西陵区', '13965446768', '谭高扬', '11','4');
INSERT INTO `orders` VALUES ('978-7-04-040664-1', '退回', '未配送', '231', '2020-07-07 09:40:40', '2020-07-07 09:40:42', '四川省攀枝花盐边县', '15172568808', '唐和雅', '12','12');
INSERT INTO `orders` VALUES ('978-7-5422-4811-4', '审核中', '未配送', '124', '2020-07-07 09:42:16', '2020-07-07 09:42:24', '浙江省嘉兴市南湖区', '18642977531', '易锐锋', '13','13');


-- ----------------------------
-- Table structure for power  （权限表）
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `P_class` varchar(50) NOT NULL,
  `S_id` int(11) NOT NULL,
  `M_id` int(11) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `P_id` int(11) NOT NULL,
  PRIMARY KEY (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('浏览图书信息', '1', '1', '12345', '1');
INSERT INTO `power` VALUES ('修改个人信息', '1', '1', '12345', '2');
INSERT INTO `power` VALUES ('修改个人订单', '1', '1', '12345', '3');

-- ----------------------------
-- Table structure for press  （出版社表）
-- ----------------------------
DROP TABLE IF EXISTS `press`;
CREATE TABLE `press` (
  `P_address` varchar(50) NOT NULL,
  `P_num` decimal(20,0) NOT NULL,
  `P_person` varchar(50) NOT NULL,
  `press` varchar(50) NOT NULL,
  PRIMARY KEY (`press`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of press
-- ----------------------------
INSERT INTO `press` VALUES ('江西省九江九江县', '15072264377', '彭立人', '中国友谊出版公司');
INSERT INTO `press` VALUES ('安徽省芜湖南陵县', '18634629912', '万修永', '人民教育出版社');
INSERT INTO `press` VALUES ('青海省海南贵德县', '13972673091', '蔡丽丽', '人民文学出版社');
INSERT INTO `press` VALUES ('宁夏固原西吉区', '13478226901', '陈华', '作家出版社');
INSERT INTO `press` VALUES ('北京市海淀区', '15428902616', '孔文瑞', '北京邮电大学出版社');
INSERT INTO `press` VALUES ('宁夏省银川西夏区', '18244579025', '曹元思', '科学出版社');
INSERT INTO `press` VALUES ('陕西省西安市碑林区', '13972265928', '杨芳敏', '西安交通大学出版社');



-- -- -- -- -- -- -- -- -- -- 
-- view  视图
-- -- -- -- -- -- -- -- -- -- 
#（1）创建视图MemberInfor, 过滤掉会员信息表的密码列
drop view if exists MemberInfor;
create view MemberInfor as(select M_nickname,M_gender,M_age,M_address,M_name,M_num from member);
select * from MemberInfor where M_age=21;

#（2）用户查询一个特定订单（已知订单号）的详细情况，包括下单时间，订单总金额，订单总体配送状态，订单中每一种图书的ISBN，书名，购买册数、购买单价、购买数量以及金额小计（此图书的购买单价乘以数量），以及此图书的配送状态。
drop view if exists chaxunorders;
create view chaxunorders as(select O_id,createDate,integral,D_status,O_status,orders.ISBN,bname from orders,books where orders.ISBN=books.ISBN);
select * from chaxunorders where O_id = 1;

#（3）网上书店管理员，需查询所有当前已付款、已审核通过、但还没有处理结束的订单ID、会员ID、下单时间、订单总金额、配送状态等信息。
drop view if exists selects;
create view selects as(select O_id,member.M_id,payDate,integral,D_status from orders,member where O_status='已审核' and member.M_id=O_id);
select * from selects;



-- -- -- -- -- -- -- -- -- -- 
-- trigger 触发器
-- -- -- -- -- -- -- -- -- -- 
#（1）更新配送单状态
# 每一次更新某个配送单表的配送状态之后，需要自动更新该配送单中所配送的所有图书在订单明细中的配送状态。注意：一个配送单可能配送多种图书。订单明细中所订购的每种图书都可能分散在多个配送单中进行配送。
# 更新配送单状态，更新订单状态
DROP TRIGGER IF EXISTS `update_D_status`;
DELIMITER ;;
CREATE TRIGGER `update_D_status` AFTER UPDATE ON `d_distribution` FOR EACH ROW BEGIN
	DECLARE dstatus VARCHAR(50);
	DECLARE oid int;
	SELECT D_status INTO dstatus FROM d_distribution WHERE D_id=old.D_id;
	SELECT O_id INTO oid FROM d_distribution WHERE D_id=old.D_id;
	IF dstatus='未发货' THEN
	update orders set D_status='未配送' where O_id=oid;
	update orders set O_status='未配送' where O_id=oid;
	ELSEIF dstatus='已发货' THEN
	update orders set D_status='已全部配送' where O_id=oid;
	update orders set O_status='已全部配送' where O_id=oid;
	ELSEIF dstatus='已送到' THEN
	update orders set D_status='已全部送到' where O_id=oid;
	update orders set O_status='已处理结束' where O_id=oid;
end if;
END
;;
DELIMITER ;

update d_distribution set D_status='已发货' where O_id=11;
update d_distribution set D_status='已送到' where O_id=11;

#（2）更新会员等级（通过更新会员积分）
# 会员提交的订单审核通过以后，系统自动更新该会员的累计购书总额。并根据累计购书总额自动更新会员的等级。
DROP TRIGGER IF EXISTS `update_Level`;
DELIMITER ;;
CREATE TRIGGER `update_Level` AFTER UPDATE ON orders FOR EACH ROW BEGIN
DECLARE sum INT;
select summoney into sum from member where M_num=old.R_num;
update member set summoney=summoney+new.integral where M_num=old.R_num;
if sum>0 and sum<10000 THEN
update member set M_level=0 where M_num=new.R_num;
elseif sum>10000 and sum<20000 THEN
update member set M_level=3 where M_num=new.R_num;
elseif sum>20000 and sum<30000 THEN
update member set M_level=2 where M_num=new.R_num;
elseif sum>30000  THEN
update member set M_level=1 where M_num=new.R_num;
end if;
END
;;
DELIMITER ;
update orders set integral=20000 where O_id=6;


#（3）更新会员等级（通过插入订单记录）
# 使用触发器实现当订单明细表中图书的配送状态更新时候，进行检测。当一个订单中所订购的所有图书的配送状态均为“已全部送到”时，则更新该订单的订单状态为“已处理结束”，
DROP TRIGGER IF EXISTS `update_Level2`;
DELIMITER ;;
CREATE TRIGGER `update_Level2` AFTER insert ON orders FOR EACH ROW BEGIN
DECLARE sum INT;
select summoney into sum from member where M_num=new.R_num;
update member set summoney=summoney+new.integral where M_num=new.R_num;
if sum>0 and sum<10000 THEN
update member set M_level=0 where M_num=new.R_num;
elseif sum>10000 and sum<20000 THEN
update member set M_level=3 where M_num=new.R_num;
elseif sum>20000 and sum<30000 THEN
update member set M_level=2 where M_num=new.R_num;
elseif sum>30000  THEN
update member set M_level=1 where M_num=new.R_num;
end if;
END
;;
DELIMITER ;
insert into orders values('978-7-5101-3674-0','已处理结束', '已部分配送','10000', '2020-07-01 15:51:26', '2020-07-01 15:51:33', 
'上海市徐汇', '13965590617', '范才俊', '16','7');




-- -- -- -- -- -- -- -- -- -- 
-- procedure 存储过程
-- -- -- -- -- -- -- -- -- -- 
#（1）统计某会员在给定期间购买图书的详细情况。包含会员编号、姓名、所购图书ISBN，图书名称，购买年份，数量，应收金额，实收金额。
DROP PROCEDURE IF EXISTS Shopping_list;
CREATE PROCEDURE Shopping_list (start_date datetime, end_date datetime, Mb_id int)
BEGIN
DECLARE Discount float;
DECLARE Me_level int;
DECLARE sum_money float;
SELECT M_level into Me_level from member where M_id = Mb_id;

# 判断折扣
if Me_level = 0 then
	set Discount = 1;
ELSEIF Me_level = 3 then
	set Discount = 0.95;
ELSEIF Me_level = 2 then
	set Discount = 0.90;
ELSEIF Me_level = 1 then
	set Discount = 0.85;
end if;

#给累计购买金额赋值
SELECT SUM(price*Bnum*Discount) into sum_money
from member m, orders o, Books b, D_distribution d 
where m.M_id = o.M_id and o.ISBN = b.ISBN and o.O_id = d.O_id and o.M_id = Mb_id and payDate BETWEEN start_date and end_date;

SELECT m.M_id "会员编号", M_name "姓名", o.ISBN "图书编号", d.bname "图书名称", payDate "购买年份", Bnum "数量", (price*Bnum) "应收金额", (price*Bnum*Discount) "实收金额" 
from member m, orders o, Books b, D_distribution d 
where m.M_id = o.M_id and o.ISBN = b.ISBN and o.O_id = d.O_id and o.M_id = Mb_id and payDate BETWEEN start_date and end_date;
SELECT M_id "会员编号", M_name "姓名", M_level "会员等级", sum_money "累计购买金额"
from member where M_id = Mb_id;
END;

call Shopping_list('2020-03-01 00:00:00', '2020-07-31 00:00:00', 4);


#（2）书店每年需要统计各出版社的图书的销售情况。以了解哪些出版社的图书更受欢迎。编写存储过程汇总每个出版社在指定时间区间内的销售总量（总册数），按年销售册数的降序排列。
DROP PROCEDURE IF EXISTS Sales_ranking;
CREATE PROCEDURE Sales_ranking (start_date datetime, end_date datetime)
BEGIN

SELECT p.press "出版社名称", sum(Bnum) "总册数" 
from d_distribution d, press p, books b, orders o
where p.press = b.press and d.Bname = b.Bname and o.O_id = d.O_id 
and payDate BETWEEN start_date and end_date
GROUP BY p.press order by sum(Bnum) desc;

END;

call Sales_ranking('2020-01-01 00:00:00', '2020-012-31 00:00:00');


#（3）买家发留言或评论
DROP PROCEDURE IF EXISTS Comments;
CREATE PROCEDURE Comments (Mb_id int, Contents varchar(200))
BEGIN
INSERT INTO message (releaseDate, content, M_id)
VALUES (NOW(), Contents, Mb_id);

SELECT * from message;
END;

call Comments(4 ,"这本书送的很快！");


#（4）卖家回复留言
DROP PROCEDURE IF EXISTS Re_Comments;
CREATE PROCEDURE Re_Comments (Msg_id int, Re_Contents varchar(200), St_id int)
BEGIN
UPDATE message SET Re_content = Re_Contents, S_id = St_id WHERE Ms_id = Msg_id;

SELECT * from message;
END;

call Re_Comments(4 ,"谢谢你的好评！", 9);





-- ----------------------------
-- PRIVILEGES structure for sysmanager-张丽
-- cd C:\Program Files\MySQL\MySQL Server 5.7\bin
-- ----------------------------
drop user "13978845241"@"localhost"; 
create user "13978845241"@"localhost" IDENTIFIED by "123456";
GRANT all PRIVILEGES on bookstore.* to "13978845241"@"localhost" IDENTIFIED by "123456";
flush PRIVILEGES;
-- SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;验证查询语句自行使用
-- SELECT * FROM mysql.user WHERE user='13978845241';
-- show grants for "13978845241"@"localhost"; 


-- ----------------------------
-- PRIVILEGES structure for sysmanager-李丽
-- ----------------------------
 drop user "15428755390"@"localhost"; 
create user "15428755390"@"localhost" IDENTIFIED by "123456";
GRANT all PRIVILEGES on bookstore.*  to "15428755390"@"localhost" IDENTIFIED by "123456";
flush PRIVILEGES;
-- SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;验证查询语句自行使用
-- SELECT * FROM mysql.user WHERE user='15428755390';
-- show grants for "15428755390"@"localhost";


-- ----------------------------
-- PRIVILEGES structure for staff-李进步 
-- 登录后可增加新书，修改图书信息，并可以查看和修改所有订单。职员可查看
-- 除会员登陆密码外的所有信息。但不能修改会员信息。
-- ----------------------------
drop user "13690722487"@"localhost"; 
create user "13690722487"@"localhost" IDENTIFIED by "123456";
GRANT insert,update on bookstore.books  to "13690722487"@"localhost" IDENTIFIED by "123456";
GRANT select,update on bookstore.orders  to "13690722487"@"localhost" IDENTIFIED by "123456";
GRANT select(M_id,M_nickname,M_gender,M_age,M_address,M_name,M_num,M_level,summoney) on bookstore.member  to "13690722487"@"localhost" IDENTIFIED by "123456";
flush PRIVILEGES;
-- SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;验证查询语句自行使用
-- SELECT * FROM mysql.user WHERE user='13690722487';
-- show grants for "13690722487"@"localhost";

-- ----------------------------
-- PRIVILEGES structure for staff-李进步 
-- 登录后可增加新书，修改图书信息，并可以查看和修改所有订单。职员可查看
-- 除会员登陆密码外的所有信息。但不能修改会员信息。
-- ----------------------------
drop user "19725684231"@"localhost"; 
create user "19725684231"@"localhost" IDENTIFIED by "123456";
GRANT insert,update on bookstore.books  to "19725684231"@"localhost" IDENTIFIED by "123456";
GRANT select,update on bookstore.orders  to "19725684231"@"localhost" IDENTIFIED by "123456";
GRANT select(M_id,M_nickname,M_gender,M_age,M_address,M_name,M_num,M_level,summoney) on bookstore.member  to "19725684231"@"localhost" IDENTIFIED by "123456";
flush PRIVILEGES;
--  SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;验证查询语句自行使用
-- SELECT * FROM mysql.user WHERE user='19725684231';
-- show grants for "19725684231"@"localhost";





-- -- -- -- -- -- -- -- -- -- 
-- Indexes 索引
-- -- -- -- -- -- -- -- -- -- 
#权限：Power             对权限类型建立索引
-- drop index class on power;
create index class on power(P_class);
#留言: Message           对发布时间建立索引
-- drop index time on message;
create index time on message(releaseDate);
#图书：Books              对书名建立索引
-- drop index b_name on books;
create index b_name on books(bname);
#配送公司：DC             对公司名称建立索引
-- drop index DC_name on DC;
create index DC_name on DC(DC_name);