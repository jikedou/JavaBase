show tables;
create table tbl(id int,name string);
desc tbl;
-- �������ݻ�ִ��MR����
insert into tbl values(1,'zhangsan');
-- ��ѯ����
select * from tbl;


----------------hive�������----------------

С��
11,С��11,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
12,С��12,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
13,С��13,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
14,С��14,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
15,С��15,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
16,С��16,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
17,С��17,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
18,С��18,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
19,С��19,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
20,С��20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
21,С��21,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
22,С��22,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
23,С��23,eat-code-lol,huoxing:ooxx



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

-- �鿴������
desc tbl1;
-- �鿴������ϸ����
desc formatted tbl1;

-- DML

-- ��������
	-- LOCAL�Ǵӱ���Ҳ����linux�ļ�ϵͳ�У���д�Ļ���hdfs·��
	-- OVERWRITE���Ǳ����˼
		LOAD DATA [LOCAL] INPATH 'filepath' [OVERWRITE] INTO TABLE tablename
	-- ����linux�ļ�ϵͳ������
		LOAD DATA LOCAL INPATH '/var/sxt/test/data'  INTO TABLE psn0;
	-- ����hdfs������
		LOAD DATA INPATH '/data'  INTO TABLE psn0;

-- �ܽ�
-- LOAD DATA��ʽ
	-- ��������ļ��ڱ��أ��൱�����ϴ���hdfs��Ȼ��ŵ�������ݴ��Ŀ¼�±�
	-- ��������ļ���hdfs���൱�ڰ������ļ�ֱ���ƶ���������ݴ��Ŀ¼�±�
	-- LOAD DATA���ı��ʾ���ֱ�Ӷ������ļ���һЩ���������ơ��ƶ���������

-- girlAGED_TABLE  ������ڲ���

-- ��δ����ⲿ��
	-- ��[EXTERNAL]ָ����������Ҫ�ֶ�ָ�������ļ���ŵ�λ�ã�hdfs�ϣ�
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

-- ������
LOAD DATA LOCAL INPATH '/var/sxt/test/data'  INTO TABLE psn1;

-- �ڲ�����ⲿ������
	-- ɾ��
	�ⲿ��ɾ����������Ԫ����ɾ����,����ɾ�������ļ�
	�ڲ���ɾ����Ԫ���ݺ������ļ���ɾ��
	
	�ڲ�����hive�Լ�����ģ�ɾ����ʱ���ȫɾ��

-- �����ڲ�����ⲿ������һ���з�����
	-- �ⲿ������ĳ����˾��ԭʼ��־���ݴ����һ��Ŀ¼�У�������Ŷ���Щԭʼ���ݽ��з�����
		-- ��ô�����ⲿ��������ѡ������ԭʼ���ݲ��ᱻɾ����
	-- �ڲ�����ԭʼ���ݻ�Ƚ���Ҫ���м����ݽ��н���洢��
	-- ��������ÿ��Сʱ��ÿ�����־�ļ����з����洢���������ĳ���ض�ʱ�����ҵ������������ط���ɨ���������ݣ�
 [PARTITIONED BY (col_name data_type [COMMENT col_comment], ...)]
	-- �������ֶβ��ܳ����ڶ���������������ظ�
 
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


-- �����������ݵķ���
LOAD DATA [LOCAL] INPATH 'filepath' [OVERWRITE] INTO TABLE tablename [PARTITION (partcol1=val1, partcol2=val2 ...)]
-- ����Ƿ������ֶκͶ�Ӧ��ֵ
LOAD DATA LOCAL INPATH '/var/sxt/test/data'  INTO TABLE psn2 PARTITION(sex="girl");

-- �����������
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

-- ����
	-- �����������ݵ�ʱ����Ҫ�ƶ�����
LOAD DATA LOCAL INPATH '/var/sxt/test/data1'  INTO TABLE psn2 PARTITION(sex="girl",age=1);
	-- ����ע�����������ֶ�Ҫ���Ӧ
LOAD DATA LOCAL INPATH '/var/sxt/test/data1'  INTO TABLE psn2 PARTITION(sex="girl",age=10);

-- ��־����
	-- ����������ѯ���Է����ֶ������ˣ��ǳ��죨�����գ�

-- �Է�������Ӻ�ɾ��
	ALTER TABLE table_name ADD [IF NOT EXISTS] PARTITION partition_spec [LOCATION 'location'][, PARTITION partition_spec [LOCATION 'location'], ...];
-- ��ӷ���ҲҪ�ͷ����ֶζ�Ӧ
	alter table psn3 add partition (sex='girl',age=1);
-- ����������
	ALTER TABLE table_name PARTITION partition_spec RENAME TO PARTITION partition_spec;
	alter table psn3 partition (sex='girl',age=10) rename to partition (sex='girl',age=20);
-- exchange����
	ALTER TABLE table_name_2 EXCHANGE PARTITION (partition_spec) WITH TABLE table_name_1;
-- ɾ������
	-- ɾ����ʱ����һһ��Ӧ��ֻҪ����һ�����Ϳ��԰�������ص�ɾ��
	ALTER TABLE table_name DROP [IF EXISTS] PARTITION partition_spec[, PARTITION partition_spec, ...]
	-- ���psn3������age=20������ȫ��ɾ�������������ĸ������е�
	alter table psn3 drop partition (age=20);
-- ��ѯ������Ϣ
	show partitions psntest;

˼��
	-- �ⲿ�� ���� ɾ������ ���ᶪʧ���ݣ�����
	
	-- ������
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
	-- ��������
		load data local inpath '/var/sxt/test/data' into table psntest partition(sex='girl',age=20);
	-- ɾ��������
		alter table psntest drop partition(age=10);
	--���� 
		1.�鿴���ݷ��֣�select�鲻����������hdfs������ݻ���
		2.����ͨ����ӷ�����ʹ���ݻָ�����
			alter table psntest add partition (sex='girl',age=10);
	
-- �������������ʽ
	1.Create Table Like
		-- ������һ������һ���±���ṹһ�£������±�û�����ݣ�
		-- �����м�������ʱ��ǳ�����
		CREATE TABLE empty_key_value_store LIKE key_value_store
		create table psn4 like psn3;
	2.Create Table As Select (CTAS)
		-- �����ݵ��뵽�м�������ʱ����Ҳ�ܷ���
		CREATE TABLE new_key_value_store AS SELECT (key % 1024) new_key, concat(key, value) key_value_pair FROM key_value_store
		create table psn1 as select id,name,sex from psn3;
		-- �˹��̻�ת��ΪMR����
		-- ɱ��job����
			hadoop job -kill jobid

DML
	-- �����ݵ�������ʽ
	1.Inserting data into Hive Tables from queries
		FROM page_view_stg pvs
		INSERT OVERWRITE TABLE page_view PARTITION(dt='2008-06-08', country)
			SELECT pvs.viewTime, pvs.userid, pvs.page_url, pvs.referrer_url, null, null, pvs.ip, pvs.cnt
		-- ��תMR
		from psn3
			insert into table psnjg
			select count(*);
	2.Inserting values into tables from SQL
		-- Ч����,�õ���
		INSERT INTO TABLE tablename [PARTITION (partcol1[=val1], partcol2[=val2] ...)] VALUES values_row [, values_row ...]

Hive SerDe
	Hive SerDe - Serializer and Deserializer
	SerDe ���������л��ͷ����л���
	���������ݴ洢��ִ������֮�䣬������ʵ�ֽ��
	Hiveͨ��ROW FORMAT DELIMITED�Լ�SERDE�������ݵĶ�д��
	
		row_format
		: DELIMITED 
				  [FIELDS TERMINATED BY char [ESCAPED BY char]] 
				  [COLLECTION ITEMS TERMINATED BY char] 
				  [MAP KEYS TERMINATED BY char] 
				  [LINES TERMINATED BY char] 
		: SERDE serde_name [WITH SERDEPROPERTIES (property_name=property_value, property_name=property_value, ...)]
	-- hive2�����л��뷴���л�
		-- ���õ��ǵ�1��
		
	-- ������
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
		
		-- �����һ��������ʽ
		
	-- ��������
		load data local inpath '/var/sxt/test/logdata' into table logtbl;
		���뵽hdfs�е��������˫���š������Ż����ڵ�
		
		������ݺͱ�����л��ͷ����л�����ͬ�����ݿ��Ե�����
		���Ƕ�Ӧ��ĳһ�����ݺ͹���ͬ���ͻ����null
			3	С��13	["eat","code","play"]	{"����":"�찲��","�Ϻ�":"���ֽ�"}	ooxx
			NULL	eat-code-play	["����:�찲��","�Ϻ�:���ֽ�"]	NULL	ooxx
	-- �ܽ�
		�ڼ�������Ƿ���ȷ��ʱ����һ��дʱ���Ͷ�ʱ���
		mysql��дʱ���
		hive�Ƕ�ʱ���
	-- ������ϴ
Hive Beeline
	�������Ҫ����һ��HiveServer2
	
	Beeline Ҫ��HiveServer2���ʹ��
	���������hiveserver2
	�ͻ���ͨ��beeline���ַ�ʽ���ӵ�hive
		1��beeline -u jdbc:hive2://localhost:10000/default -n root
		2��beeline
		beeline> !connect jdbc:hive2://<host>:<port>/<db>;auth=noSasl root 123
	Ĭ�� �û��������벻��֤
	
	���Կ�
		-- ����  10000���Ĭ����default�����Բ�д
		beeline -u jdbc:hive2://node03:10000 -n root
		����ֻ�ǻ���һ�����ӷ�ʽ���ѣ����ݶ���
		���ҵõ���һ��˼·������ʹ��jdbc��ʽ����hive���ô������
		
	jdbc��ʽ
	
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

Hive����
	���������
		��ϵ�����
		���������
		�߼������
			and &&
			or |
			not !
	���ú���
		��ѧ����
			round
			sqrt
			abs
			...
		�ռ�����
			size(Map<K,V>)
				����map���͵�Ԫ�ص�����
			size(Array<T>)
				�����������͵�Ԫ������
		����ת������
			cast(expr as <type>)
				����ת��
					�罫�ַ�1ת��Ϊ������cast('1' as bigint),���ʧ�ܷ���null
		���ں���
		
		��������
			if
		�ַ�����
			length
			reverse ����
			split ���ص�������
	���õľۺϺ���
		count
		sum
		max
		min
		�����
		
	���ñ����ɺ�����UDTF��
		explode(array<TYPE>) ����һ����¼���ж����������������֣�ÿ����������һ��
		json_tuple
	�Զ��庯��
		UDF
			һ��һ��
		UDAF
			���һ��
			sum max min avg(ƽ����) count
		UDTF
			һ�����
		
	
	��ʱ����
		Hive��UDF����ֻ��Ҫ�ع�UDF���evaluate�������ɡ�����
		
		���룺
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
		��ô����
			1.����java�ļ������helloudf.jar
			2.��hive�²���
				-- ���jar��hive
				add jar helloudf.jar;
				-- ������ʱ����
				create temporary function tuomin as 'cn.jiangdou.TuoMin';
				-- ���ú���
				select tuomin(aihao) from psn3;
				-- ɾ����ʱ����
				drop temporary function tuomin;
			3.ע��
				1)helloworldΪ��ʱ�ĺ���������ÿ�ν���hive����Ҫadd jar�Լ�create temporary����
				2)UDFֻ��ʵ��һ��һ���Ĳ����������Ҫʵ�ֶ��һ��������Ҫʵ��UDAF
Hive�ܽ�
	���ݲֿ�----����
	SQL----> mr
	Ԫ������Ϣ��������ݿ�����Ǹ���mysql��������
	�ܹ�
		hiveתMR��С��Ԫ�в�����
		����������MR��ҵ����HDFS����
		hive����ת��SQL����MR����������HDFS���������ɵ�һ���﷨��
	�
		3��ģʽ
			local
			���û� mysql
			���û� mysql ʹ��yum��װ
			
			hadoop��Ⱥ
				hdfs��yarn
			�޸�hive-site.xml
			����jar��
				mysql��jar����jline��
	SQL
		DDL
			��������
			���л��ͷ����л�����
			�ڲ�����ⲿ����
			������
				ɾ����ӵȲ���
			�������
				create like
				create as select
		DML
			��������
				load data 
			from insert into select
	Beeline
		hiveserver2
		jdbc
	����
		UDF
		UDAF
		UDTF
		�Զ��庯��
		
	��ҵ
		��վ�����ʣ��ҳ���������ߵ�ǰ10��վ
			record_time��ͨ��ʱ��
			imei����վ���
			cell���ֻ����
			drop_num������������
			duration��ͨ������������
			
			
	-- �������ݱ�
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
	-- ���������
		create table jizhanjg(
			imei int,
			droprate double
		);
	-- ����
		1.�ֿ�����
		from jizhantbl
			insert into jizhanjg
		select imei,sum(drop_num)/sum(duration) group by imei;
		
		select * from jizhanjg order by droprate desc limit 10;
		2.ֱ�ӽ���
		from jizhantbl
			insert into jizhanjg
		select imei,sum(drop_num)/sum(duration) as cc group by imei order by cc desc limit 10;
	-- ���
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
Hive�汾WordCount
	hello hello hello sxt
	hello bjsxt
	nihao bjsxt
	hello
	-- �������ݱ�
		create table wc(
			word string
		)
	-- ���������
		create table wcjg(
			word string,
			count int
		)
	-- SQL���
		from (select explode(split(word," ")) as word from wc) d
			insert into wcjg
		select d.word,count(1) group by d.word;
===============================================================	
Hive ����������

	-- hive���еĲ����������������������ռ俪ͷ

		hvieconf	�ɶ�д	hive-site.xml���еĸ����ñ��� ����hive --hiveconf hive.cli.print.header=true
		system		�ɶ�д	ϵͳ����������JVM���в����� ����system:user.name=root
		env			ֻ��	�������� ����env:JAVA_HOME
		hivevar		�ɶ�д	����hive -d val=key
	-- ͨ��${}��ʽ�������ã�����system��env�µı���������ǰ׺��ͷ
	���������÷�ʽ
		1����ȫ���޸ģ��޸������ļ� ${HIVE_HOME}/conf/hive-site.xml
		2��������������һ�λỰ������hive cliʱ��ͨ��--hiveconf key=value�ķ�ʽ��������
			����hive --hiveconf hive.cli.print.header=true(�Ƿ�Ҫ��ʾ��ͷ)
		3�������ã�����Ҳ�ǵ�ǰ�Ự������cli֮��ͨ��ʹ��set��������
			set hive.cli.print.header,Ȼ���������������ֵhive.cli.print.header=false
			1)set
				�������ǰhive���в������б���
			2)set�鿴������ֵ
				set hive.cli.print.header
			3)set���ò�����ֵ
				set hive.cli.print.header=false

		~/.hivehistory
			��ǰ�û�hive��ʷ�������
		~/.hiverc
			hive������ʼ�����ã����û�п���ֱ�Ӵ�����
			����Ҫ���õĲ���д�����ļ��У�hive��������ʱ�����Զ����ظ��ļ��е����á�
===============================================================	
Hive��̬����
	 
	����
		11,С��11,girl,20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		12,С��12,girl,20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		13,С��13,girl,10,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		14,С��14,man,10,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		15,С��15,man,10,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		16,С��16,man,10,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		17,С��17,man,20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		18,С��18,man,20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		19,С��19,girl,20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		20,С��20,girl,20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		21,С��21,girl,20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		22,С��22,girl,20,eat-code-play,����:�찲��-�Ϻ�:���ֽ�
		23,С��23,girl,20,eat-code-lol,huoxing:ooxx
	
	
	-- ����֧�ֶ�̬���� dynamic(��̬��)
		set hive.exec.dynamic.partition=true;
		Ĭ�ϣ�true
		set hive.exec.dynamic.partition.mode=nostrict;
			Ĭ�ϣ�strict��������һ���������Ǿ�̬�����������óɷ��ϸ�ģʽ
	��ز���
		set hive.exec.max.dynamic.partitions.pernode;
			ÿһ��ִ��mr�ڵ��ϣ��������Ķ�̬�������������(100)
		set hive.exec.max.dynamic.partitions;
			����ִ��mr�ڵ��ϣ������������ж�̬�������������(1000)
		set hive.exec.max.created.files;
			���е�mr job���������ļ����������(100000)

	�������ݱ�
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
	����������
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
	���ݱ���ԭʼ����
		load data local inpath '/var/sxt/test/data3' into table psn21;
	���ö�̬����Ϊ���ϸ�ģʽ��˳��ɱ䣩
		set hive.exec.dynamic.partition.mode=nostrict;
	��̬�������е�������
		load data��ʽ����ȡ
		ʹ��from insert select��ʽ
			from psn21
				insert into table psn22 partition(sex,age)
			select id,name,aihao,addr,sex,age distribute by sex,age;
===============================================================	
Hive��Ͱ
	���
		1.��Ͱ���Ƕ���ֵȡ��ϣֵ�ķ�ʽ������ͬ���ݷŵ���ͬ�ļ��д洢��
		2.����hive��ÿһ�������������Խ�һ�����з�Ͱ��
		3.���еĹ�ϣֵ����Ͱ�ĸ���������ÿ�����ݻ������ĸ�Ͱ�С���ȡģ����Ӧ��ֵ��
	���ó�����
		���ݳ����� sampling ����map-join
			���ݳ���
			join����

	����֧�ַ�Ͱ
		set hive.enforce.bucketing=true;
			Ĭ�ϣ�false������Ϊtrue֮��mr����ʱ�����bucket�ĸ����Զ�����reduce task������
			���û�Ҳ����ͨ��mapred.reduce.tasks�Լ�����reduce�������������Ͱʱ���Ƽ�ʹ�ã�
		ע�⣺һ����ҵ������Ͱ���ļ���������reduce task����һ�¡�

	����Ͱ���м������ݣ�����from-insert��ʽ��
		insert into table bucket_table select columns from tbl;
		insert overwrite table bucket_table select columns from tbl;
	Ͱ�� ������ѯ
		select * from bucket_table tablesample(bucket 1 out of 4 on columns);

	TABLESAMPLE�﷨��
		TABLESAMPLE(BUCKET x OUT OF y)
		x����ʾ���ĸ�bucket��ʼ��ȡ����
		y������Ϊ�ñ���bucket���ı���������

	����
		������bucket��Ϊ32ʱ
			TABLESAMPLE(BUCKET 3 OUT OF 8)����ȡ��Щ���ݣ�
			����ȡ2��32/16����bucket�����ݣ���ȡ��2����18��16+2����bucket������
		TABLESAMPLE(BUCKET 3 OUT OF 256)����ȡ��Щ���ݣ�
			����ȡ1/8��32/256����bucket�����ݣ���ȡ��2��bucket��1/8����
	���ӣ�
		���ӣ�
			�������ݣ�
			1,tom,11
			2,cat,22
			3,dog,33
			4,hive,44
			5,hbase,55
			6,mr,66
			7,alice,77
			8,scala,88
			�������ݱ�
				CREATE TABLE psn31( id INT, name STRING, age INT)
				ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
			���ݱ��е�������
				load data local inpath '/var/sxt/test/bucketdata' into table psn31;
			������Ͱ��
				CREATE TABLE psnbucket( id INT, name STRING, age INT)
				CLUSTERED BY (age) INTO 4 BUCKETS 
				ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
				-- ͨ��age��Ͱ�����Ҵ���4��Ͱ
				
			��Ͱ���е�������
				from psn31
				insert into table psnbucket
				select * ;
			����
				select * from psnbucket tablesample(bucket 2 out of 4);
===============================================================
Hive Lateral View
	���
		Lateral View���ں�UDTF������explode��split�������ʹ�á�
		����ͨ��UDTF������ֳɶ��У��ٽ����н����ϳ�һ��֧�ֱ����������
		��Ҫ�����selectʹ��UDTF����ѯ�����У���ѯֻ�ܰ�������UDTF�����ܰ��������ֶΡ��Լ����UDTF������
	�﷨��
		LATERAL VIEW udtf(expression) tableAlias AS columnAlias (',' columnAlias)
	����
		ͳ����Ա���й��ж����ְ��á����ٸ�����?
		
		select count(distinct(myCol1)), count(distinct(myCol2)) from psn2 
		LATERAL VIEW explode(aihao) myTable1 AS myCol1 
		LATERAL VIEW explode(addr) myTable2 AS myCol2, myCol3;
	�����
		_c0	_c1
		4	3
===============================================================
Hive��ͼ
	�͹�ϵ�����ݿ��е���ͨ��ͼһ����hiveҲ֧����ͼ
	�ص㣺
		1.��֧���ﻯ��ͼ(mysqlҲ��֧��)
		2.ֻ�ܲ�ѯ���������������ݲ���
		3.��ͼ�Ĵ�����ֻ�Ǳ���һ��Ԫ���ݣ���ѯ��ͼʱ��ִ�ж�Ӧ���Ӳ�ѯ
		4.view��������������ORDER BY/LIMIT��䣬����ѯ��ͼʱҲ����ORDER BY/LIMIT��������view���ж�������ȼ�����
		5.view֧�ֵ�����ͼ
	������ͼ��
		CREATE VIEW [IF NOT EXISTS] [db_name.]view_name 
		[(column_name [COMMENT column_comment], ...) ]
		[COMMENT view_comment]
		[TBLPROPERTIES (property_name = property_value, ...)]
		AS SELECT ... ;
	��ѯ��ͼ��
		select colums from view;
	ɾ����ͼ��
		DROP VIEW [IF EXISTS] [db_name.]view_name;
	hive��ͼӦ�ó���
		
		
	https://www.cnblogs.com/zlslch/p/6105243.html	
		
===============================================================
Hive����
	Ŀ�ģ��Ż���ѯ�Լ���������
	����������
		-- 1.��һ�ַ�ʽ
		create index t1_index on table psn2(name) 
		as 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' with deferred rebuild 
		in table t1_index_table;
			as��ָ����������
			in table��ָ������������ָ��Ĭ��������default__psn2_t1_index__����
		-- 2.�ڶ��ַ�ʽ
		create index t1_index on table psn2(name) 
		as 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' with deferred rebuild;
	��ѯ����
		show index on psn2;
	�ؽ���������������֮������ؽ�����������Ч��������MR������
		ALTER INDEX t1_index ON psn2 REBUILD;
	ɾ������
		DROP INDEX IF EXISTS t1_index ON psn2;

===============================================================
Hive���з�ʽ
	1.�����з�ʽcli������̨ģʽ
	2.�ű����з�ʽ��ʵ����������������ࣩ
	3.JDBC��ʽ��hiveserver2
	4.web GUI�ӿ� ��hwi-ԭ����hue�ȣ�

	1.Hive��CLIģʽ��
		��hdfs����
			ִ��ִ��dfs����
			����dfs �Cls /
		��Linux����
			����ͷ
			���� !pwd	!clear

	2.Hive�ű����з�ʽ(��hive��)
		hive -e ""
			hive -e "select * from psn2;"
			������ӡ�Sʵ�־�Ĭ�����ֻ���sql�����ͷ��β״̬�Ȳ��������
			hive -S -e "select * from psn2;"
			hive -e "set">hiveset (��hive ��set������ļ���)
		hive -e "">aaa
		hive -S -e "">aaa���ڵ�ǰĿ¼���ѽ���浽aaa�ļ��У�
			hive -S -e "select * from psn2;">jieguo
		hive -f file��ִ��file�е�sql��䣩
			hive -f testsql
		-- �±�������������hivecli������
		hive -i /home/my/hive-init.sql
		hive> source file (��hive cli������)
			hive> source /var/sxt/test/testsql
			
	3.JDBC��ʽ
	4.web GUI�ӿ� ��hwi-ԭ����hue�ȣ�
		hwi����web���氲װ��
		1)����Դ���apache-hive-*-src.tar.gz
		2)��hwi war������$HIVE_HOME/lib/
			-- ������������hwi/web/* �������е��ļ����war��
				cd apache-hive-1.2.1-src/hwi/web
				jar -cvf hive-hwi.war *
		3)����tools.jar(��jdk��libĿ¼��)��$HIVE_HOME/lib��
		4)�޸�hive-site.xml
			׷���������ã�
			<property>
				<!-- ����������������ʹ��ȱʡ����ָ��node03 -->
				<name>hive.hwi.listen.host</name>
				<value>0.0.0.0</value>
			</property>
			<property>
				<!-- �����Ķ˿ڣ����ʵĶ˿� -->
				<name>hive.hwi.listen.port</name>
				<value>9999</value>
			</property>
			<property>
				<!-- hive-hwi war����λ�� -->
				<name>hive.hwi.war.file</name>
				<value>lib/hive-hwi.war</value>
			</property>
			�ϱ���������hive����ˣ����Էַ�Ҳ�ɲ��ַ�
		5)����hwi����(�˿ں�9999)
			hive --service hwi
		6)�����ͨ����������������
			http://node03:9999/hwi	
===============================================================
HiveȨ�޹����õĲ��ࣩ
	������Ȩģ�ͣ�
		1��Storage Based Authorization in the Metastore Server
			���ڴ洢����Ȩ - ���Զ�Metastore�е�Ԫ���ݽ��б���������û���ṩ����ϸ���ȵķ��ʿ��ƣ����磺�м����м��𣩡�
		2��SQL Standards Based Authorization in HiveServer2(-�Ƽ�-)
			����SQL��׼��Hive��Ȩ - ��ȫ����SQL����Ȩģ�ͣ��Ƽ�ʹ�ø�ģʽ��
		3��Default Hive Authorization (Legacy Mode)
			hiveĬ����Ȩ - ���Ŀ�Ľ���ֻ��Ϊ�˷�ֹ�û�����������������Ƿ�ֹ�����û�����δ����Ȩ�����ݡ�
	
	Hive - SQL Standards Based Authorization in HiveServer2
		1.��ȫ����SQL����Ȩģ��
		2.��֧�ֶ����û�����Ȩ��֤����֧�ֽ�ɫrole����Ȩ��֤
			1)role�����Ϊ��һ��Ȩ�޵ļ��ϣ�ͨ��roleΪ�û���Ȩ
			2)һ���û����Ծ���һ��������ɫ
			3)Ĭ�ϰ������ֽ�ɫ��public��admin
		3.���ƣ�
			1)���õ�ǰ��֤��ʽ֮��dfs, add, delete, compile, and reset��������á�
			2)ͨ��set��������hive configuration�ķ�ʽ������ĳЩ�û�ʹ�á�
			����ͨ���޸������ļ�hive-site.xml��hive.security.authorization.sqlstd.confwhitelist�������ã�
			3)��ӡ�ɾ�������Լ���Ĳ�������Ϊ����admin���û����š�
			4)�û��Զ��庯��������֧�����õ��Զ��庯��������ͨ������admin��ɫ���û������������û�������ʹ�á�
			5)Transform���ܱ����á�
		4.��hive������޸������ļ�hive-site.xml��������������ݣ�
			
			<!-- Ȩ��������� -->
			<property>
				<!-- �Ƿ����� -->
				<name>hive.security.authorization.enabled</name>
				<value>true</value>
			</property>
			<property>
				<name>hive.server2.enable.doAs</name>
				<value>false</value>
			</property>
			<property>
				<!-- ���г�������Ա���û� -->
				<name>hive.users.in.admin.role</name>
				<value>root</value>
			</property>
			<property>
				<!-- ��Ȩʵ���� -->
				<name>hive.security.authorization.manager</name>
				<value>org.apache.hadoop.hive.ql.security.authorization.plugin.sqlstd.SQLStdHiveAuthorizerFactory</value>
			</property>
			<property>
				<!-- ��֤ʵ���� -->
				<name>hive.security.authenticator.manager</name>
				<value>org.apache.hadoop.hive.ql.security.SessionStateUserAuthenticator</value>
			</property>
		���������hiveserver2���ͻ���ͨ��beeline��������

		5.��ɫ����ӡ�ɾ�����鿴�����ã�

			CREATE ROLE role_name;  -- ������ɫ
			DROP ROLE role_name;  -- ɾ����ɫ
			SET ROLE (role_name|ALL|NONE);  -- ���ý�ɫ
			SHOW CURRENT ROLES;  -- �鿴��ǰ���еĽ�ɫ
			SHOW ROLES;  -- �鿴���д��ڵĽ�ɫ
		6.��ɫ�����衢�Ƴ����鿴
			1)����ɫ����ĳ���û�����ɫ��
				GRANT role_name [, role_name] ...
				TO principal_specification [, principal_specification] ...
				[ WITH ADMIN OPTION ];

				principal_specification
				  : USER user
				  | ROLE role
			2)�Ƴ�ĳ���û�����ɫ�Ľ�ɫ��
				REVOKE [ADMIN OPTION FOR] role_name [, role_name] ...
				FROM principal_specification [, principal_specification] ... ;
				
				principal_specification
				  : USER user
				  | ROLE role
			3)�鿴����ĳ���û�����ɫ�Ľ�ɫ�б�
				SHOW ROLE GRANT (USER|ROLE) principal_name;
			4)�鿴����ĳ�ֽ�ɫ���û�����ɫ�б�
				SHOW PRINCIPALS role_name;

		7.Ȩ�ޣ�
			SELECT privilege �C gives read access to an object.
			INSERT privilege �C gives ability to add data to an object (table).
			UPDATE privilege �C gives ability to run update queries on an object (table).
			DELETE privilege �C gives ability to delete data in an object (table).
			ALL PRIVILEGES �C gives all privileges (gets translated into all the above privileges).
		8.Ȩ�޵����衢�Ƴ����鿴
			1)��Ȩ������ĳ���û�����ɫ��
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

			2)�Ƴ�ĳ���û�����ɫ��Ȩ�ޣ�
				REVOKE [GRANT OPTION FOR]
					priv_type [, priv_type ] ...
					ON table_or_view_name
					FROM principal_specification [, principal_specification] ... ;

			3)�鿴ĳ���û�����ɫ��Ȩ�ޣ�
				SHOW GRANT [principal_name] ON (ALL| ([TABLE] table_or_view_name);
===============================================================
Hive�Ż�		
	1.����˼�룺��Hive SQL ����Mapreduce����ȥ�Ż�
		����SQL����תΪMapreduce��ִ��
			select����ѯ�����ֶ�
			where���Ա����ֶ�����������
		Explain ��ʾִ�мƻ�
			EXPLAIN [EXTENDED] query
			explain���Բ鿴sql�������ִ�в��������
		���ӣ�explain select * from wc;
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
		���ӣ�explain select count(*) from wc;
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
		�����ִ�����̼�����
	2.Hive���з�ʽ��
		����ģʽ�����С�������������Ƚ�С��ʱ��
		��Ⱥģʽ��֮ǰ�Ĳ��������ڼ�Ⱥģʽ�£�

		
		1)��������ģʽ
			set hive.exec.mode.local.auto=true;��Ĭ��Ϊfalse��
			ע�⣺
				hive.exec.mode.local.auto.inputbytes.maxĬ��ֵΪ128M
				��ʾ�����ļ������ֵ�������ڸ������Ի��Լ�Ⱥ��ʽ�����У�
			���ӣ� select count(*) from psn2;
				�ڼ�Ⱥģʽ�º�ʱ50s
				�ڱ���ģʽ�º�ʱ3s
								
		2)�������м���
			ͨ���������²�����������ģʽ��
				set hive.exec.parallel=true;

			ע�⣺hive.exec.parallel.thread.number(�ҵ���8)
				��һ��SQL������������ִ�е�job���������ֵ��
			���ӣ�
				select t1.ct1,t2.ct2 from
					(select count(*) as ct1 from psn2) t1,
					(select count(*) as ct2 from wc) t2
				�ڷǲ���ģʽ�º�ʱ128s
				�ڲ���ģʽ�º�ʱ118s��t1,t2���м��㣩
			���ǿ������м��㲻һ���ܹ����Ч�ʣ���Ч�����ԣ�
			��Ϊ���м��㣬������������ܲ��ߣ����з�����Ӱ��Ч��
		3)�����ϸ�ģʽ
			ͨ���������²��������ϸ�ģʽ��
				set hive.mapred.mode=strict;
				��Ĭ��Ϊ��nonstrict���ϸ�ģʽ��
				jiangdou��ʹ���ϸ�ģʽ�᷽ʽ���˰���£��Ӹ����Ϸ�ֹ��������
			��ѯ���ƣ�
				a)���ڷ������������where���ڷ����ֶε��������ˣ�
					(�������ϸ�ģʽ�󣬷�������������where���˻ᱨ��)
				b)order by���������limit�������
					(�������ϸ�ģʽ��order byʱ�����limit�ᱨ��)
					(In strict mode, if ORDER BY is specified, LIMIT must also be specified.)
				c)����ִ�еѿ������Ĳ�ѯ��
					ʲô�ǵѿ�������
						���輯��A={a, b}������B={0, 1, 2}�����������ϵĵѿ�����Ϊ{(a, 0), (a, 1), (a, 2), (b, 0), (b, 1), (b, 2)}��
		4)Hive�����Ż�
			a)Order By - ���ڲ�ѯ�����ȫ����ֻ������һ��reduce����
				�����������ϴ�ʱ��Ӧ���á��ϸ�ģʽ�£�������limit��ʹ�ã�
			b)Sort By - ���ڵ���reduce�����ݽ�������
			c)Distribute By - �������򣬾�����Sort By���ʹ��
			d)Cluster By - �൱�� Sort By + Distribute By
				��Cluster By����ͨ��asc��desc�ķ�ʽָ���������
				��ͨ�� distribute by column sort by column asc|desc �ķ�ʽ��
		5)����Map��join
			Join����ʱ����С������������join�����
			Map Join����Map�����Join
				����ʵ�ַ�ʽ��
				1��SQL��ʽ����SQL��������MapJoin��ǣ�mapjoin hint��
					�﷨��
						SELECT  /*+ MAPJOIN(smallTable) */  smallTable.key,  bigTable.value 
						FROM  smallTable  JOIN  bigTable  ON  smallTable.key  =  bigTable.key;
				2�������Զ���MapJoin
					�Զ���mapjoin
					ͨ���޸��������������Զ���mapjoin��
						set hive.auto.convert.join = true;
							���ò���Ϊtrueʱ��Hive�Զ�����ߵı�ͳ�����������С��ͼ����ڴ棬����С��ʹ��Map join��

					������ò�����
						hive.mapjoin.smalltable.filesize;  
							�����С���жϵ���ֵ�������Ĵ�СС�ڸ�ֵ��ᱻ���ص��ڴ������У�
						hive.ignore.mapjoin.hint��
							��Ĭ��ֵ��true���Ƿ����mapjoin hint ��mapjoin��ǣ�
						hive.auto.convert.join.noconditionaltask;
							��Ĭ��ֵ��true������ͨ��joinת��Ϊ��ͨ��mapjoinʱ���Ƿ񽫶��mapjoinת��Ϊһ��mapjoin��
						hive.auto.convert.join.noconditionaltask.size;
							�������mapjoinת��Ϊһ��mapjoinʱ���������ֵ��
		6)����Map�˾ۺ�
			Map-Side�ۺ�
			ͨ���������²���������Map�˵ľۺϣ�
				set hive.map.aggr=true;

			������ò�����
				hive.groupby.mapaggr.checkinterval�� 
					map��group byִ�оۺ�ʱ����Ķ��������ݣ�Ĭ�ϣ�100000��
				hive.map.aggr.hash.min.reduction�� 
					���оۺϵ���С������Ԥ�ȶ�100000���������ۺϣ����ۺ�֮���������/100000��ֵ���ڸ�����0.5���򲻻�ۺϣ�
				hive.map.aggr.hash.percentmemory�� 
					map�˾ۺ�ʹ�õ��ڴ�����ֵ
				hive.map.aggr.hash.force.flush.memory.threshold�� 
					map�����ۺϲ�����hash������������ݣ����ڸ�ֵ��ᴥ��flush
				hive.groupby.skewindata��--�ص�--��
					�Ƿ��GroupBy������������б���Ż���Ĭ��Ϊfalse

		7)����Hive��Map�Լ�Reduce������
			Map������صĲ���
				mapred.max.split.size
					һ��split�����ֵ����ÿ��map�����ļ������ֵ
				mapred.min.split.size.per.node
					һ���ڵ���split����Сֵ
				mapred.min.split.size.per.rack
					һ��������split����Сֵ

			Reduce������صĲ���
				mapred.reduce.tasks
					ǿ��ָ��reduce���������
				hive.exec.reducers.bytes.per.reducer
					ÿ��reduce���������������Ĭ�Ͻ���256M��
				hive.exec.reducers.max
					ÿ����������reduce����Ĭ��=1009��

		8)Hive - JVM����
			���ó�����
				1��С�ļ���������
				2��task��������

			ͨ�� set mapred.job.reuse.jvm.num.tasks=n; ������
				nΪtask��۸�����

			ȱ�㣺���ÿ���֮��task��ۻ�һֱռ����Դ�������Ƿ���task���У�ֱ�����е�task������jobȫ��ִ�����ʱ���Ż��ͷ����е�task�����Դ��