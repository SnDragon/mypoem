drop database MP_database;
create database MP_database;
use MP_database;
#用户表
create table MP_user(
	user_id int auto_increment not null ,
	user_name varchar(50) not null,
    user_icon varchar(255) ,
    user_motto varchar(150) ,
    user_email varchar(255) not null unique,
    user_sex int default 1, -- 0为女生， 1为男生，
    user_password varchar(255) not null,
    user_intro varchar(200) , 
    primary key (user_id)
)DEFAULT CHARSET=utf8;

#标签表
create table MP_label(
	label_id int primary key auto_increment,
	label_name varchar(10) not null,
    label_description varchar(255)
)DEFAULT CHARSET=utf8;
insert into MP_label(label_name,label_description) values('其他','人生如诗，意境深远，绚丽多彩。');
insert into MP_label(label_name,label_description) values('校园','那年的我们，在青青的草坪横七八歪的谈笑打闹，那么快乐，那么简单，我怀念的，是你回忆里的背影么？');
insert into MP_label(label_name,label_description) values('友情','友谊是一杯葡萄佳酿，忙忙碌碌只能解渴，只有细细品味，才能尝出其芳醇真味。');
insert into MP_label(label_name,label_description) values('旅游','要么读书、要么旅行，灵魂和身体，必须有一个在路上。');
insert into MP_label(label_name,label_description) values('励志','励志，并不是让弱者取代另一个人成为强者，而是让一个弱者能与强者比肩，拥有实力相当的生命力和创造力。');
insert into MP_label(label_name,label_description) values('日常','生活中不是缺少美,而是缺少发现美的眼睛。');
insert into MP_label(label_name,label_description) values('思乡','身居异土兮心内伤，愿为黄鹄兮归故乡。');
insert into MP_label(label_name,label_description) values('风景','你站在桥上看风景，看风景的人在楼上看你。');
insert into MP_label(label_name,label_description) values('哲理','哲理人生，是指关于人生的根本的原理和智慧，让人了解人性，了解自我和社会，对人们的生活起到指引作用。');
insert into MP_label(label_name,label_description) values('爱情','有你在的地方，便是幸福存在，我心所系渴望的向往的地方。');

#诗歌表
create table MP_poem(
	poem_id int auto_increment not null,
	user_id int ,
	poem_text varchar(500) not null,
    poem_title varchar(50) not null,
    poem_num_support int not null default 0,
    poem_num_transmit int not null default 0,
    poem_num_comment int not null default 0,
    poem_publish_time datetime not null,
    poem_img varchar(255),
    label_id int not null,
    label_name varchar(10) not null,
    foreign key(user_id) references MP_user(user_id) on delete cascade,
    foreign key(label_id) references MP_label(label_id) on delete cascade,
    primary key(poem_id)
)DEFAULT CHARSET=utf8;
#关注表
create table MP_concern(
	concerned_id int not null,#被关注者id
    concerner_id int not null,#关注者id
	primary key(concerned_id, concerner_id),
    foreign key(concerned_id) references MP_user(user_id) on delete cascade,
    foreign key(concerner_id) references MP_user(user_id) on delete cascade
)DEFAULT CHARSET=utf8;

#评论表
create table MP_comment(
	comment_id int primary key auto_increment  not null,
	poem_id int not null,
    parent_id int,
    parent_user_name varchar(50),
    commentor_id int not null,
    commentor_name varchar(50) not null,
    comment_text varchar(200) not null,
    comment_time datetime not null,
    comment_thread varchar(255) default '/',
    foreign key (poem_id) references MP_poem(poem_id) on delete cascade,
    foreign key (parent_id) references MP_comment(comment_id) on delete cascade,
    foreign key (commentor_id) references MP_user(user_id) on delete cascade
)DEFAULT CHARSET=utf8;
#收藏表
create table MP_collection(
	user_id int not null,
    poem_id int not null,
    primary key(user_id,poem_id),
    foreign key(user_id) references MP_user(user_id) on delete cascade,
    foreign key(poem_id) references MP_poem(poem_id) on delete cascade
)DEFAULT CHARSET=utf8;
#点赞表
create table MP_support(
	user_id int not null,
    poem_id int not null,
    primary key(user_id,poem_id),
    foreign key(user_id) references MP_user(user_id) on delete cascade,
    foreign key(poem_id) references MP_poem(poem_id) on delete cascade
)DEFAULT CHARSET=utf8;
#转发表
create table MP_transmit(
	transmit_id int primary key auto_increment,
	user_id int not null,
    poem_id int not null,
    transmit_comment varchar(120) not null,
    transmit_time datetime not null,
    foreign key(user_id) references MP_user(user_id) on delete cascade,
    foreign key(poem_id) references MP_poem(poem_id) on delete cascade
)DEFAULT CHARSET=utf8;
#首页幻灯片推荐的诗
create table MP_recommend_poem(
	id int primary key auto_increment,
    pid int not null,
    foreign key (pid) references MP_poem(poem_id)
)DEFAULT CHARSET=utf8;
#其他平台的推荐
create table MP_other_recommend(
	id int primary key auto_increment,
    author_name varchar(50) not null,
    poem_title varchar(255) not null,
    poem_text text not null,#行与行之间用|分隔
    publish_time varchar(50) not null
)DEFAULT CHARSET=utf8;
#查找上一条记录
#select * from MP_other_recommend where id = (select id from MP_other_recommend where id < 3 order by id desc limit 1); 
#查找下一条记录
#select * from MP_other_recommend where id = (select id from MP_other_recommend where id > 3 order by id asc limit 1); 

#插入用户
insert into MP_user (user_name,user_email,user_password)
values('小吴','1803240383@qq.com','e10adc3949ba59abbe56e057f20f883e');
insert into MP_user (user_name,user_email,user_password)
values('dragon','123456@qq.com','e10adc3949ba59abbe56e057f20f883e');
insert into MP_user (user_name,user_email,user_password)
values('aaa','12346@qq.com','e10adc3949ba59abbe56e057f20f883e');
insert into MP_user (user_name,user_email,user_password)
values('bbb','13456@qq.com','e10adc3949ba59abbe56e057f20f883e');
insert into MP_user (user_name,user_email,user_password)
values('bb3','1346@qq.com','e10adc3949ba59abbe56e057f20f883e');
insert into MP_user (user_name,user_email,user_password)
values('b2b','1356@qq.com','e10adc3949ba59abbe56e057f20f883e');

#插入首页推荐的诗歌
#insert into MP_recommend_poem(pid) values(1);
#insert into MP_recommend_poem(pid) values(2);
#insert into MP_recommend_poem(pid) values(3);


#插入其他平台推荐的诗
insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('女人花', '扎西', '青草的呼吸与爱的咒语，遗落|在拉萨泅不过的天蓝里|扎西——|当你在别的女人身体上纵横捭阖，每一个盛世|都会疼痛着我的名字。而我|与你的心事，藏在|一朵雪花苍白的怀抱里|触摸不到远方|拨出我的圆月弯刀，我会|重新在城市的钢筋丛林里行走|可是，扎西——|雪莲不会盛开，你是我|唯一的死穴|', '2016年10月17日 14:06');
insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('凉快垭文化坊', '菩提造物馆的阳光', '所有的人和事物都忙着。像风和雨|只有阳光，在自己的世界里|安静地坐着。像菩提造物馆这本书里|的一杯茶，一株植物，一碟美食，一粒文字|一位殷实的主人。客人来的时候|她就会起身，为客人斟满一杯|惬意，或温暖|阳光的邻居是一片东坡湖，一座远景楼|一座三苏祠|阳光的家是一片辽阔的湿地|每天上下班的时候|就有月光，星光，还有白鹭|踏着音乐喷泉，吟着诗词过来接|', '2016年10月17日 14:02');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('王智勇', '如果这就是我所深信的生活', '如果这就是我所深信的生活，|我真的无话可说，没有背叛，|就没有对于真诚的考验，|甚至没有光，|野牛在烂泥塘中的蹄印，|这一个雨季，天空都在哭泣。|当我找出了万物间的联系，|蜘蛛诡秘地笑了，这个懒惰的狩猎者，|不依靠网线，就能听风弄月。|濒死挣扎的翅膀，|即将消散的温度，世界沉寂下来。|是什么把陈旧的时光弄弯，|连同湖面弯曲的倒影，|前世已无法辨认，|那冰洁的泪水飘来死亡的气息。|如果戳穿了谎言，|世界也就瓦解，虚空中尘埃和冰屑|拼凑成一张悲伤的脸。|', '2016年10月17日 11:55');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('纪才', '三岔河写意', '小亭子还在目光伸向远方|河水挤着跳着奔向下一个路口|芦花高过堤岸谁也不能阻挡她的招摇|白鹭突然窜起飞向芦苇深处|汇聚是慢悠悠的时光|岸边的柳茅让记忆走远|整个上午在翻找着合适你的词语|收地的农妇捋了捋河边的阳光|风更容易地撩起你的心事|白杨树叶刷啦啦地吹响秋天的旋律|金黄的稻浪在诉说丰收的喜悦|田畴河坝构成一幅真实的写意油画|', '2016年10月16日 20:52');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('纡洛', '花朵的灵魂', '草地上的一座城堡，驻扎花朵的灵魂|无数马匹飞驰苍茫|旷野的星星，在夜空变成闪光的蝴蝶|河流化成眼里的湖泊|鸟儿站在对面，灵魂的藤蔓燃起火焰|尘埃中的影子生出无数肋骨|那些生长的翅膀，在以梦为马的岁月中次第花开|飞吧，把羽翼交给灵魂|把生命交给火焰。我们像花朵一样年轻|                                                             |', '2016年10月16日 19:05');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('河石', '旷野', '旷野，颗粒已回家|只留些秸杆|和空荡荡的袖子|遗落的几许穗，举目无亲|我们离群索居，孤独|是孤独者的方向|几只鸟，在高压线上|来回跳跃，多像不安分的音符|捡拾时光的人，看看天空|泪水退回到云朵|安静的草，与劳作后的人们|修身养性| 譬如我，一个人无言|脸朝着风来的方向，极目远望|冬天来临，除了感恩|我甚至忘记了人间| |', '2016年10月16日 18:09');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('王炜皓', '赤溪', '沿着一棵棵古树的记忆|沿着九鲤溪一路的目光|是一条怎样的桥|连结着被水轮机推动的背影|是一条怎样的公路|连结着杨家溪通向它的心脏|那些远去的贫穷阴影|是怎样被一条阳光街道深藏|那些老人额前的皱纹|是怎样在婴儿的笑声里开花|那些从前挡住财路的青山|是怎样给它带来綠色的厚爱|夕阳是怎样捧饮香甜的空气|九鲤溪的梦是怎样的再次从它青山的目光里流出|是亮起一道怎样的山的高度与土地的深度融合的风景|', '2016年10月16日 16:47');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('橄榄树', '落叶写满娘儿的心事', '固执的母亲|象村头那棵古树|遥望走远的脚步|站成枯枝|树叶是母亲的日历|片片地挂着|风儿数着树叶|象母亲叨念的口语|需要春风的搀扶的日子|却依然倔强地挺立|守望孩子的归途|直到把根腐朽融入泥|母亲的爱|如村头的古树|一半在土里里挣扎|一半在阳光下希望|我在晨曦中走远|母亲在黄昏思念|翻飞的落叶|是母亲和我的书笺|写满娘儿的心事|', '2016年10月16日 13:55');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('适度', '芒刺', '一只鸟正在苦思如何将那些破枝烂叶堆砌成鸟窝|我正在苦思冥想怎样才能把那些|断成一截截骨头般的句子往这首诗里塞|怎样才能把那些破旧不堪的往事|还给古老的还未苏醒的大地|或许我在前进的路上冷得打抖|手中不小心抖落了几颗糖果和几个人|才会感到有无数根的芒刺|在暗夜中刺向我|', '2016年10月15日 22:57');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('仲涛', '简单生活', '滴答滴答|秒针走六十下回到原点|一页一页|日历翻十二页又过一年|一件一件|父母给孩子的衣裳在长|一天一天|经历了平凡就安详告别|好高骛远的小燕子|终有一天开始衔泥巴做窝|', '2016年05月06日 08:37');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('纪材尚', '你的名字', '你的名字|只有两个字|极平凡极平凡|但这两个字一经珠联|却梦幻般瞬间裂变|美轮美奂动人心弦| |默念你的名字|一遍遍 一遍遍|从清晨初醒到深夜难眠|你的名字|是怒放我心中永不凋谢的花朵|幽幽芳香浸透心田| |偷写你的名字|一遍遍 一遍遍|久而久之|我的笔竟不听使唤|常在该写我名字的地方|留下了你的芳名| |轻唤你的名字|一遍遍 一遍遍|如梦中呓语似春燕呢喃|你的名字|是一首百读不厌的诗篇|每读一遍|都有新的激动新的眷恋| |你的名字|很短很短|短得我一口气能读好几遍|你的名字|好长好长|长得我一辈子也念不完|', '2015年12月18日 20:53');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('张三没丰', '大雨打在我窗', '那么多的脚步疾行，|大雨打在我窗。|街上已没有了行人，|仿佛空了出来。|天边一块云团，|仿佛陆地。|我蓬松的羽毛，|竖在灰暗的天下。|', '2015年09月01日 17:57');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('霜西草', '霜西草诗词四首(图文)', '诉衷情·读《李陵传》|当年一骑挡千山，饮马护长安。|一身百战功过，梦断觅侯难。|人未老，鬓先斑，叹衣单。|可堪回首？昨夜一番，今夜一番。|梅弄影·盟守 |雨晴春后，戏舞花中斗。|来去啼莺柳后，映醉脂红，淡眉如翠透。|笑颜携手，侧倚香腮右。|纵是人怀时候，不怕娇痴，知心心可守。|武陵春·清明 |寒食东风心已尽，日晚望乡来。|宿草青山处处开，欲语几家裁。|闻道梨花催雨过，撒纸与尘埃。|只恐双眸不住台，载不动几多哀。|两同心|窗外相逢，未曾相见。|身处境、灯下相思，人道是、镜花轻浅。|忆当时，岁月难当，哪堪离散。|醉梦睡醒怕看，对月空盼。|天凉尽、人世沧桑，地凉尽、人间侣眷。|舍得么？月桂枝头，万千缕线。|', '2015年12月03日 16:07');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('纪材尚', '绳子', '从今天起|读诗 学习 提升品质|从今天起|恋家 下厨 放下身子|从今天起|懂你 疼你 好好爱你|你我本是两股不相干的绳胚|被有意无意拧在一起|从此你中有我|我中有你|', '2016年01月25日 09:00');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('张三没丰', '偶感      作者：左清', '下午波光点点，|人世凄清。|波纹不平的水池，|人浮其中。|树上一声鸟唱，|恍惚一个人家。|我站在岸，|略感微寒。|', '2015年09月03日 20:24');

insert into MP_other_recommend(author_name,poem_title,poem_text,publish_time) values('张三没丰', '黄昏  风景  抽象与回忆', '有更多的面孔进入黄昏，|使黄昏显得异常沉重，|太阳没有面部，在人群中走动，|有着严肃的影子。背景是一座没有高度的山，|树上停着只不会说话的鸟，|在唱着异国的歌。|鸟声穿越云边，|笑声沉落水底。|傍晚，|从一个方向过来，风捎来封泛黄的书信，|只言片语，|仅剩的几片叶子上，|没留下任何地址。|', '2015年09月05日 07:25');

