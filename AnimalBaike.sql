Create database animalbk;
use animalbk;

/*用户信息表*/
create table `user_info`(
	user_id varchar(11) comment '用户编号',
	user_name varchar(4) comment '用户姓名',
	user_age int comment '用户年龄',
	user_sex varchar(2) comment '用户性别',
	user_tel varchar(32) comment '用户电话',
	user_address varchar(32) comment '用户地址',	
	reserve_field1 varchar(32) comment '保留字段1',	
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(user_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 

INSERT INTO `user_info` VALUES 
 ('test1','黎明','56','男','liming@163.com','北京-北京市-房山区','','',''),
 ('test2','宋小宝','38','男','songxiaobao@sina.com','重庆-重庆市-大渡口区','','',''),
 ('test3','田亮','36','男','tianliang@163.com','上海-上海市-虹口区','','',''),
 ('test4','爱丽丝','22','女','alice@sina.com','澳门特别行政区-澳门离岛市-澳门离岛','','','');

/*用户登录表*/
create table `user_login`(
	user_id varchar(11) comment '用户编号',
	user_password varchar(32) comment '用户密码',
	user_identity int comment '用户类型：0：管理员，1：普通用户',
	user_regitime datetime comment '用户注册时间',
	reserve_field1 varchar(32) comment '保留字段1',	
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(user_id)
	) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 

INSERT INTO `user_login` VALUES 
 ('qq123456','123456','0','2016-11-02','','',''),
 ('qq7878','123456','1','2017-10-02','','',''),
 ('test1','123456','1','2017-10-02','','',''),
 ('test2','123456','1','2017-10-02','','',''),
 ('test3','123456','1','2017-10-02','','',''),
 ('test4','123456','1','2017-10-02','','','');

/*动物信息表*/
create table `animal_info`(
	animal_id varchar(11) comment '动物编号',
	animal_type varchar(32) comment '动物类型',
	animal_name varchar(255) comment '动物学名',
	animal_englishname varchar(20) comment '动物英文名',
	animal_region varchar(20) comment '动物所属区域',
	animal_fileid varchar(20) comment '动物文件图片id',
	animal_details text comment '动物描述',	
	animal_status varchar(32) comment '动物数据状态',	
	animal_upload_user varchar(32) comment '上传用户',	
	primary key(animal_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 

INSERT INTO `animal_animal` VALUES 
 ('xm1001','马','斑马','banma','中国','asfasfasfbasd55','','',''),
 ('xm1002','马','斑马','banma','中国','asfasfasfbasd55','','',''),
 ('xm1003','马','斑马','banma','中国','asfasfasfbasd55','','',''),
 ('xm1004','马','斑马','banma','中国','asfasfasfbasd55','','','');

/*搜索热度排行榜表*/
create table `seach_heat`(
	seach_id varchar(11) comment '搜索编号',
	animal_id varchar(20) comment '动物编号',
	seach_count int(32) comment '搜索次数',
	reserve_field1 varchar(32) comment '保留字段1',	
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(seach_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 
 
/*动物类别表*/
create table `animal_type`(
	type_id varchar(11) comment '类别id',
	top_category varchar(20) comment '一级分类',
	two_category varchar(20) comment '二级分类',
	three_category varchar(20) comment '三级分类',
	reserve_field1 varchar(32) comment '保留字段1',	
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(type_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 

 /*搜索记录表*/
create table `seach_record`(
	record_id varchar(32) comment '记录id',
	user_id varchar(20) comment '用户id',
	seach_content varchar(255) comment '搜索内容',
	seach_time datetime comment '搜索日期',
	reserve_field1 varchar(32) comment '保留字段1',	
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(record_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 
 
 /*文件信息表*/
create table `file_info`(
	file_id varchar(11) comment '文件id',
	file_type varchar(11) comment '文件类型',
	file_fullpath varchar(20) comment '文件全路径',
	file_name varchar(255) comment '文件名',
	file_size int(32) comment '文件大小',
	upload_time datetime comment '上传时间',
	reserve_field1 varchar(32) comment '保留字段1',	
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(file_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 

 /*公告信息表*/
create table `notice_info`(
	notice_id varchar(11) comment '公告id',
	notice_publisher varchar(20) comment '公告发布者',
	notice_content varchar(255) comment '公告内容',
	release_time datetime comment '发布时间',
	reserve_field1 varchar(32) comment '保留字段1',	
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(notice_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 
 
 /*数据字典表*/
create table `data_library`(
	data_id varchar(11) comment '字典id',
	data_no varchar(20) comment '字典no',
	data_content varchar(32) comment '字典内容',
	remark varchar(32) comment '备注',
	reserve_field1 varchar(32) comment '保留字段1',	
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(data_id,data_no)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 

INSERT INTO `data_library` VALUES 
 ('sendstatus','sendstatus01','正常','该状态标识此条验证码记录状态可用','','',''),
 ('sendstatus','sendstatus03','作废','该状态标识此条验证码记录状态作废','','',''),
 ('animalstatus','animalstatus01','正常','标识该动物可以正常显示','','',''),
 ('animalstatus','animalstatus02','未通过','标识该动物没有通过审核，需要重新发起','','',''),
 ('animalstatus','animalstatus03','作废','标识该动物数据作废','','','');

 /*验证码表*/
create table `code_info`(
	code_id varchar(32) comment '验证码id',
	phone_num varchar(20) comment '手机号',
	code_num varchar(20) comment '验证码',
	code_status varchar(32) comment '状态',
	send_time datetime comment '发送时间',	
	reserve_field1 varchar(32) comment '保留字段1',
	reserve_field2 varchar(32) comment '保留字段2',	
	reserve_field3 varchar(32) comment '保留字段3',	
	primary key(code_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 
