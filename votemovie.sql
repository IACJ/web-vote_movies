-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-10-12 14:05:54
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `votemovie`
--

-- --------------------------------------------------------

--
-- 表的结构 `stamp`
--

CREATE TABLE IF NOT EXISTS `stamp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  `received` int(11) NOT NULL DEFAULT '0',
  `used` int(11) NOT NULL DEFAULT '0',
  `gettime` datetime NOT NULL,
  `receivetime` datetime NOT NULL,
  `usetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `stamp`
--

INSERT INTO `stamp` (`id`, `name`, `received`, `used`, `gettime`, `receivetime`, `usetime`) VALUES
(1, 32247314, 0, 0, '2016-10-11 01:16:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 28336181, 0, 0, '2016-10-11 01:17:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 79425354, 0, 0, '2016-10-11 01:17:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 66738891, 0, 0, '2016-10-11 01:17:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 0, 0, '2016-10-11 01:19:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 33238830, 0, 0, '2016-10-11 01:27:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 49907836, 0, 0, '2016-10-11 01:27:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 93548278, 0, 0, '2016-10-11 01:30:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 22700195, 0, 0, '2016-10-11 01:31:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 50503845, 0, 0, '2016-10-11 01:48:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 32137451, 0, 0, '2016-10-11 01:54:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 77513732, 0, 0, '2016-10-11 01:54:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 38885803, 0, 0, '2016-10-11 01:57:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 36952209, 0, 0, '2016-10-11 01:59:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 55425720, 0, 0, '2016-10-11 02:09:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 90782470, 0, 0, '2016-10-12 15:16:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `details` text NOT NULL,
  `vote` int(11) NOT NULL DEFAULT '0',
  `type` varchar(4) NOT NULL DEFAULT '动作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `vote`
--

INSERT INTO `vote` (`id`, `name`, `details`, `vote`, `type`) VALUES
(1, '遇见你之前', '　　露露是一个小镇女孩，不久前被咖啡馆解雇，只好接下一份特别的的工作：成为一名瘫痪病人的全职看护。\r\n　　她发现，看护对象是一名因车祸导致全身瘫痪的年轻人威尔·特雷纳，过去热爱旅行冒险，却因一场车祸而改变，变得自暴自弃。乐观的小露向他展示生命的美好，两人都重新找到人生与心灵的归属。', 1, '爱情'),
(2, '他是龙', '  每到特定日子，人们必须献祭出美丽的女孩成为恶龙的 “新娘”。屠龙者历经千辛万苦，终将恶龙杀死。 \r\n　公爵小女儿米拉即将举行婚礼。新娘米拉却被恶龙掳走。她遇到神秘人阿尔曼，发现竟是恶龙。米拉改变了阿尔曼的龙性，但阿尔曼怕自己伤害到米拉，假装赶走米拉，米拉被未婚夫救走，婚礼将再次举行', 1, '爱情'),
(3, '咖啡公社', '　　青年鲍勃前往好莱坞投奔舅舅菲尔，结识了瓦妮。两人坠入爱河，但瓦妮已有男友。 \r\n　　瓦妮的男友是有妇之夫，后者因无法离婚而决定分手。鲍勃陪伴着伤心的瓦妮，两人走到了一起。没想到，瓦妮的前男友竟是菲尔，当菲尔决心要娶瓦妮后，瓦妮离开了鲍勃。失意的鲍勃返回家乡，在那里遇见了维罗妮......', 0, '爱情'),
(4, '布鲁克林', '　　艾莉丝离开故乡，前往美国寻求发展。在神父弗雷德的帮助下，艾莉丝成了售货员，她慢慢获得了主管的认可。之后，艾莉丝结识了男孩托尼，两人相爱了。 \r\n　　一场意外让艾莉丝重回故乡，她察觉，母亲希望自己留下。经母亲介绍，艾莉丝结识了善良的吉姆，并得到了一个很好的工作，至此，艾莉丝会怎样选择？', 1, '爱情'),
(5, '北京遇上西雅图之不二情书', '    焦娇15岁就来到了澳门，长大后成了赌场公关。罗大牛早年来到美国，如今是加州的一名房地产经纪人，是公认的钻石王老五。 \r\n　　《查令十字街84号》让这对男女走到了一起，两人经历波折，发现彼此是自己的灵魂伴侣。期间，焦娇在三个男人之间徘徊，而罗大牛则在和一对老夫妻的交往中发现了人生道义。 ', 1, '爱情'),
(6, '谁的青春不迷茫', '　　林天娇是公认的三好学生。但在一场重要的考试中，林天娇因生病而发挥不佳，她想到了作弊，却东窗事发。 \r\n　　让林天娇意外的是，同学高翔替自己背了黑锅，高翔是林天娇最瞧不起的捣蛋王讨厌鬼。就这样，林天娇和高翔开始产生奇妙的羁绊，总有一股力量将两人凑在一起。两人都渐渐走近了对方的心。', 0, '爱情'),
(7, '美人鱼', '　　富豪刘轩新拍下一块地皮，并联合女强人李若兰使用恐怖的声纳技术驱赶鱼类。人鱼一族长期居住在附近区域的海里，为了生存，带头大哥章鱼八哥派出了美人鱼珊珊色诱刘轩，准备刺杀。没想到珊珊在卧底过程中与刘轩暗生情愫，破坏了暗杀计划，而李若兰却在准备一个更丧心病狂的邪恶计划……', 0, '爱情'),
(8, '七月与安生', '　　一本名为《七月与安生》的网上小说火红面世，令李安生和林七月的生活骤起波澜。\r\n　　七月与安生从踏入中学校门的一刻起，便宿命般地成为了朋友。她们性格不同、但互相吸引。她们以为会永远陪伴彼此，但青春的阵痛带来的不是别的，而是对同一个男生的爱——苏家明，至此，成长的大幕轰然打开……', 0, '爱情'),
(9, '山河故人', '　　1999年，女孩沈涛徘徊在矿工梁子和煤矿老板张晋生两端。梁子和晋生的友情破裂。梁子选择了远方。 \r\n　　2014年，梁子的身体每况愈下。最后的时光，他带着妻儿回到故乡。此时沈涛和晋生已经离婚，晋生带着孩子到乐常住上海。 \r\n　　2025年，到乐和父亲分外隔膜。他渴望脱离父亲的控制，渴望得到所谓的“自由”', 0, '爱情'),
(10, '初恋这首情歌', '　　80年代的爱尔兰，14岁男孩康纳（“宇宙”）在学校受同学欺负，只好从音乐中寻找慰籍。“宇宙”喜欢上了女孩拉菲娜，发现她也是个音乐迷。为了打动拉菲娜，“宇宙”决定组建乐队。这个原本异想天开的念头，随着“宇宙”对音乐的了解变的真实。两个人甚至决定搬到伦敦，去实现音乐梦想。', 0, '爱情'),
(11, '你的名字', '    某一天，三叶做了一个变成男孩子的梦。眼前出现的则是东京的街道。三叶虽然感到困惑，但是能够来到朝思暮想的都市生活，让她觉得神清气爽。另一方面在东京生活的男高中生立花泷也做了个奇怪的梦，他在一个从未去过的深山小镇中，变成了女高中生。两人就这样在梦中邂逅了彼此。', 0, '动画'),
(12, '疯狂动物城', '    兔子朱迪从小梦想能成为警察，尽管身边的人都觉得兔子不可能当上警察，但她还是通过自己的努力，成为第一个兔子警官。为了证明自己，她决心侦破一桩神秘案件。在追寻真相的路上，她发现这桩案件背后隐藏着颠覆动物城的巨大阴谋。坑蒙拐骗的狐狸尼克被迫与她合作，揭开了隐藏在这巨大阴谋后的真相。', 0, '动画'),
(13, '萤火之森', '    6岁小女孩闯进了住满妖怪的山神森林。当她迷路时，戴狐狸面具的男孩出现在她面前，引领着萤回家。萤很感激，但男孩禁止她碰触身体，这名叫银的男孩并非人类，被人类碰触就会消失。此后的日子，他们走遍了森林的每个角落。随年龄的增长，萤和银彼此的情感都发生了变化，他们期待相聚，期待拥抱对方......', 0, '动画'),
(14, '大鱼海棠', '    居住在“神之围楼”里的女孩“椿”，十六岁生日那天变作海豚到人间巡礼，被大海中的一张网困住，一个人类男孩因救她而落海死去。为报恩，她需要在自己的世界里帮助男孩的灵魂——一条拇指那么大的小鱼，成长为比鲸更巨大的鱼并回归大海。这一过程却不断地违背“神”的世界规律而引发种种灾难', 0, '动画'),
(15, '首尔站', '    影片讲述的是受感染的露宿者变成了丧尸，而病毒从首尔站开始迅速传播，离家出走的少女身陷危机之中，她的“父亲”和男朋友也为了救她而奋不顾身。影片以韩国的“心脏”首尔为背景，而首尔站则是首尔的中心，影片中的首尔站充满了绝望和混乱，而且也讽刺了社会的阴暗面和权利者毫无慈悲的暴力行动。', 0, '动画'),
(16, '愤怒的小鸟', '    作为天生拥有黑粗眉的小鸟，“胖红”走到哪里都被嘲笑，暴脾气让它更加孤僻。不过即便是暴躁的“胖红”也有脾气相投的死党，“飞镖黄”恰克与“炸弹黑”就是它的好基友。当“绿猪”初到小鸟岛时，正是敏锐的“胖红”发现了蹊跷之处，然而法官大人却无视“胖红”的忠告，导致蠢萌“绿猪”诡计得逞。', 0, '动画'),
(17, '爱宠大机密', '    在纽约公寓大楼里有一群宠物。在这群宠物中，有一只梗犬是领袖，他叫麦克，自认是女主人生活的中心。直到她从外带回家一只懒散、没有家教的大狗杜老大，两者很难共处。但当它们流落街头后，两狗又必须共同阻止被抛弃的宠物兔小白——后者为了报复人类，准备组织遭弃宠物大军向人类发起总攻。', 0, '动画'),
(18, '秒速五厘米', '    动画以一个少年为故事轴心而展开连续3个独立故事的动画短篇。  第一话《樱花抄》描述贵树与明里年幼时恋爱的心情，以及他们重逢的一天。第二话《宇航员》描述以对进入高中就读的贵树怀有好感的澄田花苗的视角来展现贵树与明里分别后的生活，第三话《秒速5厘米》则刻画了贵树和明里长大后内心的彷徨。', 0, '动画'),
(19, '头脑特工队', '    莱莉因为父亲的因素举家搬迁旧金山，要适应新环境，但在此时，莱莉脑中控制欢乐与忧伤的两位大臣乐乐与忧忧迷失在茫茫脑海中，大脑总部只剩下掌管愤怒、害怕与厌恶的三位干部负责，导致乐观的莱莉变成愤世忌俗少女。乐乐与忧忧要尽快在复杂的脑中世界回到大脑总部，让莱莉重拾原本快乐正常的情绪。', 0, '动画'),
(20, '海洋之歌', '    在一个海中小岛，小男孩本和怀有身孕的母亲布罗娜渡过了快乐而难忘的夜晚。不久后，妹妹西尔莎出生，而因母亲却撒手人寰。过了六年，充满幻想的西尔莎发现妈妈留下的贝笛，结果险些溺毙大海，导致奶奶强制性将两个孩子带离小岛。兄妹俩无法适应城市的生活，决定回到海边的家乡。神奇的冒险就此展开。', 0, '动画'),
(21, '完美陌生人', '    七个好朋友聚在一起吃晚餐。忽然他们决定与对方分享短信的内容，由此许多秘密引出了彼此看似平淡无奇生活之下暗涌的层层情绪和欲望，这里面朋友和夫妻的关系变成让人力有不逮的存在，表面上是大家是惯常社会中常见的亲密的朋友，但到后来一切的发展愈加失控，随之而来的真相让大家几乎全线崩溃。', 0, '剧情'),
(22, '铜牌巨星', '   霍普曾是美国英雄人物。有一天，他父亲伪造了她教练遗书。她重出江湖，并与素来的对手打赌帮助女生夺奖，之后女生夺得了金牌。不想女生选择了霍普资源更优良的对手作为新一任教练。而霍普仍待在小镇上，和心爱的男人一起训练小孩们体操，她也依旧是小镇上的英雄。', 0, '剧情'),
(23, '惊天大逆转', '    海归华人郭志华在韩国结识了心理医生杨曦，便委托她为哥哥郭志达进行创后心理诊疗辅导。同时，正在进行着一场中韩足球对抗赛，中方的队长得知，未婚妻被绑架，必须赢得比赛。韩国警方接到报警后，特工组长姜承俊出镜，警方顺利救出了人质。本以为一切已经结束时，却发现极端计划才刚刚开始。', 0, '剧情'),
(24, '惊天魔盗团', '    四骑士重新聚首，借一场大秀意图揭穿一位科技大亨的不义之举，不料行动失败。同时，他们背后的支持者迪伦自己也深陷危机。幕后黑手正是科学奇才沃尔特，他胁迫四骑士去完成一次不可能的偷盗任务。四骑士只剩最后的希望，他们必须上演一场前所未有的魔术秀来为自己正名，揭穿背后主谋。', 0, '剧情'),
(25, '湄公河行动', '    两艘中国商船在湄公河流域遇袭，船上13名中国船员全部遇难，并在船上发现90万粒毒品。这掀起了悲剧的序幕，面对矛头指向中国运毒、颠倒是非的舆论，为了还遇难同胞一个清白，中国决定派出缉毒精英，潜入金三角查明真相，企图揪出案件的幕后黑手。', 0, '剧情'),
(26, '荒野猎人', '    格拉斯是一名皮草猎人，在一次打猎途中被一头熊殴打成重伤后被同行的乘船船长安德鲁救下，船长雇佣了约翰和吉姆来照顾他。但约翰一心只想着将格拉斯的财产占为己有，于是残忍的杀害了格拉斯的儿子，并说服吉姆将格拉斯抛弃在荒野等死。但格拉斯凭借坚强的毅力到了安全地带并开始了复仇计划。\r\n', 0, '剧情'),
(27, '瑞士军刀男', '    一个被困在荒野上的男人汉克生无可恋，在绝望之际准备上吊结束自己的生命时，他发现一具顺水而来的尸体曼尼，于是他改变了自己的主意。汉克与尸体成为了朋友，“两人”在孤岛做彼此的天使。随后，汉克发现曼尼并不是一个世俗意义上的“人类”。于是，他便开始了利用曼尼回家的旅程。', 0, '剧情'),
(28, '火星救援', '    人类实现了首次在火星上登陆，宇航员沃特尼与其他宇航员遭遇巨型风暴，他被误认为无法生还而被留在火星。清醒后的沃特尼决定靠自己的力量生存下去。在地球上，公众哀悼马克的悲剧死亡后，有人注意到火星表面的运动迹象，怀疑马克还活着。双方重新取得联系后，火星救援任务由此启动。', 0, '剧情'),
(29, '追凶者也', '    中国西南边一名摩的司机被残忍杀害，耿直的汽车修理店老板宋老二因为和死者猫哥有过恩怨而变成了警方和村民的怀疑对象。在警方毫无头绪的情况下，宋老二只能依靠自己的力量开始追查凶手，为自己洗刷冤屈。随后的故事人物，在荒蛮西部上演了一场追凶大戏', 0, '剧情'),
(30, '踏血寻梅', '    王佳梅因辗转走上援交少女之路。深受情伤的货车司机丁子聪在网络上找到了佳梅，两人在MSN聊起来说到了爱和恨，生和死。凶案发生当天，二人来到床上，交合期间佳梅跟丁说她想死，丁捏著她的脖子，直至她断气为止。臧Sir是一个怪警员，他希望找出真正的原因，证明人性非恶，燃点黑暗之光。', 0, '剧情'),
(31, '招魂2', '    身在英国伦敦的单身母亲佩吉·哈德森家中遭遇灵异事件。她家中的家具突然自己移动起来，11岁的女儿珍妮特甚至被魔鬼缠身。随后罗琳与艾德被教会叫去调查此事，他们终于明白原来珍妮特说得都是真的。只是在亲眼目睹了哈德森家的灵异，罗琳开始怀疑是否应该接受此次驱魔任务。', 0, '惊悚'),
(32, '寄生兽', '    影片讲述了泉新一是被寄生生物寄生的人类，寄生在他体内的生物“MIGI”并没有吃掉他的脑，而是取代了他的右手。而泉新一为了被寄生兽杀死的亲友以及所有人类的未来，开始了一系列与其他完全体寄生兽的殊死搏斗。', 0, '惊悚'),
(33, '我是传奇', '    影片主要讲述的是2012年，人类最终被病毒所击垮，前军方病毒学家罗伯·奈佛（威尔·史密斯饰）因为体内有自然抗体未受到感染，而成为纽约市唯一的幸存者，甚至曾一度认为自己就是全世界唯一幸存的人类。', 0, '惊悚'),
(34, '僵尸来袭', '    巴里是一位天才机械师，在末世的僵尸之夜，他的家庭被无情地撕碎。他的妹妹，被一群邪恶的戴着面具打扮成士兵的人绑架，然后被一个精神病医生拿去做实验。Barry和另一个幸存者Benny组成了队伍，他们必须武装自己、穿过残酷的澳大利亚原始森林区，其中还有无数的食人僵尸。', 0, '惊悚'),
(35, '孤儿怨', '    影片讲述了一对夫妇收养了一个看似天真可爱的9岁小女孩，而女孩身上暗藏着的巨大隐秘却近乎导致他们家破人亡的故事。\r\n釜山行：影片讲述主人公单亲爸爸石宇与女儿秀安乘坐KTX高速列车往釜山，列车上由一位少女身上带来的僵尸病毒开始肆虐且不断扩散，倾刻间列车陷入灾难的故事。', 0, '惊悚'),
(36, '釜山行', '    影片讲述主人公单亲爸爸石宇与女儿秀安乘坐KTX高速列车往釜山，列车上由一位少女身上带来的僵尸病毒开始肆虐且不断扩散，倾刻间列车陷入灾难的故事。', 0, '惊悚'),
(37, '哭声', '    该片讲述了一个诡异的日本人来到小村庄后发生了连环中毒事件，警察钟久的女儿受牵连后，没有办法下只有找来道士日光联手查出真相的故事。', 0, '惊悚'),
(38, '屏住呼吸', '    一群年轻的朋友们周末驾车去郊外露营游玩，当他们经过一片墓地时，必须屏住呼吸 因为这里流传着一种说法，如果你经过墓地而没有屏住呼吸，恶魔就会通过人的呼吸进入到身体里，恶魔附身后就会开始血腥的屠戮。他们中有人没有屏住呼吸，恶魔开始一个个附身其中，开始杀戮周围的同伴。', 0, '惊悚'),
(39, '新哥斯拉', '    在《新·哥斯拉》中，哥斯拉登陆东京，强大的破坏力令城市危在旦夕。影片故事围绕着长谷川博己饰演的内阁官房副长官矢口与石原里美饰演的美国特派哥斯拉对策特使佳代子展开。', 0, '惊悚'),
(40, '猩红山峰', '    一位出身名门的女作家伊迪丝·库欣，她爱上了一位极富魅力的追求者托马斯·夏普，为此放弃了青梅竹马的恋人艾伦·麦克迈克尔，在婚后被带到了丈夫的古堡中生活，她发现了一些意料之外的秘密，，少年时代的恋人艾伦·麦克迈克尔则一直试图解救伊迪丝，她在两个男人之间摇摆不定。', 0, '惊悚'),
(41, '星际迷航3', '    超越星辰：《星际迷航3：超越星辰》是2009年开启的新三部曲中的第三部，也是该系列第13部大银幕作，讲述了企业号的船员们开始了长达五年的探索之旅，却在途中滞留异星，遭遇了当地种族的追杀的故事。', 0, '动作'),
(42, '谍影重重5', '    《谍影重重5》是由美国环球影业出品的动作片，由保罗·格林格拉斯执导。故事背景设定在后斯诺登时代，讲述了杰森·伯恩在寻找着关于自己身世的时候发现惊天的阴谋，再次现身展开斗争的故事。', 0, '动作'),
(43, '寒战2', '    《寒战2》是《寒战》系列的第二部，讲述了经过寒战行动后，冲锋车案件主谋李家俊设计逃脱警方控制，与幕后黑手汇合联手策划更大阴谋。而现警务处长刘杰辉，前警务副处长李文彬，和资深大律师简奥伟被卷入其中，香港将面临更加大的危机……', 0, '动作'),
(44, '王牌特工', '    特工学院：《王牌特工：特工学院》改编自马克·米勒的同名漫画，讲述了一个神秘的特工组织招募新血，老牌精英特工哈利推荐了一位年轻男孩艾格西加入，而同时，一名科技天才引发的全球性威胁正在蔓延，艾格西能否阻止这场致命威胁？一场分秒必争的较量一触即发。', 0, '动作'),
(45, '碟中谍5', '    神秘国度：《碟中谍5：神秘国度》是《碟中谍》系列电影的第五部，伊桑·亨特与他的团队一起遭到一个名为“神秘国度”的组织追杀，对方是与他们同样技艺高超的劲敌，试图摧毁亨特所在的“不可能任务情报署”。亨特将遭遇间谍生涯中最严峻的危险。', 0, '动作'),
(46, '魔兽', '    《魔兽》讲述了平静祥和的艾泽拉斯大陆陷入战争即将爆发的边缘，它的文明遭到令人畏惧的种族的侵略。黑暗之门开启，敌对的两位英雄不得不展开生死较量，一场力量与牺牲的恢弘冒险即将展开，战争不再是非黑即白的纯粹，每个人都为着各自的目标奋起而战。', 0, '动作'),
(47, '杀破狼2', '    《杀破狼2》是一部犯罪悬疑片，描述的是卧底探员志杰被身患重病的黑帮头目洪爷屈在泰国黑狱。洪爷为了续命、阿猜为救女儿、志杰只为求公义，一场人性善恶、因果宿命的战斗旋即展开！”因为第一部中几位主角均已暴死，因此这个故事将以前传的形式延续展开，甄子丹扮演的“马军”不再出现。', 0, '动作'),
(48, '蝙蝠侠大战超人', '    正义黎明：蝙蝠侠大战超人：正义黎明是DC扩展宇宙的第二部电影，该片故事背景设定在《超人：钢铁之躯》结尾大战后，围绕着蝙蝠侠和超人之间激增的矛盾而展开，讲述了超人帮助人类解决了很多问题，成为了人类的神，却引起了莱克斯·卢瑟的嫉妒，从而挑拨蝙蝠侠与超人之间战斗的故事。', 0, '动作'),
(49, '使徒行者', '    《使徒行者》讲述了卧底阿钉收到了一条神秘短信，追溯到神秘人郭铭的犯罪集团，其手下两名重臣少爷和阿蓝很可能是之前警队失联的卧底。而在捣灭犯罪集团的过程中，其中一人暴露身份也使这对情同手足的好兄弟陷入信任和生命危机。在迷雾中，一场激战蓄势待发。', 0, '动作'),
(50, '王牌贱谍：格林斯比', '    《王牌贱谍：格林姆斯比》是2016年上映的一部动作喜剧片，影片讲述了高级间谍为了完成一项任务，不得不同自己的足球流氓哥哥合作。当蠢贱无双的哥哥遇到精英特工弟弟，活活将一次箭在弦上的隐秘行动，变成一场鸡飞狗跳的绝命逃亡。', 0, '动作');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
