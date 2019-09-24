-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 24, 2019 at 10:23 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `name`) VALUES
(1, 'Java&JavaEE'),
(2, 'NET CORE'),
(3, 'Mobile development'),
(4, 'SQL'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `postID` int(11) NOT NULL,
  `authorID` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentID`, `postID`, `authorID`, `content`, `title`) VALUES
(1, 3, 1, 'Komentari rade', 'Komentari?'),
(2, 3, 1, 'Komentar2', 'fafdsadfasfas'),
(4, 2, 1, 'test', 'ttt');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) NOT NULL,
  `authorID` int(11) NOT NULL,
  `reputation` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `content` longtext NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`postID`, `categoryID`, `authorID`, `reputation`, `title`, `content`, `date`) VALUES
(2, 1, 1, 5, 'Test clanak', 'dasfafdasfadfasradsdasdasdasdasfasfasdqwwq', '2019-09-20 16:23:46'),
(3, 4, 1, 7, 'Clanak 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis imperdiet enim quam, quis efficitur tortor aliquet at. Cras nunc tortor, finibus eget ligula eu, ullamcorper malesuada lacus. Praesent ullamcorper eros quis risus tempus gravida. Nam sed porttitor felis. Praesent vel purus non nulla fermentum pulvinar. Suspendisse porta ex est, vitae volutpat nulla condimentum sed. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean ornare lorem quam, sed molestie metus tincidunt vel. Nullam sed venenatis massa, sit amet posuere purus. Donec id nibh elementum, ultricies orci sit amet, cursus ipsum. Sed in luctus urna.\r\n\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Integer ipsum lorem, elementum ac eros et, pretium tempus massa. Duis sit amet massa sit amet turpis consequat vestibulum. Suspendisse mattis fringilla massa sed fermentum. Sed sodales mi vitae tortor consequat, non pretium risus ornare. Mauris varius sed nunc sit amet viverra. Ut pharetra nisl a odio tempus, in ultrices arcu pretium.', '2019-09-22 16:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `picture` longblob,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `picture`) VALUES
(1, 'Skandi', 'test', 0x89504e470d0a1a0a0000000d494844520000010f0000010f08060000012b2871a80000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000167f4944415478da62fcffff3fc360004c0c83048c3a64d421a30e1975c8a843461d32621cc2006a06206318782bad2f01c40be865370bba24d0728e3bffff7ddff6eb0743eceb9b8c403ed875c24f2f3282686579852f404a06882703f1abbb0f1f14c3f402e5c06a81628c20368846361b26065307048c04438414003218880ba0ec03507a02107f84b2bfa3a90563647b99b085c84529ddff2bc434ff43f9ff61a1020b11201600e20540dc0b0b01747380622087f141438113394406751a611c6db38e3a64d421a30e1975c8a843461d4267001040a3b5efa843461d32ea9051878c3a64d42123d621f84603ea8038825ef662b447eecb18fcbffef737c3dd5fbf38a339b9af02859480f8a7f0d38b1c2079e4511f6c2342c87c6479a81c480f13887de7c17d46a242041b8059844c037103ba03a0e2cbb0e981b131ec45177826adff7fb7a4f6ffe9c2aaecc0a8b90b1d31fa81c7310db81c8cc47f0375dc3fa21d3268d2c8683932ea9051878c3a64d421a30e1975088d0140000d9ada773466460364344046036434404603643440460364344046c168808c06c868808c06c86880d00ab0101c1f6084cca3ac13d7ea7afff7cfbee437b776bc95d60f0409a1299d26fcf462f650f034de210ff4e909740c5bd10b9ab7b928a5fb015d3f504e05a60679e52f08a04d0e8166b94e03b11c946f833e9984ce86f20fe0300f997d008f1cc644153eff129d65d881988d8191d2c86106b907cafecb8058f4dd88a4a6909021c8d3874036689ad11e5b609203088e98c1b2cc5609ade6b77fff9e8b7b7d733d3025040085d60fc72c333a84385acb8c06c868808c06c868808c06c868808c06c868808c06c868808c06c868808c06c8b0070001d83b635f8682388ebf0e1236894ab4080989a12d6d0cb51a241603aba50b62904ec29f50a64a6c06167f810183d8a40bda51554204d1d7362462d2f7fc4e7e2797d3f7fae8a27c2ff9e57ebf7b777df73e77efee75f8dd0f7fff3143000440000440000440000440000440000440000440000440900004400004400004400004400004400004409a3d79762092898f169b20792459efb8cb3d35db4337e40d21801c7685664a5675b0f256dd5caa5cbe1214116ba055ad278328fc7920c59ea86dda96610aef2aab6a101463be9cf7f16cb1dda00cf4f5fb2933499eaf6eaedbb9ec33b204dbaba4a79436b364ef6ace40399234c9b6b4a94e5469b347f69462cbb6312acf922dea9ecbeb5fce1fd4697971312b740fdb27c170406f2f668be26296d1803c68764dd72f9214eb8b2eae6209455f71fa5db6b39c1f884161209e9eb9ee1a52ef55a0eb6db5ca456768747480738abea1e8e354ff8cf216b77b891021ac2649d6b82ce3746a25d9930c2ba641f3fd789791a37f4b721a8cf8bdce10eeccbd567d4bd1934add3865479447dcfa22429570b89292521c77f2b5a3f27dcafcf21595d2d02e235285a65291d691b265993b9d4346c2bc705a43c6b4a623dcd98f35448d3a53633497bfb12efaf9810bfa59a56ccbfb8e925d26bdd7eb0cf1b4cb1c07c2d3b4cb8468414d2f94f32fff7a97c177083edd910004400004400004400004400004400004400004400004400004094000044000044000044000044000e497a77701d83b7fd02882280e1f44240882629713542c6cc4d35610d436a0a6b150fc93345a0a41508b1049216813abb4079a4ebb58aba00882a82069d428c241026a14ccdd05c98ebf97bc9361dd4de46e23987c1f3c263b33f772b7fbedcd5c02f7f8673770c700820082008200820082008200820020082008200820082008200820082008200800820082008200820082008200820082008200200820082008ac361b3a4d90feee7fe34bb972424dbfe28862f35fa61ada567b3dc225591ddafd16878ebffec10479dbb3afab5e0af33f42b0b6d44842a9aebccd90e8e7c508cd240c5cfb3e55953c566a687685b43f25cb462eeb1a10e4ebf6fdbf13cc59289f496282783ce99b993c94f558c932a1a67799f48725cae3ac81dd3b769e5233ee87f7fdddf0b81d44f5ad5acfcd0afbd8ef3aa930411b9ab329ca65f3aec6b5b0a2b1736aaa51ced168d88a02d514f7fcb8a679b7bc3c94d5cb8aab28ed521c537cd39cad39afc99e47bfc6ab39639ffd355bfd9cd33e7447f3cffa9c56adaddbe9c7bffbf8e152db667512d1c5dea2e8fe1777834ec4505e95a5f8842a1ee68c4da76b7f2916bc1df3be2b71ff32bfe35146fff9acc7a86f70855c2fbdbd9833fe2aa7ff794b90bcfced5edf4237a9badb9bfff1e67ac4df25f6f849eef3e3c10e440e71a8eb42baf296fa5b55b9263476406d8f62cc045d139bd4b84cd94cb9b2b8bcd83263cbcdd212933ceb9d9e3c58e412a31339ac133815dd2d7f2c31ad72683ec7968107a92526b38298fa8f16757253e5d3ac04db4db57bd5ffc6fb4cf405c553c50b1d0ffbf4eb8a1b3aeeb6d71aa52cfb12172f317735e74c4abad18ca7d3d61253c826f553b9d22529e6e74adaa42a5f232c49d2d026b5a94d6a3d09411bd681cbb3efd9a4aec74f317ccc451058a7f097544010401040104010401040104010401000040104010401040104010401040104010401401040104010401040104010401040104010000401048102f82500fbe61b9a5515c7f1e7d916fe99854db1dcb0996150d3d98b305b4485d682a28212224bcb4aa45e6c4420a199eb0ff8a29abd4c2b9944084164112a14196b664198598acdb9cd4a5ca6ceb9ed1958f7f43df377eb72b9cff3cc4da7cdcf077e9e7beff973efcef9dc73cfbd9bfcef7e60f600e400e400e400e400e400e400e400e400e400400e400e400e400e400e400e400e400e400e400e00e400e400e400e400e400e400e400e400e400e400400e400e400e400e400e400e400e400e400e400e400e00e400e400e400e400e400e400e400e400e400e400400e400e400e400e400e400e400e400e1879140da5723a9dce5be668d9ac394a6e52942b4a14dd8a5f158d137edfb59d2138f738e70637be83ad984d0ec93046c99b8a9b15b306d8d45ec53cc97288a11c81727c31b922dd1bb8fa4cca756682e0b0e2aba5479bf79a306395ac552cc8d364a09820493a19d21122c7cfa595753d29b7b2576d655c903a9dba545fa06d455fe0bed6f65d2bbb5a3312c54bf2749ea61f9320ef33acff733934d84d7da95455b7da9120fd62f4981c5e1493e48d678e363f1f79f44c57f24b9ee62b24c89e5c05ae299fba46494de4d06b2ded6d2b22f9577b771563ecd0717f58658e47caacd7fe1379cef3b9cacc53ba4abb2f652ba732692b9fad53e7a8ccb739cef3b0f237261cbf5dc997b1c39fa9ecbdb17289e7dddfd69a1eccf80e6941aa419eada46ab4fe29942897588385ba94225d666150902a4abbf2c547f61d8cd6d3a037abee385b9c66c30f6a3a4747fe6d6f5b7f2836291e522cd7f15275da62a57ec0dfb3e21f2a4629ee531c53de1d2ab32d74dc776a38b059ced368bb3b146fd9f6f58a3b23fb710e283e0dcfa178d6d7577b9374ae2309e7d9a2a45ab131479f84e7f2e7bdc76428507b51294e467eeef3f7b6223e0e37bc1897a90f4e8be153573fb763f773d92a4a901edf6992a441e9c23339a93a659b89314d1dd36a8797e8b89f155a6cdf77d06fda9f12ab9bb1bb301dbfebe282c4ef44e5fb01dc62798ffb41d2b1da2c97b93b965763ed7da4b835a17cb5b5bb44f5d66699996a23d7e6efc98cc9302e52ec588e6b1a3e3934c0a53683147b3f260e6221a9361629597486d56e533445c4083bafc53aee65db9f9250f752c5299559a8fc0d0932f4df89391e0d43259d207b936d9e52bc6d8bf79ce81afb54ef456dbe72417ee788cd02c34d438ebcd9393af52f75aadfbc51119563bcc2cb1d58be67923db606c34c5b13f5af09154b6dfbc184b2558aad8aa7fc3720d5abd575ae19c0393624c8519e2076fabcc9a199c33fcf8b8659123fdbaccb92f77d384d27dca5e1cfbc3326cd09e5f91930fc19c6dbb1c15edfb4d862d9e3d73a1db1ebd969e7bfdbf6b5be4fd52b062247d2e3b85d6d4d3d1b1d5c3044290e29bca5fe07eaf6db871507ca2add8fa533570fb08d065f2f297254fb46718b3ab23cd6d161a7acb0fdf684ba5d3618eb1366955e25c5a11843ecdb4d7e0d63eb980fecd8aed8f5fafebf217ca4d91d3fdaf697e759778db259e3c4b9bafb863a733ca0f8f7d5acdf90ff5e69976dbdb262599f73e5f777ec39982045719eb7955ccfdb2a758eff60d6a6d4df899fd8745da2fd75caf78bd327b5ffae7578f46da5ff0eced176efd9ee64b5b940d7f188368fc4fafc274beb6255fc8cf3aa7f354f7875f7cc55ccb0edcb63754b22e5426a877de6d063e43b25db9d8d72a7c4382131ba949e748144097cdafecec46b5f8f89317d006254e4e9f0027bb5bbc23eaa95d8778e2596efdf56a6da8a7ebe89e1bf6f94445e638713ff982bd4c0cd8f3cdeaef36b275dcfaa68e8d8142bb33a419a1a1363b3cd4c2e61c15d138bf3f785747f59655d8f732b7bed23586fe034228a20e88fbec035665c50fd42e701be905e4c5f48431a27cf484b8cfa8c739d12e17026703b16ffb9ef079b29c6da2bdaa3799ae4772b23518ec82383dfca22c719ff3dc7557e5648f1f71c17871c30b2e1cf040139003900390039003900390039003900390039009003900390039003900390039003900390039003003900390039003900390039003900390039003900900390039003900390039003900390039003900390030039003900390039003900390039003900390039009003900390039003900390032e74fe11a0bdfb8091a28ae3383e97282010b182018da8240a0a886241c58ac492201ab12181c418500362891ec6821db1a1041443acc102446cb1866243049128a2a01c454140548ec476bb778ebfffee5beeb1eedecdec1e57b8ef277979bbd37676f7cd6fdfbc9903febb7200fcb200203c00101e00080f00203c00101e00080f00840700c20300080f00840700c20300e10180f00000c20300e10180f000407800203c0080f000407800203c00101e00080f00203c00101e00080f00840700c20300080f00840700c20300e10180f00000c20300e10180f00040780000e10180f000407800203c00101e00407800203c00101e00080f00840700101e00080f00840700c20300e10100840700c20300e10180f00040780000e1016047d8a5215fbca4a424d6f2bf75ead946d5992a7d548e55e9add2b6885d58a7f2b9ca3c950ff65effd50a9a049aaa300cebf7f8adef172c263c7284497b5547bb30395ea5af4aab3ad8b52a95192a772b50bea55982f06802e1b1a0e311bd2ac36052528190d0be55066190d42e26555786e962cf537510aeac0ac385c9309cadf26e69f9aa9fbd60d94bd570959b55da15b9abd643b95441f2094d148447230a8f8d9d7ab64e04c1ac4410f6cf04859ea7eaeae00882442a308254a0a443c4afb705ca0ad583c794af5a9cd54b395bd534953d8bdced8b142233eaea3338e4c0cebbb95ed3412abbab6c51596da753656bd754c4d8c6092a07abb471db586959ac6d544558ff102d575607ef65bbede8f9f1eebd1562b3b635cddb563755fd23acf78fca972a5f68fd7f8b782ff67dac8db30dadb3bfaa0bf3ccb6eff267f79d6c8ab0ad7d550d8eb3cf2bd7ac9ed0acc24307f5543dbc22959c2ae9d0a80e0a0b0efbd493ae1762f32d2892e9a0d0b4d4e32d0a8ca1c336af7833e2a9cedbee74a7509f2a404e2aa2619eafea99883da28dd6eb51839b97b58d8b543dedc2a2361bac516b1bf3f3eccfb3aa86aa8cd132e30a783fd6c89f57f958eb9fea4d1fabea8e023fa6afb4ad23bd6d0d739f591cd65c06683befc57c3f16789fa97caf72b8d6af8cb89ebdf7b9513b0a2a0fa8dc9a2be0b52d7bef4b62864749b3098fdff73ff2055597e79af7affbe61341b85d9824824c70047f2b30eed2fc07cfddf86d55dcd75688d895a652d7b85b14b0fb131520a36236ca1eaa16aab4cc7c042ad7aabce8ffc269b916ee94cb1ad7732a576b7ee8e6d920b185c0ae6ef15f546c3fa66796f1b63152e5deacd7eba1e5d6e7098f8c715a664c84f77395aac9dea40ffdf0a8613d3f080a59e775ad33b08665ed8761b617ce776af9b111bf231b37fbc89b643da9c3a2044856786c177ede32c7a99a94f5e3355acb3e564378580fa873633b6d69d0ab2dd2c57d391d82acab267664b75240b40a4a3629287e4896942c564fe3c38a3098db75c3d28a625f5807be1dacf7b96261620dcdaee49ca872a87d7fee34a2b5fb95085ca7e837575ac40c8ea354f9a75267a841ccc9b5aca65b464e74c5df86ed9b3feed257cb7e52c3361eb6a2f5ae760dd6c6817eb4eeb5e66fa861774bb58c05eb035aae34c77bb941d5438df5dc5ffbbc58fb38480fdf77932e55191bf3e0df36596595e675719f69b1fb6657f77a6b7b7bb89e8d9d9e4cd0f3b69a776f531a6369d0f0d001dca7b17c10da97adaa66bab2235cef3dbe2d5f70d4e21aeff1adf9822347839dacc679b21e5eec72d97a0cb7e7597c821b3fb14be1376b3d1b707ed27a3f417af0f97e6fd96f54de50b9a531356aedf3e1aa5ef626bd12619db354bde34d3ad98d39580ff000fbf5d73207ebb3fcbb8e02ae5cdb3b470f17b949d7b95e622e076ad928dd8a9266131ecd4c53b9216fab1af6716aacd6137b4bc5c67646b892b1d4f59c366bb9d10db08fe7453c98ec546390f6f3b55a8263809d0a7993fa689d053686a379ffb853cbfd5c0fc40685ffa239377078e85461beebb6b577a708ff6bc881bb72a0738c2fd5679c9708c23907adffba6207ec4bdcd396a5eaad8c88f1128fbaeeb3b95b8d707e01bd8f49de36eed136e6e61b04cd3a3846b85e476638694a845f46fbecfb6addd62e444e73e335fdddbc86b422ab67616ce0f846eff970ede753113e1b1b3b9995d54b39cbf5444cb9ca772a5d5d80d8695f676dfb8f227b47d6dedece6a1ff9441af36856e1e1c63bf29ebae8886da7c068970cc2ce8930e8a723f726bbc2b2b063771b34fdb33208efd4fc47cedcb0ac3e074cf771f5e298ddd4456edc63817bbdd97abed906cbec40c831607aa5caf8207d15233560aaf2a91b70b3d3151b30b5e79bdce9ccab39064cedf4645c507de39c0571cfec01d35af6db7e654f6f64ed7679ae0150bde747dc38828d9f4dd1f323b4dca81a0ee04b54bd9435f9e2dace7055d6b900292f20346ca0f4099563bcc9d76a5b8fd3f38837ce304407b1f522aef0a767aeaad8a5d98afcf77db44984e178f54bc74fefd03575a9f6b25f96d7e7a5da51b19372ed1a1b3d6fa906744190be7260bd2ebb97619aa6e55b6da0fb359ce7b661bffe2dbc4bb51d32e334356ca3c64bb53b0b1b04d6676007f7d7aef73852cfbb6bfa69390ee26141f5d51bfbf1b1a0595ecb815feac67cacd7b0c60da2fe9a67f19e114ead6cd0b934c2bd388d72cca351dc24a603bab542609642a37ff5a5d870dba5dad47d1d41fa726de68ed374fdbf3b4e83aa305ca6e9436ed852b6242b3476e69bc45ab9d3ad426f12b39bafbab9a70bdcf97ed4fdefa5ea14f7749dd69d19611dff86af42d629d33a6fd6b2fc50efbbdeee3534afa37d8fdee233a2f6c6b46e3f0b1af7f40fad37d59bc74d62f51d1ebe251dbbf752504c5210f4f16f4bcf3c4eba1bc4aa8230545da6799fab9ea3faddebb794717b3a9a2dfe302edeb885a573ef803f8c039add4d6271c3a2aeff24ffa7207d05c1c613f8937ca0a9f43c00345dfc4b6200080f00840700c20300e10100840700c20300e10180f00040780000e10180f000407800203c00101e00407800203c00101e00080f00840700101e00080f00840700c20300e10100840700c20300e10180f00040780000e10180f000407800203c00101e00407800203c00101e00080f00203c00101e00080f00840700c20300080f00840700c20300e10180f00000c20300e10180f000407800203c0080f000407800203c00101e009a93ff00335a165622a9bcf20000000049454e44ae426082),
(2, 'User', 'test', 0x89504e470d0a1a0a0000000d494844520000010f0000010f08060000012b2871a80000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000167f4944415478da62fcffff3fc360004c0c83048c3a64d421a30e1975c8a843461d32621cc2006a06206318782bad2f01c40be865370bba24d0728e3bffff7ddff6eb0743eceb9b8c403ed875c24f2f3282686579852f404a06882703f1abbb0f1f14c3f402e5c06a81628c20368846361b26065307048c04438414003218880ba0ec03507a02107f84b2bfa3a90563647b99b085c84529ddff2bc434ff43f9ff61a1020b11201600e20540dc0b0b01747380622087f141438113394406751a611c6db38e3a64d421a30e1975c8a843461d4267001040a3b5efa843461d32ea9051878c3a64d42123d621f84603ea8038825ef662b447eecb18fcbffef737c3dd5fbf38a339b9af02859480f8a7f0d38b1c2079e4511f6c2342c87c6479a81c480f13887de7c17d46a242041b8059844c037103ba03a0e2cbb0e981b131ec45177826adff7fb7a4f6ffe9c2aaecc0a8b90b1d31fa81c7310db81c8cc47f0375dc3fa21d3268d2c8683932ea9051878c3a64d421a30e1975088d0140000d9ada773466460364344046036434404603643440460364344046c168808c06c868808c06c86880d00ab0101c1f6084cca3ac13d7ea7afff7cfbee437b776bc95d60f0409a1299d26fcf462f650f034de210ff4e909740c5bd10b9ab7b928a5fb015d3f504e05a60679e52f08a04d0e8166b94e03b11c946f833e9984ce86f20fe0300f997d008f1cc644153eff129d65d881988d8191d2c86106b907cafecb8058f4dd88a4a6909021c8d3874036689ad11e5b609203088e98c1b2cc5609ade6b77fff9e8b7b7d733d3025040085d60fc72c333a84385acb8c06c868808c06c868808c06c868808c06c868808c06c868808c06c868808c06c8b0070001d83b635f8682388ebf0e1236894ab4080989a12d6d0cb51a241603aba50b62904ec29f50a64a6c06167f810183d8a40bda51554204d1d7362462d2f7fc4e7e2797d3f7fae8a27c2ff9e57ebf7b777df73e77efee75f8dd0f7fff3143000440000440000440000440000440000440000440000440900004400004400004400004400004400004409a3d79762092898f169b20792459efb8cb3d35db4337e40d21801c7685664a5675b0f256dd5caa5cbe1214116ba055ad278328fc7920c59ea86dda96610aef2aab6a101463be9cf7f16cb1dda00cf4f5fb2933499eaf6eaedbb9ec33b204dbaba4a79436b364ef6ace40399234c9b6b4a94e5469b347f69462cbb6312acf922dea9ecbeb5fce1fd4697971312b740fdb27c170406f2f668be26296d1803c68764dd72f9214eb8b2eae6209455f71fa5db6b39c1f884161209e9eb9ee1a52ef55a0eb6db5ca456768747480738abea1e8e354ff8cf216b77b891021ac2649d6b82ce3746a25d9930c2ba641f3fd789791a37f4b721a8cf8bdce10eeccbd567d4bd1934add3865479447dcfa22429570b89292521c77f2b5a3f27dcafcf21595d2d02e235285a65291d691b265993b9d4346c2bc705a43c6b4a623dcd98f35448d3a53633497bfb12efaf9810bfa59a56ccbfb8e925d26bdd7eb0cf1b4cb1c07c2d3b4cb8468414d2f94f32fff7a97c177083edd910004400004400004400004400004400004400004400004400004094000044000044000044000044000e497a77701d83b7fd02882280e1f44240882629713542c6cc4d35610d436a0a6b150fc93345a0a41508b1049216813abb4079a4ebb58aba00882a82069d428c241026a14ccdd05c98ebf97bc9361dd4de46e23987c1f3c263b33f772b7fbedcd5c02f7f8673770c700820082008200820082008200820020082008200820082008200820082008200800820082008200820082008200820082008200200820082008ac361b3a4d90feee7fe34bb972424dbfe28862f35fa61ada567b3dc225591ddafd16878ebffec10479dbb3afab5e0af33f42b0b6d44842a9aebccd90e8e7c508cd240c5cfb3e55953c566a687685b43f25cb462eeb1a10e4ebf6fdbf13cc59289f496282783ce99b993c94f558c932a1a67799f48725cae3ac81dd3b769e5233ee87f7fdddf0b81d44f5ad5acfcd0afbd8ef3aa930411b9ab329ca65f3aec6b5b0a2b1736aaa51ced168d88a02d514f7fcb8a679b7bc3c94d5cb8aab28ed521c537cd39cad39afc99e47bfc6ab39639ffd355bfd9cd33e7447f3cffa9c56adaddbe9c7bffbf8e152db667512d1c5dea2e8fe1777834ec4505e95a5f8842a1ee68c4da76b7f2916bc1df3be2b71ff32bfe35146fff9acc7a86f70855c2fbdbd9833fe2aa7ff794b90bcfced5edf4237a9badb9bfff1e67ac4df25f6f849eef3e3c10e440e71a8eb42baf296fa5b55b9263476406d8f62cc045d139bd4b84cd94cb9b2b8bcd83263cbcdd212933ceb9d9e3c58e412a31339ac133815dd2d7f2c31ad72683ec7968107a92526b38298fa8f16757253e5d3ac04db4db57bd5ffc6fb4cf405c553c50b1d0ffbf4eb8a1b3aeeb6d71aa52cfb12172f317735e74c4abad18ca7d3d61253c826f553b9d22529e6e74adaa42a5f232c49d2d026b5a94d6a3d09411bd681cbb3efd9a4aec74f317ccc451058a7f097544010401040104010401040104010401000040104010401040104010401040104010401401040104010401040104010401040104010000401048102f82500fbe61b9a5515c7f1e7d916fe99854db1dcb0996150d3d98b305b4485d682a28212224bcb4aa45e6c4420a199eb0ff8a29abd4c2b9944084164112a14196b664198598acdb9cd4a5ca6ceb9ed1958f7f43df377eb72b9cff3cc4da7cdcf077e9e7beff973efcef9dc73cfbd9bfcef7e60f600e400e400e400e400e400e400e400e400e400400e400e400e400e400e400e400e400e400e400e00e400e400e400e400e400e400e400e400e400e400400e400e400e400e400e400e400e400e400e400e400e00e400e400e400e400e400e400e400e400e400e400400e400e400e400e400e400e400e400e1879140da5723a9dce5be668d9ac394a6e52942b4a14dd8a5f158d137edfb59d2138f738e70637be83ad984d0ec93046c99b8a9b15b306d8d45ec53cc97288a11c81727c31b922dd1bb8fa4cca756682e0b0e2aba5479bf79a306395ac552cc8d364a09820493a19d21122c7cfa595753d29b7b2576d655c903a9dba545fa06d455fe0bed6f65d2bbb5a3312c54bf2749ea61f9320ef33acff733934d84d7da95455b7da9120fd62f4981c5e1493e48d678e363f1f79f44c57f24b9ee62b24c89e5c05ae299fba46494de4d06b2ded6d2b22f9577b771563ecd0717f58658e47caacd7fe1379cef3b9cacc53ba4abb2f652ba732692b9fad53e7a8ccb739cef3b0f237261cbf5dc997b1c39fa9ecbdb17289e7dddfd69a1eccf80e6941aa419eada46ab4fe29942897588385ba94225d666150902a4abbf2c547f61d8cd6d3a037abee385b9c66c30f6a3a4747fe6d6f5b7f2836291e522cd7f15275da62a57ec0dfb3e21f2a4629ee531c53de1d2ab32d74dc776a38b059ced368bb3b146fd9f6f58a3b23fb710e283e0dcfa178d6d7577b9374ae2309e7d9a2a45ab131479f84e7f2e7bdc76428507b51294e467eeef3f7b6223e0e37bc1897a90f4e8be153573fb763f773d92a4a901edf6992a441e9c23339a93a659b89314d1dd36a8797e8b89f155a6cdf77d06fda9f12ab9bb1bb301dbfebe282c4ef44e5fb01dc62798ffb41d2b1da2c97b93b965763ed7da4b835a17cb5b5bb44f5d66699996a23d7e6efc98cc9302e52ec588e6b1a3e3934c0a53683147b3f260e6221a9361629597486d56e533445c4083bafc53aee65db9f9250f752c5299559a8fc0d0932f4df89391e0d43259d207b936d9e52bc6d8bf79ce81afb54ef456dbe72417ee788cd02c34d438ebcd9393af52f75aadfbc51119563bcc2cb1d58be67923db606c34c5b13f5af09154b6dfbc184b2558aad8aa7fc3720d5abd575ae19c0393624c8519e2076fabcc9a199c33fcf8b8659123fdbaccb92f77d384d27dca5e1cfbc3326cd09e5f91930fc19c6dbb1c15edfb4d862d9e3d73a1db1ebd969e7bfdbf6b5be4fd52b062247d2e3b85d6d4d3d1b1d5c3044290e29bca5fe07eaf6db871507ca2add8fa533570fb08d065f2f297254fb46718b3ab23cd6d161a7acb0fdf684ba5d3618eb1366955e25c5a11843ecdb4d7e0d63eb980fecd8aed8f5fafebf217ca4d91d3fdaf697e759778db259e3c4b9bafb863a733ca0f8f7d5acdf90ff5e69976dbdb262599f73e5f777ec39982045719eb7955ccfdb2a758eff60d6a6d4df899fd8745da2fd75caf78bd327b5ffae7578f46da5ff0eced176efd9ee64b5b940d7f188368fc4fafc274beb6255fc8cf3aa7f354f7875f7cc55ccb0edcb63754b22e5426a877de6d063e43b25db9d8d72a7c4382131ba949e748144097cdafecec46b5f8f89317d006254e4e9f0027bb5bbc23eaa95d8778e2596efdf56a6da8a7ebe89e1bf6f94445e638713ff982bd4c0cd8f3cdeaef36b275dcfaa68e8d8142bb33a419a1a1363b3cd4c2e61c15d138bf3f785747f59655d8f732b7bed23586fe034228a20e88fbec035665c50fd42e701be905e4c5f48431a27cf484b8cfa8c739d12e17026703b16ffb9ef079b29c6da2bdaa3799ae4772b23518ec82383dfca22c719ff3dc7557e5648f1f71c17871c30b2e1cf040139003900390039003900390039003900390039009003900390039003900390039003900390039003003900390039003900390039003900390039003900900390039003900390039003900390039003900390030039003900390039003900390039003900390039009003900390039003900390032e74fe11a0bdfb8091a28ae3383e97282010b182018da8240a0a886241c58ac492201ab12181c418500362891ec6821db1a1041443acc102446cb1866243049128a2a01c454140548ec476bb778ebfffee5beeb1eedecdec1e57b8ef277979bbd37676f7cd6fdfbc9903febb7200fcb200203c00101e00080f00203c00101e00080f00840700c20300080f00840700c20300e10180f00000c20300e10180f000407800203c0080f000407800203c00101e00080f00203c00101e00080f00840700c20300080f00840700c20300e10180f00000c20300e10180f00040780000e10180f000407800203c00101e00407800203c00101e00080f00840700101e00080f00840700c20300e10100840700c20300e10180f00040780000e1016047d8a5215fbca4a424d6f2bf75ead946d5992a7d548e55e9add2b6885d58a7f2b9ca3c950ff65effd50a9a049aaa300cebf7f8adef172c263c7284497b5547bb30395ea5af4aab3ad8b52a95192a772b50bea55982f06802e1b1a0e311bd2ac36052528190d0be55066190d42e26555786e962cf537510aeac0ac385c9309cadf26e69f9aa9fbd60d94bd570959b55da15b9abd643b95441f2094d148447230a8f8d9d7ab64e04c1ac4410f6cf04859ea7eaeae00882442a308254a0a443c4afb705ca0ad583c794af5a9cd54b395bd534953d8bdced8b142233eaea3338e4c0cebbb95ed3412abbab6c51596da753656bd754c4d8c6092a07abb471db586959ac6d544558ff102d575607ef65bbede8f9f1eebd1562b3b635cddb563755fd23acf78fca972a5f68fd7f8b782ff67dac8db30dadb3bfaa0bf3ccb6eff267f79d6c8ab0ad7d550d8eb3cf2bd7ac9ed0acc24307f5543dbc22959c2ae9d0a80e0a0b0efbd493ae1762f32d2892e9a0d0b4d4e32d0a8ca1c336af7833e2a9cedbee74a7509f2a404e2aa2619eafea99883da28dd6eb51839b97b58d8b543dedc2a2361bac516b1bf3f3eccfb3aa86aa8cd132e30a783fd6c89f57f958eb9fea4d1fabea8e023fa6afb4ad23bd6d0d739f591cd65c06683befc57c3f16789fa97caf72b8d6af8cb89ebdf7b9513b0a2a0fa8dc9a2be0b52d7bef4b62864749b3098fdff73ff2055597e79af7affbe61341b85d9824824c70047f2b30eed2fc07cfddf86d55dcd75688d895a652d7b85b14b0fb131520a36236ca1eaa16aab4cc7c042ad7aabce8ffc269b916ee94cb1ad7732a576b7ee8e6d920b185c0ae6ef15f546c3fa66796f1b63152e5deacd7eba1e5d6e7098f8c715a664c84f77395aac9dea40ffdf0a8613d3f080a59e775ad33b08665ed8761b617ce776af9b111bf231b37fbc89b643da9c3a2044856786c177ede32c7a99a94f5e3355acb3e564378580fa873633b6d69d0ab2dd2c57d391d82acab267664b75240b40a4a3629287e4896942c564fe3c38a3098db75c3d28a625f5807be1dacf7b96261620dcdaee49ca872a87d7fee34a2b5fb95085ca7e837575ac40c8ea354f9a75267a841ccc9b5aca65b464e74c5df86ed9b3feed257cb7e52c3361eb6a2f5ae760dd6c6817eb4eeb5e66fa861774bb58c05eb035aae34c77bb941d5438df5dc5ffbbc58fb38480fdf77932e55191bf3e0df36596595e675719f69b1fb6657f77a6b7b7bb89e8d9d9e4cd0f3b69a776f531a6369d0f0d001dca7b17c10da97adaa66bab2235cef3dbe2d5f70d4e21aeff1adf9822347839dacc679b21e5eec72d97a0cb7e7597c821b3fb14be1376b3d1b707ed27a3f417af0f97e6fd96f54de50b9a531356aedf3e1aa5ef626bd12619db354bde34d3ad98d39580ff000fbf5d73207ebb3fcbb8e02ae5cdb3b470f17b949d7b95e622e076ad928dd8a9266131ecd4c53b9216fab1af6716aacd6137b4bc5c67646b892b1d4f59c366bb9d10db08fe7453c98ec546390f6f3b55a8263809d0a7993fa689d053686a379ffb853cbfd5c0fc40685ffa239377078e85461beebb6b577a708ff6bc881bb72a0738c2fd5679c9708c23907adffba6207ec4bdcd396a5eaad8c88f1128fbaeeb3b95b8d707e01bd8f49de36eed136e6e61b04cd3a3846b85e476638694a845f46fbecfb6addd62e444e73e335fdddbc86b422ab67616ce0f846eff970ede753113e1b1b3b9995d54b39cbf5444cb9ca772a5d5d80d8695f676dfb8f227b47d6dedece6a1ff9441af36856e1e1c63bf29ebae8886da7c068970cc2ce8930e8a723f726bbc2b2b063771b34fdb33208efd4fc47cedcb0ac3e074cf771f5e298ddd4456edc63817bbdd97abed906cbec40c831607aa5caf8207d15233560aaf2a91b70b3d3151b30b5e79bdce9ccab39064cedf4645c507de39c0571cfec01d35af6db7e654f6f64ed7679ae0150bde747dc38828d9f4dd1f323b4dca81a0ee04b54bd9435f9e2dace7055d6b900292f20346ca0f4099563bcc9d76a5b8fd3f38837ce304407b1f522aef0a767aeaad8a5d98afcf77db44984e178f54bc74fefd03575a9f6b25f96d7e7a5da51b19372ed1a1b3d6fa906744190be7260bd2ebb97619aa6e55b6da0fb359ce7b661bffe2dbc4bb51d32e334356ca3c64bb53b0b1b04d6676007f7d7aef73852cfbb6bfa69390ee26141f5d51bfbf1b1a0595ecb815feac67cacd7b0c60da2fe9a67f19e114ead6cd0b934c2bd388d72cca351dc24a603bab542609642a37ff5a5d870dba5dad47d1d41fa726de68ed374fdbf3b4e83aa305ca6e9436ed852b6242b3476e69bc45ab9d3ad426f12b39bafbab9a70bdcf97ed4fdefa5ea14f7749dd69d19611dff86af42d629d33a6fd6b2fc50efbbdeee3534afa37d8fdee233a2f6c6b46e3f0b1af7f40fad37d59bc74d62f51d1ebe251dbbf752504c5210f4f16f4bcf3c4eba1bc4aa8230545da6799fab9ea3faddebb794717b3a9a2dfe302edeb885a573ef803f8c039add4d6271c3a2aeff24ffa7207d05c1c613f8937ca0a9f43c00345dfc4b6200080f00840700c20300e10100840700c20300e10180f00040780000e10180f000407800203c00101e00407800203c00101e00080f00840700101e00080f00840700c20300e10100840700c20300e10180f00040780000e10180f000407800203c00101e00407800203c00101e00080f00203c00101e00080f00840700c20300080f00840700c20300e10180f00000c20300e10180f000407800203c0080f000407800203c00101e009a93ff00335a165622a9bcf20000000049454e44ae426082);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;