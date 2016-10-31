-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mp_database
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mp_collection`
--

DROP TABLE IF EXISTS `mp_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_collection` (
  `user_id` int(11) NOT NULL,
  `poem_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`poem_id`),
  KEY `poem_id` (`poem_id`),
  CONSTRAINT `mp_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_collection_ibfk_2` FOREIGN KEY (`poem_id`) REFERENCES `mp_poem` (`poem_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_collection`
--

LOCK TABLES `mp_collection` WRITE;
/*!40000 ALTER TABLE `mp_collection` DISABLE KEYS */;
INSERT INTO `mp_collection` VALUES (1,1),(2,1),(7,2),(15,7),(15,8);
/*!40000 ALTER TABLE `mp_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_comment`
--

DROP TABLE IF EXISTS `mp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `poem_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_user_name` varchar(50) DEFAULT NULL,
  `commentor_id` int(11) NOT NULL,
  `commentor_name` varchar(50) NOT NULL,
  `comment_text` varchar(200) NOT NULL,
  `comment_time` datetime NOT NULL,
  `comment_thread` varchar(255) DEFAULT '/',
  PRIMARY KEY (`comment_id`),
  KEY `poem_id` (`poem_id`),
  KEY `parent_id` (`parent_id`),
  KEY `commentor_id` (`commentor_id`),
  CONSTRAINT `mp_comment_ibfk_1` FOREIGN KEY (`poem_id`) REFERENCES `mp_poem` (`poem_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_comment_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `mp_comment` (`comment_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_comment_ibfk_3` FOREIGN KEY (`commentor_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_comment`
--

LOCK TABLES `mp_comment` WRITE;
/*!40000 ALTER TABLE `mp_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_concern`
--

DROP TABLE IF EXISTS `mp_concern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_concern` (
  `concerned_id` int(11) NOT NULL,
  `concerner_id` int(11) NOT NULL,
  PRIMARY KEY (`concerned_id`,`concerner_id`),
  KEY `concerner_id` (`concerner_id`),
  CONSTRAINT `mp_concern_ibfk_1` FOREIGN KEY (`concerned_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_concern_ibfk_2` FOREIGN KEY (`concerner_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_concern`
--

LOCK TABLES `mp_concern` WRITE;
/*!40000 ALTER TABLE `mp_concern` DISABLE KEYS */;
INSERT INTO `mp_concern` VALUES (1,2),(1,3),(2,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(4,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),(7,10),(8,10),(9,10),(10,11),(11,12),(12,13),(13,14),(15,16);
/*!40000 ALTER TABLE `mp_concern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_label`
--

DROP TABLE IF EXISTS `mp_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(10) NOT NULL,
  `label_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_label`
--

LOCK TABLES `mp_label` WRITE;
/*!40000 ALTER TABLE `mp_label` DISABLE KEYS */;
INSERT INTO `mp_label` VALUES (1,'其他','人生如诗，意境深远，绚丽多彩。'),(2,'校园','那年的我们，在青青的草坪横七八歪的谈笑打闹，那么快乐，那么简单，我怀念的，是你回忆里的背影么？'),(3,'友情','友谊是一杯葡萄佳酿，忙忙碌碌只能解渴，只有细细品味，才能尝出其芳醇真味。'),(4,'旅游','要么读书、要么旅行，灵魂和身体，必须有一个在路上。'),(5,'励志','励志，并不是让弱者取代另一个人成为强者，而是让一个弱者能与强者比肩，拥有实力相当的生命力和创造力。'),(6,'日常','生活中不是缺少美,而是缺少发现美的眼睛。'),(7,'思乡','身居异土兮心内伤，愿为黄鹄兮归故乡。'),(8,'风景','你站在桥上看风景，看风景的人在楼上看你。'),(9,'哲理','哲理人生，是指关于人生的根本的原理和智慧，让人了解人性，了解自我和社会，对人们的生活起到指引作用。'),(10,'爱情','有你在的地方，便是幸福存在，我心所系渴望的向往的地方。');
/*!40000 ALTER TABLE `mp_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_other_recommend`
--

DROP TABLE IF EXISTS `mp_other_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_other_recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) NOT NULL,
  `poem_title` varchar(255) NOT NULL,
  `poem_text` text NOT NULL,
  `publish_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_other_recommend`
--

LOCK TABLES `mp_other_recommend` WRITE;
/*!40000 ALTER TABLE `mp_other_recommend` DISABLE KEYS */;
INSERT INTO `mp_other_recommend` VALUES (1,'女人花','扎西','青草的呼吸与爱的咒语，遗落|在拉萨泅不过的天蓝里|扎西——|当你在别的女人身体上纵横捭阖，每一个盛世|都会疼痛着我的名字。而我|与你的心事，藏在|一朵雪花苍白的怀抱里|触摸不到远方|拨出我的圆月弯刀，我会|重新在城市的钢筋丛林里行走|可是，扎西——|雪莲不会盛开，你是我|唯一的死穴|','2016年10月17日 14:06'),(2,'凉快垭文化坊','菩提造物馆的阳光','所有的人和事物都忙着。像风和雨|只有阳光，在自己的世界里|安静地坐着。像菩提造物馆这本书里|的一杯茶，一株植物，一碟美食，一粒文字|一位殷实的主人。客人来的时候|她就会起身，为客人斟满一杯|惬意，或温暖|阳光的邻居是一片东坡湖，一座远景楼|一座三苏祠|阳光的家是一片辽阔的湿地|每天上下班的时候|就有月光，星光，还有白鹭|踏着音乐喷泉，吟着诗词过来接|','2016年10月17日 14:02'),(3,'王智勇','如果这就是我所深信的生活','如果这就是我所深信的生活，|我真的无话可说，没有背叛，|就没有对于真诚的考验，|甚至没有光，|野牛在烂泥塘中的蹄印，|这一个雨季，天空都在哭泣。|当我找出了万物间的联系，|蜘蛛诡秘地笑了，这个懒惰的狩猎者，|不依靠网线，就能听风弄月。|濒死挣扎的翅膀，|即将消散的温度，世界沉寂下来。|是什么把陈旧的时光弄弯，|连同湖面弯曲的倒影，|前世已无法辨认，|那冰洁的泪水飘来死亡的气息。|如果戳穿了谎言，|世界也就瓦解，虚空中尘埃和冰屑|拼凑成一张悲伤的脸。|','2016年10月17日 11:55'),(4,'纪才','三岔河写意','小亭子还在目光伸向远方|河水挤着跳着奔向下一个路口|芦花高过堤岸谁也不能阻挡她的招摇|白鹭突然窜起飞向芦苇深处|汇聚是慢悠悠的时光|岸边的柳茅让记忆走远|整个上午在翻找着合适你的词语|收地的农妇捋了捋河边的阳光|风更容易地撩起你的心事|白杨树叶刷啦啦地吹响秋天的旋律|金黄的稻浪在诉说丰收的喜悦|田畴河坝构成一幅真实的写意油画|','2016年10月16日 20:52'),(5,'纡洛','花朵的灵魂','草地上的一座城堡，驻扎花朵的灵魂|无数马匹飞驰苍茫|旷野的星星，在夜空变成闪光的蝴蝶|河流化成眼里的湖泊|鸟儿站在对面，灵魂的藤蔓燃起火焰|尘埃中的影子生出无数肋骨|那些生长的翅膀，在以梦为马的岁月中次第花开|飞吧，把羽翼交给灵魂|把生命交给火焰。我们像花朵一样年轻|                                                             |','2016年10月16日 19:05'),(6,'河石','旷野','旷野，颗粒已回家|只留些秸杆|和空荡荡的袖子|遗落的几许穗，举目无亲|我们离群索居，孤独|是孤独者的方向|几只鸟，在高压线上|来回跳跃，多像不安分的音符|捡拾时光的人，看看天空|泪水退回到云朵|安静的草，与劳作后的人们|修身养性| 譬如我，一个人无言|脸朝着风来的方向，极目远望|冬天来临，除了感恩|我甚至忘记了人间| |','2016年10月16日 18:09'),(7,'王炜皓','赤溪','沿着一棵棵古树的记忆|沿着九鲤溪一路的目光|是一条怎样的桥|连结着被水轮机推动的背影|是一条怎样的公路|连结着杨家溪通向它的心脏|那些远去的贫穷阴影|是怎样被一条阳光街道深藏|那些老人额前的皱纹|是怎样在婴儿的笑声里开花|那些从前挡住财路的青山|是怎样给它带来綠色的厚爱|夕阳是怎样捧饮香甜的空气|九鲤溪的梦是怎样的再次从它青山的目光里流出|是亮起一道怎样的山的高度与土地的深度融合的风景|','2016年10月16日 16:47'),(8,'橄榄树','落叶写满娘儿的心事','固执的母亲|象村头那棵古树|遥望走远的脚步|站成枯枝|树叶是母亲的日历|片片地挂着|风儿数着树叶|象母亲叨念的口语|需要春风的搀扶的日子|却依然倔强地挺立|守望孩子的归途|直到把根腐朽融入泥|母亲的爱|如村头的古树|一半在土里里挣扎|一半在阳光下希望|我在晨曦中走远|母亲在黄昏思念|翻飞的落叶|是母亲和我的书笺|写满娘儿的心事|','2016年10月16日 13:55'),(9,'适度','芒刺','一只鸟正在苦思如何将那些破枝烂叶堆砌成鸟窝|我正在苦思冥想怎样才能把那些|断成一截截骨头般的句子往这首诗里塞|怎样才能把那些破旧不堪的往事|还给古老的还未苏醒的大地|或许我在前进的路上冷得打抖|手中不小心抖落了几颗糖果和几个人|才会感到有无数根的芒刺|在暗夜中刺向我|','2016年10月15日 22:57'),(10,'仲涛','简单生活','滴答滴答|秒针走六十下回到原点|一页一页|日历翻十二页又过一年|一件一件|父母给孩子的衣裳在长|一天一天|经历了平凡就安详告别|好高骛远的小燕子|终有一天开始衔泥巴做窝|','2016年05月06日 08:37'),(11,'纪材尚','你的名字','你的名字|只有两个字|极平凡极平凡|但这两个字一经珠联|却梦幻般瞬间裂变|美轮美奂动人心弦| |默念你的名字|一遍遍 一遍遍|从清晨初醒到深夜难眠|你的名字|是怒放我心中永不凋谢的花朵|幽幽芳香浸透心田| |偷写你的名字|一遍遍 一遍遍|久而久之|我的笔竟不听使唤|常在该写我名字的地方|留下了你的芳名| |轻唤你的名字|一遍遍 一遍遍|如梦中呓语似春燕呢喃|你的名字|是一首百读不厌的诗篇|每读一遍|都有新的激动新的眷恋| |你的名字|很短很短|短得我一口气能读好几遍|你的名字|好长好长|长得我一辈子也念不完|','2015年12月18日 20:53'),(12,'张三没丰','大雨打在我窗','那么多的脚步疾行，|大雨打在我窗。|街上已没有了行人，|仿佛空了出来。|天边一块云团，|仿佛陆地。|我蓬松的羽毛，|竖在灰暗的天下。|','2015年09月01日 17:57'),(13,'霜西草','霜西草诗词四首(图文)','诉衷情·读《李陵传》|当年一骑挡千山，饮马护长安。|一身百战功过，梦断觅侯难。|人未老，鬓先斑，叹衣单。|可堪回首？昨夜一番，今夜一番。|梅弄影·盟守 |雨晴春后，戏舞花中斗。|来去啼莺柳后，映醉脂红，淡眉如翠透。|笑颜携手，侧倚香腮右。|纵是人怀时候，不怕娇痴，知心心可守。|武陵春·清明 |寒食东风心已尽，日晚望乡来。|宿草青山处处开，欲语几家裁。|闻道梨花催雨过，撒纸与尘埃。|只恐双眸不住台，载不动几多哀。|两同心|窗外相逢，未曾相见。|身处境、灯下相思，人道是、镜花轻浅。|忆当时，岁月难当，哪堪离散。|醉梦睡醒怕看，对月空盼。|天凉尽、人世沧桑，地凉尽、人间侣眷。|舍得么？月桂枝头，万千缕线。|','2015年12月03日 16:07'),(14,'纪材尚','绳子','从今天起|读诗 学习 提升品质|从今天起|恋家 下厨 放下身子|从今天起|懂你 疼你 好好爱你|你我本是两股不相干的绳胚|被有意无意拧在一起|从此你中有我|我中有你|','2016年01月25日 09:00'),(15,'张三没丰','偶感      作者：左清','下午波光点点，|人世凄清。|波纹不平的水池，|人浮其中。|树上一声鸟唱，|恍惚一个人家。|我站在岸，|略感微寒。|','2015年09月03日 20:24'),(16,'张三没丰','黄昏  风景  抽象与回忆','有更多的面孔进入黄昏，|使黄昏显得异常沉重，|太阳没有面部，在人群中走动，|有着严肃的影子。背景是一座没有高度的山，|树上停着只不会说话的鸟，|在唱着异国的歌。|鸟声穿越云边，|笑声沉落水底。|傍晚，|从一个方向过来，风捎来封泛黄的书信，|只言片语，|仅剩的几片叶子上，|没留下任何地址。|','2015年09月05日 07:25'),(17,'车夫','秋天的山菊花','草地上已落满了枯叶|只留下|一团团，一簇簇|烛照的橘黄|删除春暖的花香，夏季蔽日的浓荫|远远地望去|秋风和秋霜正在山野弥漫|苍白的内心，苦涩的空旷|今天看到的这些山菊花|却让我感到意外的惊喜|她站在山坡的中央|向我露出了微笑的阳光|掏出了她身体里暗藏的清香|在秋风沙沙作响的天空回荡|我就坐在她的身旁|秋风正在一次一次把她点亮|她要把自己开成山坡上的庙宇|开成我苦命的母亲|开成留守故乡的妻子儿女|我却没有听见她的一丝声响|山菊花在沉默中芬芳了黄昏的彩霞|就像秋风摇曳云雾中的太阳|','2016年10月15日 22:21'),(18,'才旦多杰西藏','拉萨河畔的太阳','拉萨河畔清晨的|太阳犹如一盏酥油灯，忽明忽暗。|试图让我引进黄昏之乡|——漆黑的夜晚|怀揣你丰满的乳房。|想起夜里你温暖的|躯体淋着雨水。 |拉萨河畔清晨的|太阳犹如一盏酥油灯，忽明忽暗。|试图让月亮装饰|世界发出嘶叫|仿佛又听到你的颤音。|这一刻，佛陀在空中为爱情向导。|菩萨引领我前行。|请不要说出爱人的芳名。 |这一刻，丧失已久的影子，|在影片里相逢。|在彼此的眼里|一颗泪珠子在滚动。|','2016年10月15日 17:59'),(19,'泥文','拥有（外二首）','一栋房子空了，又一栋房子空了……|35栋房子，空了。那些破败的墙壁，150多个人|成群成群的鸡羊，犁耙，桐麻园的心跳|被谁的手偷走，仅剩的一条牛|牵着父亲65岁的手|天微明时上坡，下田，天黑时|踩在自己的脚窝子里，走进栅栏|情不自禁地低“哞”|没有邻里的“哞”声回应，这无奈的黑|让桐麻园跳不起，笑不出|藕塘里一池残枝败叶，天空里野鸭竞飞| |山路| |路上的草是欢腾的。少了锄头的刃口|锄向它的头颅。少了赤裸的双足|踩向它的头颅。少了种满茧子的手|伸向它的头颅。少了充满五谷杂粮的唾液|淹向它的头颅。少了牛的嘴唇|亲吻它的头颅。这条山径|是它们快乐的家园了，风餐露饮|在晴天与阴雨的节奏里，趾高气扬|它们的幸福，在这泥沙垒砌的窝里|一个个远行的身影|在这些草的欢腾和幸福中醒来| |祖父，我来看你了| |我能做的，是想将你坟头上的草除去|它们高过我的头颅，冬天的颜色|那隆起的土疙瘩|住着你的一生。如果不是我记得|我会如其他路过的人|看不出它的存在|这满山石头，没有一块石头|可以立于你的坟前，说你为桐麻园开过荒|为桐麻园留下过种子。悄无声息|一茬又一茬野草噬掠|一颗又一颗泥从你坟堆上漂移|不知去向。我就想将你坟头上的草除去|而后撒一撮你曾经踩过的泥|说出你的居所，说出我曾来过|却不能违背风俗，擅自捋去你坟头上的草|让你的居所焕然一新|','2016年10月15日 14:22'),(20,'忘了也好','低处的苦楝树','那么多日子，生在低矮的尘世|忧郁的时候，要学会从苦中提炼一丝甜|生活就慢成细细的水流|所有的承受，都开成一树小紫花|铃当一样敲响被压弯的腰|花都会落，都会结出小果子，你指给我的希望|就长成结实的样子|风吹来的时候，枝叶也会摇晃|但始终抓紧土地，贫瘠不是谁的错|当仰望高过枝头一寸，手中的光阴就短一截|当你说到爱，说到秋收，亲爱的|我更爱你荒芜的部分，以及|从心里疯长的绝望与孤独|','2016年10月15日 11:55'),(21,'我的世界','你,就是下一个住在骨头缝里的远方','终于，发现那盛开的小花|奔放在空旷的原野上|犹若阴雨潮湿里发霉的青苔|忘了一夜之后该出现在阳光下|绿仍是树的天空，我却是黄昏中的蝉鸣|弱弱地呈现我的惊慌给大地|我说我很想弯腰|为那花儿，再刷一层金黄的漆|牵上感觉，就朝那个方向|有山，有水，还有灵性的房子|你，就是下一个住在骨头缝里的远方|','2016年10月15日 11:37'),(22,'我的世界','你,就是下一个住在骨头缝里的远方','终于，发现那盛开的小花|奔放在空旷的原野上|犹若阴雨潮湿里发霉的青苔|忘了一夜之后该出现在阳光下|绿仍是树的天空，我却是黄昏中的蝉鸣|弱弱地呈现我的惊慌给大地|我说我很想弯腰|为那花儿，再刷一层金黄的漆|牵上感觉，就朝那个方向|有山，有水，还有灵性的房子|你，就是下一个住在骨头缝里的远方|','2016年10月15日 11:37'),(23,'坐忘','三伏天','老家吊脚楼，隐蔽在武陵山深处|说茶林堡村四面青山有点多余|这个三伏天，连影子都在燃烧|然而，与城里不同的是|太阳一下山|凉风就从某个方向窜出|一阵一阵，令人堕落|提把椅子到院坝坐下|山林轻轻摇晃，急啦啦的蝉声|与灶屋溢出的嫩苞谷的香气|达成默契。这时候|听母亲说她种的豆子和辣椒|心中渐渐凉爽|','2016年10月15日 09:32'),(24,'夏吟','乡间小屋等我归来','小屋没有声息|扑满怀的光泽|似一位迟暮的主人|我不是盗贼|不是过路人|是你度假归来的居停|小屋布满灰尘|如流水承载泥沙|空间里布满日子痕迹|盐和糖这些|血液里流动的物质|依然纯白的等我|茶叶和咖啡|有丝丝醇香滋味|乡间小屋|我荒寂的岛屿|阻隔于风尘之外|沉默耐心地等我归来|等我把它生动明亮起来|','2016年10月14日 21:37'),(25,'剑尖行者','塞外秋','十月走在路上|将拍下的晚秋风光一一翻看|树渐渐褪去衣裳|没有了绿色的屏障|塔里木河也开始惊慌了|小河、水库、池塘备足了冬眠的食物|山峦、田野和村庄也镀上了一层金黄|塔克拉玛干徜徉在寂寞的怀里|生出对祖国平安的畅想|塞外游子|却只有在梦中追着妈妈|看她|将白发轻轻撩拨|','2016年10月14日 20:08'),(26,'仲涛','简单生活','滴答滴答|秒针走六十下回到原点|一页一页|日历翻十二页又过一年|一件一件|父母给孩子的衣裳在长|一天一天|经历了平凡就安详告别|好高骛远的小燕子|终有一天开始衔泥巴做窝|','2016年05月06日 08:37'),(27,'纪材尚','你的名字','你的名字|只有两个字|极平凡极平凡|但这两个字一经珠联|却梦幻般瞬间裂变|美轮美奂动人心弦| |默念你的名字|一遍遍 一遍遍|从清晨初醒到深夜难眠|你的名字|是怒放我心中永不凋谢的花朵|幽幽芳香浸透心田| |偷写你的名字|一遍遍 一遍遍|久而久之|我的笔竟不听使唤|常在该写我名字的地方|留下了你的芳名| |轻唤你的名字|一遍遍 一遍遍|如梦中呓语似春燕呢喃|你的名字|是一首百读不厌的诗篇|每读一遍|都有新的激动新的眷恋| |你的名字|很短很短|短得我一口气能读好几遍|你的名字|好长好长|长得我一辈子也念不完|','2015年12月18日 20:53'),(28,'张三没丰','大雨打在我窗','那么多的脚步疾行，|大雨打在我窗。|街上已没有了行人，|仿佛空了出来。|天边一块云团，|仿佛陆地。|我蓬松的羽毛，|竖在灰暗的天下。|','2015年09月01日 17:57'),(29,'霜西草','霜西草诗词四首(图文)','诉衷情·读《李陵传》|当年一骑挡千山，饮马护长安。|一身百战功过，梦断觅侯难。|人未老，鬓先斑，叹衣单。|可堪回首？昨夜一番，今夜一番。|梅弄影·盟守 |雨晴春后，戏舞花中斗。|来去啼莺柳后，映醉脂红，淡眉如翠透。|笑颜携手，侧倚香腮右。|纵是人怀时候，不怕娇痴，知心心可守。|武陵春·清明 |寒食东风心已尽，日晚望乡来。|宿草青山处处开，欲语几家裁。|闻道梨花催雨过，撒纸与尘埃。|只恐双眸不住台，载不动几多哀。|两同心|窗外相逢，未曾相见。|身处境、灯下相思，人道是、镜花轻浅。|忆当时，岁月难当，哪堪离散。|醉梦睡醒怕看，对月空盼。|天凉尽、人世沧桑，地凉尽、人间侣眷。|舍得么？月桂枝头，万千缕线。|','2015年12月03日 16:07'),(30,'纪材尚','绳子','从今天起|读诗 学习 提升品质|从今天起|恋家 下厨 放下身子|从今天起|懂你 疼你 好好爱你|你我本是两股不相干的绳胚|被有意无意拧在一起|从此你中有我|我中有你|','2016年01月25日 09:00'),(31,'张三没丰','偶感      作者：左清','下午波光点点，|人世凄清。|波纹不平的水池，|人浮其中。|树上一声鸟唱，|恍惚一个人家。|我站在岸，|略感微寒。|','2015年09月03日 20:24'),(32,'张三没丰','黄昏  风景  抽象与回忆','有更多的面孔进入黄昏，|使黄昏显得异常沉重，|太阳没有面部，在人群中走动，|有着严肃的影子。背景是一座没有高度的山，|树上停着只不会说话的鸟，|在唱着异国的歌。|鸟声穿越云边，|笑声沉落水底。|傍晚，|从一个方向过来，风捎来封泛黄的书信，|只言片语，|仅剩的几片叶子上，|没留下任何地址。|','2015年09月05日 07:25'),(33,'白玛央金','夜歌','月的丰腴是对黑暗的阻挡|是肌肤上滑翔的语言|让夜变得柔美而光洁|自此|我畅饮着江河的音乐|把梦托付给光明|以此打动另一半人生|这样的光景中|寂静可以拧出孤独|时光倒塌    谁会站在视线尽头|撩拨秋夜晦涩的歌声|趁夜抚平黑暗  |宽宥一滴水的波浪|还有半壁翎羽的傲娇和块垒   |让歌声在黎明前破晓|2016年10月11日|','2016年10月12日 12:03'),(34,'阿连','热爱土地的人','很细，很小，很轻，很小心|似乎想把天地连接起来，一针一线|不疾不徐，秋这个季节还没来得及作出裁决|雨已绵绵，这样安排|被风吹过的金黄的稻浪|仍不肯变得散漫，渴望|投进太阳的怀抱，变得坚强|热爱土地的人，不怕流汗，不怕蚂蚁钻入衣间|要秋雨绵绵，望着一撮撮深浅不齐枯黑色的根|计划着：用锄作笔，浓墨重彩地着画|这块种绿树，那块种红花，剩下一块|自留地，准备着结硕果|','2016年10月12日 11:41'),(35,'项丽敏','哑巴诗','一个哑巴在挖地（可以叫他农民）|一个哑巴在吃草（可以叫它牛）| |还有许多哑巴，蹲在收割过稻田里晒太阳|（可以叫它们稻草垛）|空中的哑巴很小很小（叫它蝴蝶吧）|草丛里的哑巴很小很小（叫它蚜虫）|它们不知道自己的小么？|不知道有个眼睛很大的怪物，正盯着它|那个大眼睛的怪物一一就是我呀一一|（也是一个哑巴）| |独自穿过秋天，走往寂静深处|走到白茫茫没有边际的雪的原野，不说话|　　　　　　　　　　　　　2016-10-11|','2016年10月12日 09:07'),(36,'项丽敏','哑巴诗','一个哑巴在挖地（可以叫他农民）|一个哑巴在吃草（可以叫它牛）| |还有许多哑巴，蹲在收割过稻田里晒太阳|（可以叫它们稻草垛）|空中的哑巴很小很小（叫它蝴蝶吧）|草丛里的哑巴很小很小（叫它蚜虫）|它们不知道自己的小么？|不知道有个眼睛很大的怪物，正盯着它|那个大眼睛的怪物一一就是我呀一一|（也是一个哑巴）| |独自穿过秋天，走往寂静深处|走到白茫茫没有边际的雪的原野，不说话|　　　　　　　　　　　　　2016-10-11|','2016年10月12日 09:07'),(37,'秋野珺雪','城市学','复杂的事物，用3D|和缠绕的几何形状来表达|概念散落在街道上|市长每天用道路来造句|战略家们不喜欢词语和判断|他们是一流的文学家|至于章节的布局|是以草民，森林，河流为蓝本|那么，深刻的表达就是|把直线弄弯，把人进化成物|城市学是这样一种学问|让玫瑰开得更像玫瑰|最后，它开成了一朵腊梅|','2016年10月12日 08:21'),(38,'蒋卫','西门老街','从新华书店起，我所看到的弯曲|比老者的皱纹还要深。比妇人干瘪的乳房|还要保持孤独的倾斜|青石板锁紧眉头，风吹不动|它们怀着深深青苔，藤蔓一般舒展开身子|天后宫是睡着的。香火在绷紧的月光中|是多么缄默。我惊异于夜晚的檐角和瓦片|“仿佛有着开阔的内心，仿佛落日|也不会烧着”|夜鸟的偶尔啼鸣是冷静的|远比那几声犬吠，还要令人惊秫|在三山一井面前，我更多忘记了|我曾是多边主义者|“克服了自身厌倦，推翻这干涸的废井”|这似乎足以让往日的车马垂下眼脸|如果我停下脚步|我不得不承认，这小桥的栏杆|比我中年的胡须苍凉。还要具有|纯白的安宁|白日老市口里，如果很巧的话，你还会|听到咿呀呀的胡琴|象是眼下新落的茶花，从深巷里弥漫出来|而现在你看，今晚的月亮是新的|人是旧人。垂柳的慌不择路|多生出几分白发来。可是，这不重要|没有流水映照，红草也被砍尽了头颅|我只提着远古的城墙|在颤栗的西门老街，来与晚风作别|','2016年10月11日 21:30');
/*!40000 ALTER TABLE `mp_other_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_poem`
--

DROP TABLE IF EXISTS `mp_poem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_poem` (
  `poem_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `poem_text` varchar(500) NOT NULL,
  `poem_title` varchar(50) NOT NULL,
  `poem_num_support` int(11) NOT NULL DEFAULT '0',
  `poem_num_transmit` int(11) NOT NULL DEFAULT '0',
  `poem_num_comment` int(11) NOT NULL DEFAULT '0',
  `poem_publish_time` datetime NOT NULL,
  `poem_img` varchar(255) DEFAULT NULL,
  `label_id` int(11) NOT NULL,
  `label_name` varchar(10) NOT NULL,
  PRIMARY KEY (`poem_id`),
  KEY `user_id` (`user_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `mp_poem_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_poem_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `mp_label` (`label_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_poem`
--

LOCK TABLES `mp_poem` WRITE;
/*!40000 ALTER TABLE `mp_poem` DISABLE KEYS */;
INSERT INTO `mp_poem` VALUES (1,1,'假如我今生无缘遇到你，|就让我永远感到恨不相逢——|让我念念不忘，|让我在醒时梦中都怀带着这悲哀的苦痛。|当我的日子在世界的闹市中度过，|我的双手捧着每日的赢利的时候，|让我永远觉得我是一无所获——|让我念念不忘，|让我在醒时梦中都怀带着这悲哀的苦痛。|当我坐在路边，疲乏喘息，|当我在尘土中铺设卧具，|让我永远记着前面还有悠悠的长路——|让我念念不忘，|让我在醒时梦中都怀带着这悲哀的苦痛。|当我的屋子装饰好了，箫笛吹起，|欢笑声喧的时候，|让我永远觉得我还没有请你光临——|让我念念不忘，|让我在醒时梦中都怀带着这悲哀的苦痛。','假如我今生无缘遇到你',3,1,0,'2016-10-24 16:01:42','poem_2_1477296101592.jpg',10,'爱情'),(2,2,'我不去想是否能够成功|既然选择了远方|便只顾风雨兼程||我不去想能否赢得爱情|既然钟情于玫瑰|就勇敢地吐露真诚||我不去想身后会不会袭来寒风冷雨|既然目标是地平线|留给世界的只能是背影||我不去想未来是平坦还是泥泞|只要热爱生命|一切，都在意料之中','热爱生命',1,0,0,'2016-10-24 16:02:17','poem_2_1477296136545.jpg',5,'励志'),(3,3,'我是天空里的一片云，|偶尔投影在你的波心──|你不必讶异，|更无须欢喜──|在转瞬间消灭了踪影。|你我相逢在黑夜的海上，|你有你的，我有我的，方向；|你记得也好，|最好你忘掉|在这交会时互放的光亮！','偶然',1,1,0,'2016-10-24 16:03:10','poem_2_1477296189733.jpg',3,'友情'),(4,4,'终于，发现那盛开的小花|奔放在空旷的原野上|犹若阴雨潮湿里发霉的青苔|忘了一夜之后该出现在阳光下|绿仍是树的天空，我却是黄昏中的蝉鸣|弱弱地呈现我的惊慌给大地|我说我很想弯腰|为那花儿，再刷一层金黄的漆|牵上感觉，就朝那个方向|有山，有水，还有灵性的房子|你，就是下一个住在骨头缝里的远方|','你,就是下一个住在骨头缝里的远方',1,0,0,'2016-10-24 16:04:10',NULL,8,'风景'),(5,5,'老家吊脚楼，隐蔽在武陵山深处|说茶林堡村四面青山有点多余|这个三伏天，连影子都在燃烧|然而，与城里不同的是|太阳一下山|凉风就从某个方向窜出|一阵一阵，令人堕落|提把椅子到院坝坐下|山林轻轻摇晃，急啦啦的蝉声|与灶屋溢出的嫩苞谷的香气|达成默契。这时候|听母亲说她种的豆子和辣椒|心中渐渐凉爽|','三伏天',0,0,0,'2016-10-24 16:05:10',NULL,7,'思乡'),(6,6,'小屋没有声息|扑满怀的光泽|似一位迟暮的主人|我不是盗贼|不是过路人|是你度假归来的居停|小屋布满灰尘|如流水承载泥沙|空间里布满日子痕迹|盐和糖这些|血液里流动的物质|依然纯白的等我|茶叶和咖啡|有丝丝醇香滋味|乡间小屋|我荒寂的岛屿|阻隔于风尘之外|沉默耐心地等我归来|等我把它生动明亮起来|','乡间小屋等我归来',0,1,0,'2016-10-24 16:06:10',NULL,7,'思乡'),(7,7,'十月走在路上|将拍下的晚秋风光一一翻看|树渐渐褪去衣裳|没有了绿色的屏障|塔里木河也开始惊慌了|小河、水库、池塘备足了冬眠的食物|山峦、田野和村庄也镀上了一层金黄|塔克拉玛干徜徉在寂寞的怀里|生出对祖国平安的畅想|塞外游子|却只有在梦中追着妈妈|看她|将白发轻轻撩拨|','塞外秋',1,0,0,'2016-10-24 16:13:10',NULL,7,'思乡'),(8,8,'滴答滴答|秒针走六十下回到原点|一页一页|日历翻十二页又过一年|一件一件|父母给孩子的衣裳在长|一天一天|经历了平凡就安详告别|好高骛远的小燕子|终有一天开始衔泥巴做窝|','简单生活',1,1,0,'2016-10-25 16:03:10',NULL,6,'日常'),(9,9,'那么多的脚步疾行，|大雨打在我窗。|街上已没有了行人，|仿佛空了出来。|天边一块云团，|仿佛陆地。|我蓬松的羽毛，|竖在灰暗的天下。|','大雨打在我窗',1,1,0,'2016-10-26 16:03:10',NULL,6,'日常'),(10,10,'从今天起|读诗 学习 提升品质|从今天起|恋家 下厨 放下身子|从今天起|懂你 疼你 好好爱你|你我本是两股不相干的绳胚|被有意无意拧在一起|从此你中有我|我中有你|','绳子',0,1,0,'2016-10-26 17:03:10',NULL,10,'爱情'),(11,11,'下午波光点点，|人世凄清。|波纹不平的水池，|人浮其中。|树上一声鸟唱，|恍惚一个人家。|我站在岸，|略感微寒。|','偶感',0,0,0,'2016-10-26 18:03:10',NULL,4,'旅游'),(12,12,'有更多的面孔进入黄昏，|使黄昏显得异常沉重，|太阳没有面部，在人群中走动，|有着严肃的影子。背景是一座没有高度的山，|树上停着只不会说话的鸟，|在唱着异国的歌。|鸟声穿越云边，|笑声沉落水底。|傍晚，|从一个方向过来，风捎来封泛黄的书信，|只言片语，|仅剩的几片叶子上，|没留下任何地址。|','黄昏  风景  抽象与回忆',0,0,0,'2016-10-27 16:03:10',NULL,7,'思乡'),(13,13,'你站在桥上看风景|看风景人在楼上看你|明月装饰了你的窗子|你装饰了别人的梦','断章',1,1,0,'2016-10-28 16:03:10',NULL,8,'风景'),(14,14,'复杂的事物，用3D|和缠绕的几何形状来表达|概念散落在街道上|市长每天用道路来造句|战略家们不喜欢词语和判断|他们是一流的文学家|至于章节的布局|是以草民，森林，河流为蓝本|那么，深刻的表达就是|把直线弄弯，把人进化成物|城市学是这样一种学问|让玫瑰开得更像玫瑰|最后，它开成了一朵腊梅|','城市学',0,0,0,'2016-10-28 20:03:10',NULL,9,'哲理'),(16,16,'他们仿佛是些心怀仇恨的人。他们不停|向水里扔石头|好像他们只有不停地扔|才能解恨。唯有我|站在水边，看倒影的远山。树木。一些缭乱的身影|唯有我|理解江水的宽容和接纳|唯有我，手里攥着一块石头|迟迟不肯扔出去|唯有我，理解一个站在不远处的美女|她的泪珠儿，像酒滴一样辣人|','有别',0,0,0,'2016-10-29 16:03:10',NULL,1,'其他'),(17,15,'我们看到了什么。或|我们能看到什么。在最后|我们终要看到这里所流淌的|日光、房屋和街道，还有谁的亲爱|缓缓着沉默着|如大病初愈的孩子、毁掉厨房的母亲|因为阳光正好  而花到夜里败|你要夭折|闭眼就会夭折|但星星还在啊。另一片大地上。|','矮人',0,0,0,'2016-10-30 16:03:10',NULL,1,'其他');
/*!40000 ALTER TABLE `mp_poem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_recommend_poem`
--

DROP TABLE IF EXISTS `mp_recommend_poem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_recommend_poem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `mp_recommend_poem_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `mp_poem` (`poem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_recommend_poem`
--

LOCK TABLES `mp_recommend_poem` WRITE;
/*!40000 ALTER TABLE `mp_recommend_poem` DISABLE KEYS */;
INSERT INTO `mp_recommend_poem` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `mp_recommend_poem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_support`
--

DROP TABLE IF EXISTS `mp_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_support` (
  `user_id` int(11) NOT NULL,
  `poem_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`poem_id`),
  KEY `poem_id` (`poem_id`),
  CONSTRAINT `mp_support_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_support_ibfk_2` FOREIGN KEY (`poem_id`) REFERENCES `mp_poem` (`poem_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_support`
--

LOCK TABLES `mp_support` WRITE;
/*!40000 ALTER TABLE `mp_support` DISABLE KEYS */;
INSERT INTO `mp_support` VALUES (1,1),(9,1),(15,1),(1,2),(9,3),(15,4),(15,7),(15,8),(15,9),(15,13);
/*!40000 ALTER TABLE `mp_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_transmit`
--

DROP TABLE IF EXISTS `mp_transmit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_transmit` (
  `transmit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `poem_id` int(11) NOT NULL,
  `transmit_comment` varchar(120) NOT NULL,
  `transmit_time` datetime NOT NULL,
  `num_of_comment` int(11) NOT NULL DEFAULT '0',
  `num_of_support` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transmit_id`),
  KEY `user_id` (`user_id`),
  KEY `poem_id` (`poem_id`),
  CONSTRAINT `mp_transmit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_transmit_ibfk_2` FOREIGN KEY (`poem_id`) REFERENCES `mp_poem` (`poem_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_transmit`
--

LOCK TABLES `mp_transmit` WRITE;
/*!40000 ALTER TABLE `mp_transmit` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_transmit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_transmit_comment`
--

DROP TABLE IF EXISTS `mp_transmit_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_transmit_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `transmit_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_user_name` varchar(50) DEFAULT NULL,
  `commentor_id` int(11) NOT NULL,
  `commentor_name` varchar(50) NOT NULL,
  `comment_text` varchar(200) NOT NULL,
  `comment_time` datetime NOT NULL,
  `comment_thread` varchar(255) DEFAULT '/',
  PRIMARY KEY (`comment_id`),
  KEY `transmit_id` (`transmit_id`),
  KEY `parent_id` (`parent_id`),
  KEY `commentor_id` (`commentor_id`),
  CONSTRAINT `mp_transmit_comment_ibfk_1` FOREIGN KEY (`transmit_id`) REFERENCES `mp_transmit` (`transmit_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_transmit_comment_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `mp_transmit_comment` (`comment_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_transmit_comment_ibfk_3` FOREIGN KEY (`commentor_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_transmit_comment`
--

LOCK TABLES `mp_transmit_comment` WRITE;
/*!40000 ALTER TABLE `mp_transmit_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_transmit_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_transmit_support`
--

DROP TABLE IF EXISTS `mp_transmit_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_transmit_support` (
  `user_id` int(11) NOT NULL,
  `transmit_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`transmit_id`),
  KEY `transmit_id` (`transmit_id`),
  CONSTRAINT `mp_transmit_support_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mp_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `mp_transmit_support_ibfk_2` FOREIGN KEY (`transmit_id`) REFERENCES `mp_transmit` (`transmit_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_transmit_support`
--

LOCK TABLES `mp_transmit_support` WRITE;
/*!40000 ALTER TABLE `mp_transmit_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_transmit_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_user`
--

DROP TABLE IF EXISTS `mp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_icon` varchar(255) NOT NULL DEFAULT 'userDefault.jpeg',
  `user_motto` varchar(150) DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_sex` int(11) DEFAULT '1',
  `user_password` varchar(255) NOT NULL,
  `user_intro` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_user`
--

LOCK TABLES `mp_user` WRITE;
/*!40000 ALTER TABLE `mp_user` DISABLE KEYS */;
INSERT INTO `mp_user` VALUES (1,'小吴','userDefault.jpeg',NULL,'1803240383@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(2,'刘备','userDefault.jpeg',NULL,'123456@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(3,'关羽','userDefault.jpeg',NULL,'234561@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(4,'永良','userDefault.jpeg',NULL,'345612@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(5,'吴明','userDefault.jpeg',NULL,'456123@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(6,'李晓红','userDefault.jpeg',NULL,'561234@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(7,'沈公子','userDefault.jpeg',NULL,'612345@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(8,'帅番茄','userDefault.jpeg',NULL,'000001@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(9,'诗人9','userDefault.jpeg',NULL,'000002@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(10,'修理笔','userDefault.jpeg',NULL,'000003@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(11,'庭仔','userDefault.jpeg',NULL,'000004@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(12,'纯映','userDefault.jpeg',NULL,'000005@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(13,'啊炳','userDefault.jpeg',NULL,'000006@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(14,'帆子','userDefault.jpeg',NULL,'000007@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL),(15,'关鱼鱼','userDefault.jpeg',NULL,'000008@qq.com',0,'e10adc3949ba59abbe56e057f20f883e',NULL),(16,'彭于晏','userDefault.jpeg',NULL,'000009@qq.com',1,'e10adc3949ba59abbe56e057f20f883e',NULL);
/*!40000 ALTER TABLE `mp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-30 20:59:04
