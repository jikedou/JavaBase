show tables;
create table tbl(id int,name string);
desc tbl;
-- 插入数据会执行MR操作
insert into tbl values(1,'zhangsan');
-- 查询不会
select * from tbl;


----------------hive语句命令----------------

小明
11,小明11,eat-code-play,北京:天安门-上海:黄浦江
12,小明12,eat-code-play,北京:天安门-上海:黄浦江
13,小明13,eat-code-play,北京:天安门-上海:黄浦江
14,小明14,eat-code-play,北京:天安门-上海:黄浦江
15,小明15,eat-code-play,北京:天安门-上海:黄浦江
16,小明16,eat-code-play,北京:天安门-上海:黄浦江
17,小明17,eat-code-play,北京:天安门-上海:黄浦江
18,小明18,eat-code-play,北京:天安门-上海:黄浦江
19,小明19,eat-code-play,北京:天安门-上海:黄浦江
20,小明20,eat-code-play,北京:天安门-上海:黄浦江
21,小明21,eat-code-play,北京:天安门-上海:黄浦江
22,小明22,eat-code-play,北京:天安门-上海:黄浦江
23,小明23,eat-code-lol,huoxing:ooxx



-- DDL
create table psn0(
id int,
name string,
aihao ARRAY<string>,
addr MAP<string,string>
)ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
COLLECTION ITEMS TERMINATED BY "-"
MAP KEYS TERMINATED BY ":";

-- 查看表描述
desc tbl1;
-- 查看更加详细描述
desc formatted tbl1;

-- DML

-- 导入数据
	-- LOCAL是从本地也就是linux文件系统中，不写的话是hdfs路径
	-- OVERWRITE覆盖表的意思
		LOAD DATA [LOCAL] INPATH 'filepath' [OVERWRITE] INTO TABLE tablename
	-- 导入linux文件系统的数据
		LOAD DATA LOCAL INPATH '/var/sxt/test/data'  INTO TABLE psn0;
	-- 导入hdfs的数据
		LOAD DATA INPATH '/data'  INTO TABLE psn0;

-- 总结
-- LOAD DATA方式
	-- 如果数据文件在本地，相当于先上传到hdfs，然后放到表的数据存放目录下边
	-- 如果数据文件在hdfs，相当于把数据文件直接移动到表的数据存放目录下边
	-- LOAD DATA核心本质就是直接对数据文件的一些操作（复制、移动。。。）

-- girlAGED_TABLE  管理表（内部表）

-- 如何创建外部表
	-- 由[EXTERNAL]指定，并且需要手动指定数据文件存放的位置（hdfs上）
create EXTERNAL table psn1(
id int,
name string,
aihao ARRAY<string>,
addr MAP<string,string>
)ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
COLLECTION ITEMS TERMINATED BY "-"
MAP KEYS TERMINATED BY ":"
LOCATION "/psn1";

-- 导数据
LOAD DATA LOCAL INPATH '/var/sxt/test/data'  INTO TABLE psn1;

-- 内部表和外部表区别
	-- 删除
	外部表删除，仅仅把元数据删除了,不会删除数据文件
	内部表删除，元数据和数据文件都删除
	
	内部表是hive自己管理的，删除的时候就全删了

-- 除了内部表和外部表，还有一个叫分区表
	-- 外部表：比如某个公司的原始日志数据存放在一个目录中，多个部门对这些原始数据进行分析，
		-- 那么创建外部表是明智选择，这样原始数据不会被删除；
	-- 内部表：对原始数据或比较重要的中间数据进行建表存储；
	-- 分区表：将每个小时或每天的日志文件进行分区存储，可以针对某个特定时间段做业务分析，而不必分析扫描所有数据；
 [PARTITIONED BY (col_name data_type [COMMENT col_comment], ...)]
	-- 分区的字段不能出现在定义表的语句里，会出现重复
 
create table psn2(
id int,
name string,
aihao ARRAY<string>,
addr MAP<string,string>
)PARTITIONED BY (sex string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
COLLECTION ITEMS TERMINATED BY "-"
MAP KEYS TERMINATED BY ":";


-- 分区表导入数据的方法
LOAD DATA [LOCAL] INPATH 'filepath' [OVERWRITE] INTO TABLE tablename [PARTITION (partcol1=val1, partcol2=val2 ...)]
-- 后边是分区的字段和对应的值
LOAD DATA LOCAL INPATH '/var/sxt/test/data'  INTO TABLE psn2 PARTITION(sex="girl");

-- 创建多个分区
create table psn3(
id int,
name string,
aihao ARRAY<string>,
addr MAP<string,string>
)PARTITIONED BY (sex string,age int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
COLLECTION ITEMS TERMINATED BY "-"
MAP KEYS TERMINATED BY ":";

-- 导入
	-- 分区表导入数据的时候需要制定分区
LOAD DATA LOCAL INPATH '/var/sxt/test/data1'  INTO TABLE psn2 PARTITION(sex="girl",age=1);
	-- 并且注意两个分区字段要相对应
LOAD DATA LOCAL INPATH '/var/sxt/test/data1'  INTO TABLE psn2 PARTITION(sex="girl",age=10);

-- 日志分析
	-- 分区表做查询，对分区字段做过滤，非常快（年月日）

-- 对分区的添加和删除
	ALTER TABLE table_name ADD [IF NOT EXISTS] PARTITION partition_spec [LOCATION 'location'][, PARTITION partition_spec [LOCATION 'location'], ...];
-- 添加分区也要和分区字段对应
	alter table psn3 add partition (sex='girl',age=1);
-- 重名名分区
	ALTER TABLE table_name PARTITION partition_spec RENAME TO PARTITION partition_spec;
	alter table psn3 partition (sex='girl',age=10) rename to partition (sex='girl',age=20);
-- exchange分区
	ALTER TABLE table_name_2 EXCHANGE PARTITION (partition_spec) WITH TABLE table_name_1;
-- 删除分区
	-- 删除的时候不用一一对应，只要满足一个，就可以把所有相关的删除
	ALTER TABLE table_name DROP [IF EXISTS] PARTITION partition_spec[, PARTITION partition_spec, ...]
	-- 会把psn3中所有age=20的数据全部删除掉，不管是哪个分区中的
	alter table psn3 drop partition (age=20);
-- 查询分区信息
	show partitions psntest;

思考
	-- 外部表 分区 删除分区 不会丢失数据？？？
	
	-- 创建表
		create EXTERNAL table psntest(
			id int,
			name string,
			aihao ARRAY<string>,
			addr MAP<string,string>
		)PARTITIONED BY (sex string,age int)
		ROW FORMAT DELIMITED
		FIELDS TERMINATED BY ","
		COLLECTION ITEMS TERMINATED BY "-"
		MAP KEYS TERMINATED BY ":"
		LOCATION "/psntest";
	-- 导入数据
		load data local inpath '/var/sxt/test/data' into table psntest partition(sex='girl',age=20);
	-- 删除分区表
		alter table psntest drop partition(age=10);
	--结论 
		1.查看数据发现，select查不到，但是在hdfs里边数据还在
		2.可以通过添加分区，使数据恢复出来
			alter table psntest add partition (sex='girl',age=10);
	
-- 创建表的其他方式
	1.Create Table Like
		-- 参照上一个表创建一个新表（表结构一致，但是新表没有数据）
		-- 创建中间表或者临时表非常方便
		CREATE TABLE empty_key_value_store LIKE key_value_store
		create table psn4 like psn3;
	2.Create Table As Select (CTAS)
		-- 将数据导入到中间表或者临时表中也很方便
		CREATE TABLE new_key_value_store AS SELECT (key % 1024) new_key, concat(key, value) key_value_pair FROM key_value_store
		create table psn1 as select id,name,sex from psn3;
		-- 此过程会转换为MR操作
		-- 杀死job命令
			hadoop job -kill jobid

DML
	-- 导数据的其他方式
	1.Inserting data into Hive Tables from queries
		FROM page_view_stg pvs
		INSERT OVERWRITE TABLE page_view PARTITION(dt='2008-06-08', country)
			SELECT pvs.viewTime, pvs.userid, pvs.page_url, pvs.referrer_url, null, null, pvs.ip, pvs.cnt
		-- 会转MR
		from psn3
			insert into table psnjg
			select count(*);
	2.Inserting values into tables from SQL
		-- 效率慢,用的少
		INSERT INTO TABLE tablename [PARTITION (partcol1[=val1], partcol2[=val2] ...)] VALUES values_row [, values_row ...]

Hive SerDe
	Hive SerDe - Serializer and Deserializer
	SerDe 用于做序列化和反序列化。
	构建在数据存储和执行引擎之间，对两者实现解耦。
	Hive通过ROW FORMAT DELIMITED以及SERDE进行内容的读写。
	
		row_format
		: DELIMITED 
				  [FIELDS TERMINATED BY char [ESCAPED BY char]] 
				  [COLLECTION ITEMS TERMINATED BY char] 
				  [MAP KEYS TERMINATED BY char] 
				  [LINES TERMINATED BY char] 
		: SERDE serde_name [WITH SERDEPROPERTIES (property_name=property_value, property_name=property_value, ...)]
	-- hive2中序列化与反序列化
		-- 常用的是第1种
		
	-- 创建表
		CREATE TABLE logtbl (
			host STRING,
			identity STRING,
			t_user STRING,
			time STRING,
			request STRING,
			referer STRING,
			agent STRING)
		ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
		WITH SERDEPROPERTIES (
			"input.regex" = "([^ ]*) ([^ ]*) ([^ ]*) \\[(.*)\\] \"(.*)\" (-|[0-9]*) (-|[0-9]*)"
		)
		STORED AS TEXTFILE;
		
		-- 后边是一个正则表达式
		
	-- 导入数据
		load data local inpath '/var/sxt/test/logdata' into table logtbl;
		导入到hdfs中的数据里的双引号、中括号还是在的
		
		如果数据和表的序列化和反序列化规则不同，数据可以导过来
		但是对应的某一行数据和规则不同，就会产生null
			3	小明13	["eat","code","play"]	{"北京":"天安门","上海":"黄浦江"}	ooxx
			NULL	eat-code-play	["北京:天安门","上海:黄浦江"]	NULL	ooxx
	-- 总结
		在检查数据是否正确的时候，有一个写时检查和读时检查
		mysql是写时检查
		hive是读时检查
	-- 数据清洗
Hive Beeline
	服务端需要启动一个HiveServer2
	
	Beeline 要与HiveServer2配合使用
	服务端启动hiveserver2
	客户端通过beeline两种方式连接到hive
		1、beeline -u jdbc:hive2://localhost:10000/default -n root
		2、beeline
		beeline> !connect jdbc:hive2://<host>:<port>/<db>;auth=noSasl root 123
	默认 用户名、密码不验证
	
	试试看
		-- 连接  10000后边默认是default，可以不写
		beeline -u jdbc:hive2://node03:10000 -n root
		以上只是换了一个连接方式而已，数据都在
		并且得到了一个思路，可以使用jdbc方式连接hive，用代码操作
		
	jdbc方式
	
	String driver = "org.apache.hive.jdbc.HiveDriver";
		try {
			Class.forName(driver);
			Connection conn = Drivergirlager.getConnection("jdbc:hive2://node03:10000/default","root", "");
			String sql="select * from psn3";
			Statement sm=conn.createStatement();
			ResultSet resultSet = sm.executeQuery(sql);
			while(resultSet.next()) {
				System.out.println("id:"+resultSet.getInt("id")+"\tname:"+resultSet.getString("name"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

Hive函数
	内置运算符
		关系运算符
		算术运算符
		逻辑运算符
			and &&
			or |
			not !
	内置函数
		数学函数
			round
			sqrt
			abs
			...
		收集函数
			size(Map<K,V>)
				返回map类型的元素的数量
			size(Array<T>)
				返回数组类型的元素数量
		类型转换函数
			cast(expr as <type>)
				类型转换
					如将字符1转换为整数，cast('1' as bigint),如果失败返回null
		日期函数
		
		条件函数
			if
		字符函数
			length
			reverse 倒序
			split 返回的是数组
	内置的聚合函数
		count
		sum
		max
		min
		方差等
		
	内置表生成函数（UDTF）
		explode(array<TYPE>) 数组一条记录中有多个参数，将参数拆分，每个参数生成一列
		json_tuple
	自定义函数
		UDF
			一进一出
		UDAF
			多进一出
			sum max min avg(平均数) count
		UDTF
			一进多出
		
	
	临时函数
		Hive的UDF开发只需要重构UDF类的evaluate函数即可。例：
		
		代码：
			package cn.jiangdou;

			import org.apache.hadoop.hive.ql.exec.UDF;
			import org.apache.hadoop.io.Text;

			public class TuoMin extends UDF {
				public Text evaluate(Text t) {
					if (t == null) {
						return t;
					}
					String s = t.toString().substring(0, 3) + "***";
					return new Text(s);
				}
			}
		怎么调用
			1.将该java文件编译成helloudf.jar
			2.在hive下操作
				-- 添加jar到hive
				add jar helloudf.jar;
				-- 创建临时函数
				create temporary function tuomin as 'cn.jiangdou.TuoMin';
				-- 调用函数
				select tuomin(aihao) from psn3;
				-- 删除临时函数
				drop temporary function tuomin;
			3.注意
				1)helloworld为临时的函数，所以每次进入hive都需要add jar以及create temporary操作
				2)UDF只能实现一进一出的操作，如果需要实现多进一出，则需要实现UDAF
Hive总结
	数据仓库----分析
	SQL----> mr
	元数据信息存放在数据库猴子那个（mysql或其他）
	架构
		hive转MR最小单元叫操作符
		操作符就是MR作业或者HDFS操作
		hive最终转成SQL就是MR操作符或者HDFS操作符构成的一课语法树
	搭建
		3种模式
			local
			单用户 mysql
			多用户 mysql 使用yum安装
			
			hadoop集群
				hdfs和yarn
			修改hive-site.xml
			两个jar包
				mysql的jar包和jline包
	SQL
		DDL
			数据类型
			序列化和反序列化规则
			内部表和外部表区
			分区表
				删除添加等操作
			建表规则
				create like
				create as select
		DML
			导入数据
				load data 
			from insert into select
	Beeline
		hiveserver2
		jdbc
	函数
		UDF
		UDAF
		UDTF
		自定义函数
		
	作业
		基站掉话率：找出掉线率最高的前10基站
			record_time：通话时间
			imei：基站编号
			cell：手机编号
			drop_num：掉话的秒数
			duration：通话持续总秒数
			
			
	-- 创建数据表
		create table jizhantbl(
			record_time string,
			imei int,
			cell string,
			ph_num int,
			call_num int,
			drop_num int,
			duration int,
			drop_rate string,
			net_type string,
			erl int
		)ROW FORMAT DELIMITED
		FIELDS TERMINATED BY ",";
	-- 创建结果表
		create table jizhanjg(
			imei int,
			droprate double
		);
	-- 运算
		1.分开进行
		from jizhantbl
			insert into jizhanjg
		select imei,sum(drop_num)/sum(duration) group by imei;
		
		select * from jizhanjg order by droprate desc limit 10;
		2.直接进行
		from jizhantbl
			insert into jizhanjg
		select imei,sum(drop_num)/sum(duration) as cc group by imei order by cc desc limit 10;
	-- 结果
		639876	0.0013623978201634877
		356436	9.727626459143969E-4
		351760	8.116883116883117E-4
		368883	6.906077348066298E-4
		358849	6.807351940095302E-4
		358231	6.199628022318661E-4
		863738	5.982650314089142E-4
		865011	5.36480686695279E-4
		862242	5.227391531625719E-4
		350301	5.002501250625312E-4
===============================================================	
Hive版本WordCount
	hello hello hello sxt
	hello bjsxt
	nihao bjsxt
	hello
	-- 创建数据表
		create table wc(
			word string
		)
	-- 创建结果表
		create table wcjg(
			word string,
			count int
		)
	-- SQL语句
		from (select explode(split(word," ")) as word from wc) d
			insert into wcjg
		select d.word,count(1) group by d.word;
===============================================================	
Hive 参数、变量

	-- hive当中的参数、变量，都是以命名空间开头

		hvieconf	可读写	hive-site.xml当中的各配置变量 例：hive --hiveconf hive.cli.print.header=true
		system		可读写	系统变量，包含JVM运行参数等 例：system:user.name=root
		env			只读	环境变量 例：env:JAVA_HOME
		hivevar		可读写	例：hive -d val=key
	-- 通过${}方式进行引用，其中system、env下的变量必须以前缀开头
	参数的设置方式
		1、（全局修改）修改配置文件 ${HIVE_HOME}/conf/hive-site.xml
		2、（仅仅作用于一次会话）启动hive cli时，通过--hiveconf key=value的方式进行设置
			例：hive --hiveconf hive.cli.print.header=true(是否要显示表头)
		3、（常用，周期也是当前会话）进入cli之后，通过使用set命令设置
			set hive.cli.print.header,然后会输出这个变量的值hive.cli.print.header=false
			1)set
				会输出当前hive所有参数所有变量
			2)set查看参数的值
				set hive.cli.print.header
			3)set设置参数的值
				set hive.cli.print.header=false

		~/.hivehistory
			当前用户hive历史操作命令集
		~/.hiverc
			hive参数初始化配置（如果没有可以直接创建）
			将需要设置的参数写到该文件中，hive启动运行时，会自动加载改文件中的配置。
===============================================================	
Hive动态分区
	 
	数据
		11,小明11,girl,20,eat-code-play,北京:天安门-上海:黄浦江
		12,小明12,girl,20,eat-code-play,北京:天安门-上海:黄浦江
		13,小明13,girl,10,eat-code-play,北京:天安门-上海:黄浦江
		14,小明14,man,10,eat-code-play,北京:天安门-上海:黄浦江
		15,小明15,man,10,eat-code-play,北京:天安门-上海:黄浦江
		16,小明16,man,10,eat-code-play,北京:天安门-上海:黄浦江
		17,小明17,man,20,eat-code-play,北京:天安门-上海:黄浦江
		18,小明18,man,20,eat-code-play,北京:天安门-上海:黄浦江
		19,小明19,girl,20,eat-code-play,北京:天安门-上海:黄浦江
		20,小明20,girl,20,eat-code-play,北京:天安门-上海:黄浦江
		21,小明21,girl,20,eat-code-play,北京:天安门-上海:黄浦江
		22,小明22,girl,20,eat-code-play,北京:天安门-上海:黄浦江
		23,小明23,girl,20,eat-code-lol,huoxing:ooxx
	
	
	-- 开启支持动态分区 dynamic(动态的)
		set hive.exec.dynamic.partition=true;
		默认：true
		set hive.exec.dynamic.partition.mode=nostrict;
			默认：strict（至少有一个分区列是静态分区），设置成非严格模式
	相关参数
		set hive.exec.max.dynamic.partitions.pernode;
			每一个执行mr节点上，允许创建的动态分区的最大数量(100)
		set hive.exec.max.dynamic.partitions;
			所有执行mr节点上，允许创建的所有动态分区的最大数量(1000)
		set hive.exec.max.created.files;
			所有的mr job允许创建的文件的最大数量(100000)

	创建数据表
		create table psn21(
			id int,
			name string,
			sex string,
			age int,
			aihao ARRAY<string>,
			addr MAP<string,string>
		)ROW FORMAT DELIMITED
		FIELDS TERMINATED BY ","
		COLLECTION ITEMS TERMINATED BY "-"
		MAP KEYS TERMINATED BY ":";
	创建分区表
		create table psn22(
			id int,
			name string,
			aihao ARRAY<string>,
			addr MAP<string,string>
		)PARTITIONED BY (sex string,age int)
		ROW FORMAT DELIMITED
		FIELDS TERMINATED BY ","
		COLLECTION ITEMS TERMINATED BY "-"
		MAP KEYS TERMINATED BY ":";
	数据表导入原始数据
		load data local inpath '/var/sxt/test/data3' into table psn21;
	设置动态分区为非严格模式（顺序可变）
		set hive.exec.dynamic.partition.mode=nostrict;
	动态分区表中导入数据
		load data方式不可取
		使用from insert select方式
			from psn21
				insert into table psn22 partition(sex,age)
			select id,name,aihao,addr,sex,age distribute by sex,age;
===============================================================	
Hive分桶
	概念：
		1.分桶表是对列值取哈希值的方式，将不同数据放到不同文件中存储。
		2.对于hive中每一个表、分区都可以进一步进行分桶。
		3.由列的哈希值除以桶的个数来决定每条数据划分在哪个桶中。（取模，对应的值）
	适用场景：
		数据抽样（ sampling ）、map-join
			数据抽样
			join操作

	开启支持分桶
		set hive.enforce.bucketing=true;
			默认：false；设置为true之后，mr运行时会根据bucket的个数自动分配reduce task个数。
			（用户也可以通过mapred.reduce.tasks自己设置reduce任务个数，但分桶时不推荐使用）
		注意：一次作业产生的桶（文件数量）和reduce task个数一致。

	往分桶表中加载数据（采用from-insert方式）
		insert into table bucket_table select columns from tbl;
		insert overwrite table bucket_table select columns from tbl;
	桶表 抽样查询
		select * from bucket_table tablesample(bucket 1 out of 4 on columns);

	TABLESAMPLE语法：
		TABLESAMPLE(BUCKET x OUT OF y)
		x：表示从哪个bucket开始抽取数据
		y：必须为该表总bucket数的倍数或因子

	例：
		当表总bucket数为32时
			TABLESAMPLE(BUCKET 3 OUT OF 8)，抽取哪些数据？
			共抽取2（32/16）个bucket的数据，抽取第2、第18（16+2）个bucket的数据
		TABLESAMPLE(BUCKET 3 OUT OF 256)，抽取哪些数据？
			共抽取1/8（32/256）个bucket的数据，抽取第2个bucket的1/8数据
	例子：
		例子：
			测试数据：
			1,tom,11
			2,cat,22
			3,dog,33
			4,hive,44
			5,hbase,55
			6,mr,66
			7,alice,77
			8,scala,88
			创建数据表：
				CREATE TABLE psn31( id INT, name STRING, age INT)
				ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
			数据表中导入数据
				load data local inpath '/var/sxt/test/bucketdata' into table psn31;
			创建分桶表：
				CREATE TABLE psnbucket( id INT, name STRING, age INT)
				CLUSTERED BY (age) INTO 4 BUCKETS 
				ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
				-- 通过age分桶，并且创建4个桶
				
			分桶表中导入数据
				from psn31
				insert into table psnbucket
				select * ;
			抽样
				select * from psnbucket tablesample(bucket 2 out of 4);
===============================================================
Hive Lateral View
	概念：
		Lateral View用于和UDTF函数（explode、split）结合来使用。
		首先通过UDTF函数拆分成多行，再将多行结果组合成一个支持别名的虚拟表。
		主要解决在select使用UDTF做查询过程中，查询只能包含单个UDTF，不能包含其他字段、以及多个UDTF的问题
	语法：
		LATERAL VIEW udtf(expression) tableAlias AS columnAlias (',' columnAlias)
	例：
		统计人员表中共有多少种爱好、多少个城市?
		
		select count(distinct(myCol1)), count(distinct(myCol2)) from psn2 
		LATERAL VIEW explode(aihao) myTable1 AS myCol1 
		LATERAL VIEW explode(addr) myTable2 AS myCol2, myCol3;
	结果：
		_c0	_c1
		4	3
===============================================================
Hive视图
	和关系型数据库中的普通视图一样，hive也支持视图
	特点：
		1.不支持物化视图(mysql也不支持)
		2.只能查询，不能做加载数据操作
		3.视图的创建，只是保存一份元数据，查询视图时才执行对应的子查询
		4.view定义中若包含了ORDER BY/LIMIT语句，当查询视图时也进行ORDER BY/LIMIT语句操作，view当中定义的优先级更高
		5.view支持迭代视图
	创建视图：
		CREATE VIEW [IF NOT EXISTS] [db_name.]view_name 
		[(column_name [COMMENT column_comment], ...) ]
		[COMMENT view_comment]
		[TBLPROPERTIES (property_name = property_value, ...)]
		AS SELECT ... ;
	查询视图：
		select colums from view;
	删除视图：
		DROP VIEW [IF EXISTS] [db_name.]view_name;
	hive视图应用场景
		
		
	https://www.cnblogs.com/zlslch/p/6105243.html	
		
===============================================================
Hive索引
	目的：优化查询以及检索性能
	创建索引：
		-- 1.第一种方式
		create index t1_index on table psn2(name) 
		as 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' with deferred rebuild 
		in table t1_index_table;
			as：指定索引器；
			in table：指定索引表，若不指定默认生成在default__psn2_t1_index__表中
		-- 2.第二种方式
		create index t1_index on table psn2(name) 
		as 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' with deferred rebuild;
	查询索引
		show index on psn2;
	重建索引（建立索引之后必须重建索引才能生效）（会有MR操作）
		ALTER INDEX t1_index ON psn2 REBUILD;
	删除索引
		DROP INDEX IF EXISTS t1_index ON psn2;

===============================================================
Hive运行方式
	1.命令行方式cli：控制台模式
	2.脚本运行方式（实际生产环境中用最多）
	3.JDBC方式：hiveserver2
	4.web GUI接口 （hwi-原生、hue等）

	1.Hive在CLI模式中
		与hdfs交互
			执行执行dfs命令
			例：dfs –ls /
		与Linux交互
			！开头
			例： !pwd	!clear

	2.Hive脚本运行方式(在hive外)
		hive -e ""
			hive -e "select * from psn2;"
			可以添加—S实现静默输出（只输出sql结果，头和尾状态等不会输出）
			hive -S -e "select * from psn2;"
			hive -e "set">hiveset (将hive 的set输出到文件中)
		hive -e "">aaa
		hive -S -e "">aaa（在当前目录，把结果存到aaa文件中）
			hive -S -e "select * from psn2;">jieguo
		hive -f file（执行file中的sql语句）
			hive -f testsql
		-- 下边两个条会在在hivecli中运行
		hive -i /home/my/hive-init.sql
		hive> source file (在hive cli中运行)
			hive> source /var/sxt/test/testsql
			
	3.JDBC方式
	4.web GUI接口 （hwi-原生、hue等）
		hwi——web界面安装：
		1)下载源码包apache-hive-*-src.tar.gz
		2)将hwi war包放在$HIVE_HOME/lib/
			-- 制作方法：将hwi/web/* 里面所有的文件打成war包
				cd apache-hive-1.2.1-src/hwi/web
				jar -cvf hive-hwi.war *
		3)复制tools.jar(在jdk的lib目录下)到$HIVE_HOME/lib下
		4)修改hive-site.xml
			追加下列配置：
			<property>
				<!-- 监听的主机，可以使用缺省或者指定node03 -->
				<name>hive.hwi.listen.host</name>
				<value>0.0.0.0</value>
			</property>
			<property>
				<!-- 监听的端口，访问的端口 -->
				<name>hive.hwi.listen.port</name>
				<value>9999</value>
			</property>
			<property>
				<!-- hive-hwi war包的位置 -->
				<name>hive.hwi.war.file</name>
				<value>lib/hive-hwi.war</value>
			</property>
			上边配置是在hive服务端，可以分发也可不分发
		5)启动hwi服务(端口号9999)
			hive --service hwi
		6)浏览器通过以下链接来访问
			http://node03:9999/hwi	
===============================================================
Hive权限管理（用的不多）
	三种授权模型：
		1、Storage Based Authorization in the Metastore Server
			基于存储的授权 - 可以对Metastore中的元数据进行保护，但是没有提供更加细粒度的访问控制（例如：列级别、行级别）。
		2、SQL Standards Based Authorization in HiveServer2(-推荐-)
			基于SQL标准的Hive授权 - 完全兼容SQL的授权模型，推荐使用该模式。
		3、Default Hive Authorization (Legacy Mode)
			hive默认授权 - 设计目的仅仅只是为了防止用户产生误操作，而不是防止恶意用户访问未经授权的数据。
	
	Hive - SQL Standards Based Authorization in HiveServer2
		1.完全兼容SQL的授权模型
		2.除支持对于用户的授权认证，还支持角色role的授权认证
			1)role可理解为是一组权限的集合，通过role为用户授权
			2)一个用户可以具有一个或多个角色
			3)默认包含另种角色：public、admin
		3.限制：
			1)启用当前认证方式之后，dfs, add, delete, compile, and reset等命令被禁用。
			2)通过set命令设置hive configuration的方式被限制某些用户使用。
			（可通过修改配置文件hive-site.xml中hive.security.authorization.sqlstd.confwhitelist进行配置）
			3)添加、删除函数以及宏的操作，仅为具有admin的用户开放。
			4)用户自定义函数（开放支持永久的自定义函数），可通过具有admin角色的用户创建，其他用户都可以使用。
			5)Transform功能被禁用。
		4.在hive服务端修改配置文件hive-site.xml添加以下配置内容：
			
			<!-- 权限相关配置 -->
			<property>
				<!-- 是否启用 -->
				<name>hive.security.authorization.enabled</name>
				<value>true</value>
			</property>
			<property>
				<name>hive.server2.enable.doAs</name>
				<value>false</value>
			</property>
			<property>
				<!-- 具有超级管理员的用户 -->
				<name>hive.users.in.admin.role</name>
				<value>root</value>
			</property>
			<property>
				<!-- 授权实现类 -->
				<name>hive.security.authorization.manager</name>
				<value>org.apache.hadoop.hive.ql.security.authorization.plugin.sqlstd.SQLStdHiveAuthorizerFactory</value>
			</property>
			<property>
				<!-- 认证实现类 -->
				<name>hive.security.authenticator.manager</name>
				<value>org.apache.hadoop.hive.ql.security.SessionStateUserAuthenticator</value>
			</property>
		服务端启动hiveserver2；客户端通过beeline进行连接

		5.角色的添加、删除、查看、设置：

			CREATE ROLE role_name;  -- 创建角色
			DROP ROLE role_name;  -- 删除角色
			SET ROLE (role_name|ALL|NONE);  -- 设置角色
			SHOW CURRENT ROLES;  -- 查看当前具有的角色
			SHOW ROLES;  -- 查看所有存在的角色
		6.角色的授予、移除、查看
			1)将角色授予某个用户、角色：
				GRANT role_name [, role_name] ...
				TO principal_specification [, principal_specification] ...
				[ WITH ADMIN OPTION ];

				principal_specification
				  : USER user
				  | ROLE role
			2)移除某个用户、角色的角色：
				REVOKE [ADMIN OPTION FOR] role_name [, role_name] ...
				FROM principal_specification [, principal_specification] ... ;
				
				principal_specification
				  : USER user
				  | ROLE role
			3)查看授予某个用户、角色的角色列表
				SHOW ROLE GRANT (USER|ROLE) principal_name;
			4)查看属于某种角色的用户、角色列表
				SHOW PRINCIPALS role_name;

		7.权限：
			SELECT privilege – gives read access to an object.
			INSERT privilege – gives ability to add data to an object (table).
			UPDATE privilege – gives ability to run update queries on an object (table).
			DELETE privilege – gives ability to delete data in an object (table).
			ALL PRIVILEGES – gives all privileges (gets translated into all the above privileges).
		8.权限的授予、移除、查看
			1)将权限授予某个用户、角色：
				GRANT
					priv_type [, priv_type ] ...
					ON table_or_view_name
					TO principal_specification [, principal_specification] ...
					[WITH GRANT OPTION];
					
					principal_specification
						: USER user
						| ROLE role
	 				priv_type
						: INSERT | SELECT | UPDATE | DELETE | ALL

			2)移除某个用户、角色的权限：
				REVOKE [GRANT OPTION FOR]
					priv_type [, priv_type ] ...
					ON table_or_view_name
					FROM principal_specification [, principal_specification] ... ;

			3)查看某个用户、角色的权限：
				SHOW GRANT [principal_name] ON (ALL| ([TABLE] table_or_view_name);
===============================================================
Hive优化		
	1.核心思想：把Hive SQL 当做Mapreduce程序去优化
		以下SQL不会转为Mapreduce来执行
			select仅查询本表字段
			where仅对本表字段做条件过滤
		Explain 显示执行计划
			EXPLAIN [EXTENDED] query
			explain可以查看sql语句具体的执行步骤和流程
		例子：explain select * from wc;
			Explain
			STAGE DEPENDENCIES:
			  Stage-0 is a root stage

			STAGE PLANS:
			  Stage: Stage-0
				Fetch Operator
				  limit: -1
				  Processor Tree:
					TableScan
					  alias: wc
					  Statistics: Num rows: 1 Data size: 52 Basic stats: COMPLETE Column stats: NONE
					  Select Operator
						expressions: word (type: string)
						outputColumnNames: _col0
						Statistics: Num rows: 1 Data size: 52 Basic stats: COMPLETE Column stats: NONE
						ListSink
		例子：explain select count(*) from wc;
			Explain
			STAGE DEPENDENCIES:
			  Stage-1 is a root stage
			  Stage-0 depends on stages: Stage-1

			STAGE PLANS:
			  Stage: Stage-1
				Map Reduce
				  Map Operator Tree:
					  TableScan
						alias: wc
						Statistics: Num rows: 1 Data size: 52 Basic stats: COMPLETE Column stats: COMPLETE
						Select Operator
						  Statistics: Num rows: 1 Data size: 52 Basic stats: COMPLETE Column stats: COMPLETE
						  Group By Operator
							aggregations: count()
							mode: hash
							outputColumnNames: _col0
							Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
							Reduce Output Operator
							  sort order: 
							  Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
							  value expressions: _col0 (type: bigint)
				  Reduce Operator Tree:
					Group By Operator
					  aggregations: count(VALUE._col0)
					  mode: mergepartial
					  outputColumnNames: _col0
					  Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
					  File Output Operator
						compressed: false
						Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
						table:
							input format: org.apache.hadoop.mapred.TextInputFormat
							output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
							serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

			  Stage: Stage-0
				Fetch Operator
				  limit: -1
				  Processor Tree:
					ListSink		
		具体的执行流程见上文
	2.Hive运行方式：
		本地模式（针对小表，或者数据量比较小的时候）
		集群模式（之前的操作都是在集群模式下）

		
		1)开启本地模式
			set hive.exec.mode.local.auto=true;（默认为false）
			注意：
				hive.exec.mode.local.auto.inputbytes.max默认值为128M
				表示加载文件的最大值，若大于该配置仍会以集群方式来运行！
			例子： select count(*) from psn2;
				在集群模式下耗时50s
				在本地模式下耗时3s
								
		2)开启并行计算
			通过设置以下参数开启并行模式：
				set hive.exec.parallel=true;

			注意：hive.exec.parallel.thread.number(我的是8)
				（一次SQL计算中允许并行执行的job个数的最大值）
			例子：
				select t1.ct1,t2.ct2 from
					(select count(*) as ct1 from psn2) t1,
					(select count(*) as ct2 from wc) t2
				在非并行模式下耗时128s
				在并行模式下耗时118s（t1,t2并行计算）
			但是开启并行计算不一定能够提高效率（或效果明显）
			因为并行计算，如果服务器性能不高，并行反而会影响效率
		3)开启严格模式
			通过设置以下参数开启严格模式：
				set hive.mapred.mode=strict;
				（默认为：nonstrict非严格模式）
				jiangdou：使用严格模式会方式坏人办错事，从根本上防止出现问题
			查询限制：
				a)对于分区表，必须添加where对于分区字段的条件过滤；
					(设置了严格模式后，分区表如果不添加where过滤会报错)
				b)order by语句必须包含limit输出限制
					(设置了严格模式后，order by时如果不limit会报错)
					(In strict mode, if ORDER BY is specified, LIMIT must also be specified.)
				c)限制执行笛卡尔积的查询。
					什么是笛卡尔积？
						假设集合A={a, b}，集合B={0, 1, 2}，则两个集合的笛卡尔积为{(a, 0), (a, 1), (a, 2), (b, 0), (b, 1), (b, 2)}。
		4)Hive排序优化
			a)Order By - 对于查询结果做全排序，只允许有一个reduce处理
				（当数据量较大时，应慎用。严格模式下，必须结合limit来使用）
			b)Sort By - 对于单个reduce的数据进行排序
			c)Distribute By - 分区排序，经常和Sort By结合使用
			d)Cluster By - 相当于 Sort By + Distribute By
				（Cluster By不能通过asc、desc的方式指定排序规则；
				可通过 distribute by column sort by column asc|desc 的方式）
		5)开启Map端join
			Join计算时，将小表（驱动表）放在join的左边
			Map Join：在Map端完成Join
				两种实现方式：
				1、SQL方式，在SQL语句中添加MapJoin标记（mapjoin hint）
					语法：
						SELECT  /*+ MAPJOIN(smallTable) */  smallTable.key,  bigTable.value 
						FROM  smallTable  JOIN  bigTable  ON  smallTable.key  =  bigTable.key;
				2、开启自动的MapJoin
					自动的mapjoin
					通过修改以下配置启用自动的mapjoin：
						set hive.auto.convert.join = true;
							（该参数为true时，Hive自动对左边的表统计量，如果是小表就加入内存，即对小表使用Map join）

					相关配置参数：
						hive.mapjoin.smalltable.filesize;  
							（大表小表判断的阈值，如果表的大小小于该值则会被加载到内存中运行）
						hive.ignore.mapjoin.hint；
							（默认值：true；是否忽略mapjoin hint 即mapjoin标记）
						hive.auto.convert.join.noconditionaltask;
							（默认值：true；将普通的join转化为普通的mapjoin时，是否将多个mapjoin转化为一个mapjoin）
						hive.auto.convert.join.noconditionaltask.size;
							（将多个mapjoin转化为一个mapjoin时，其表的最大值）
		6)开启Map端聚合
			Map-Side聚合
			通过设置以下参数开启在Map端的聚合：
				set hive.map.aggr=true;

			相关配置参数：
				hive.groupby.mapaggr.checkinterval： 
					map端group by执行聚合时处理的多少行数据（默认：100000）
				hive.map.aggr.hash.min.reduction： 
					进行聚合的最小比例（预先对100000条数据做聚合，若聚合之后的数据量/100000的值大于该配置0.5，则不会聚合）
				hive.map.aggr.hash.percentmemory： 
					map端聚合使用的内存的最大值
				hive.map.aggr.hash.force.flush.memory.threshold： 
					map端做聚合操作是hash表的最大可用内容，大于该值则会触发flush
				hive.groupby.skewindata（--重点--）
					是否对GroupBy产生的数据倾斜做优化，默认为false

		7)控制Hive中Map以及Reduce的数量
			Map数量相关的参数
				mapred.max.split.size
					一个split的最大值，即每个map处理文件的最大值
				mapred.min.split.size.per.node
					一个节点上split的最小值
				mapred.min.split.size.per.rack
					一个机架上split的最小值

			Reduce数量相关的参数
				mapred.reduce.tasks
					强制指定reduce任务的数量
				hive.exec.reducers.bytes.per.reducer
					每个reduce任务处理的数据量（默认将近256M）
				hive.exec.reducers.max
					每个任务最大的reduce数（默认=1009）

		8)Hive - JVM重用
			适用场景：
				1、小文件个数过多
				2、task个数过多

			通过 set mapred.job.reuse.jvm.num.tasks=n; 来设置
				n为task插槽个数）

			缺点：设置开启之后，task插槽会一直占用资源，不论是否有task运行，直到所有的task即整个job全部执行完成时，才会释放所有的task插槽资源！