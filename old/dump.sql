/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: actdata
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `actdata` (
  `actkey` varchar(6) NOT NULL,
  `acttype` text NOT NULL,
  `actname` text NOT NULL,
  `allow` int(1) NOT NULL,
  PRIMARY KEY (`actkey`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: logindata
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `logindata` (
  `loginkey` varchar(8) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `passwordmd5` text NOT NULL,
  `off` text NOT NULL,
  `address` text NOT NULL,
  `startup_xy` text NOT NULL,
  `times` int(6) NOT NULL,
  `logintime` text NOT NULL,
  `tutorial` text NOT NULL,
  `allow` int(1) NOT NULL,
  PRIMARY KEY (`loginkey`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: main_db
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `main_db` (
  `keyname` varchar(8) NOT NULL,
  `orderx` int(11) NOT NULL,
  `type` text NOT NULL,
  `name` text NOT NULL,
  `url_xyz` text NOT NULL,
  `color` text NOT NULL,
  `allow` text NOT NULL,
  `overlap_chk` int(1) NOT NULL,
  `checkme` int(1) NOT NULL,
  PRIMARY KEY (`keyname`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: taskdata
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `taskdata` (
  `idkey` varchar(8) NOT NULL,
  `offkey` varchar(8) NOT NULL,
  `type` text NOT NULL,
  `offname` text NOT NULL,
  `actkey` varchar(6) NOT NULL,
  `actname` text NOT NULL,
  `year` int(4) NOT NULL,
  `amount` double NOT NULL,
  `date` text NOT NULL,
  `note` text NOT NULL,
  `jsondata` text NOT NULL,
  `publickey` varchar(8) NOT NULL,
  `overlap_data` longtext NOT NULL,
  PRIMARY KEY (`idkey`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: actdata
# ------------------------------------------------------------

INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('aiaEmb', 'point', 'จุดก่อสร้างฝาย', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('bnyPJG', 'polygon', 'แปลงปลูกป่าแนวกันชน', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('CYxblv', 'polygon', 'อาคารและสิ่งปลูกสร้าง', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('eHfDbU', 'polygon', 'แปลงปลูกป่าหวาย', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('eijGao', 'line', 'แนวกันไฟ', 0);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  (
    'FQdKnl',
    'line',
    'แนวกันไฟ กิจกรรมฟื้นฟูพื้นที่ป่าอนุรักษ์ที่เสื่อมสภาพ',
    1
  );
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('HaeVkK', 'point', 'จุดทำระบบป่าเปียก', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  (
    'KmPRVo',
    'line',
    'แนวกันไฟ กิจกรรมจัดการพื้นที่ต้นน้ำในพื้นที่ลุ่มน้ำวิกฤติ',
    1
  );
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  (
    'kUltab',
    'polygon',
    'ข้อมูลจากการสำรวจเบื้องต้น',
    1
  );
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('laEYGB', 'line', 'เส้นทาง', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  (
    'lZYLpQ',
    'polygon',
    'แปลงปลูกป่า 3 อย่าง ประโยชน์ 4 อย่าง',
    1
  );
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  (
    'MovorF',
    'polygon',
    'แปลงปลูกป่าเลียนแบบธรรมชาติ',
    1
  );
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('psrgEf', 'polygon', 'แปลงปลูกป่าทั่วไป', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('QautdO', 'point', 'จุดเพาะชำกล้าไม้', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('Rxohgj', 'polygon', 'แปลงปลูกฟื้นฟูโครงสร้างฯ', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('SZIDlT', 'line', 'ข้อมูลจากการสำรวจเบื้องต้น', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('Uafeka', 'point', 'ตำแหน่งหมู่บ้านโครงการ สสอ.', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('VnWIyX', 'point', 'ข้อมูลจากการสำรวจเบื้องต้น', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('ySGave', 'polygon', 'แปลงปลูกไม้ใช้สอย', 1);
INSERT INTO
  `actdata` (`actkey`, `acttype`, `actname`, `allow`)
VALUES
  ('Zmuxyd', 'line', 'แนวกันไฟ กิจกรรมควบคุมไฟป่า', 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: logindata
# ------------------------------------------------------------

INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '00',
    'gisnan',
    'gisnan054775686',
    '52553499299caaeb944a443a2425ffdd',
    'ศูนย์ภูมิสารสนเทศฯ',
    '-',
    '',
    2,
    '18-05-2022 05:26',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    1
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '0LbCceiU',
    'gis22',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำหุย',
    'ตำบลผาทอง  อำเภอท่าวังผา  จังหวัดน่าน',
    '19.25580489, 100.7342517',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '148x0AfE',
    'gis04',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำปาด',
    'ตำบลห้วยโก๋น อำเภอเฉลิมพระเกียรติ จังหวัดน่าน',
    '19.55088608, 101.054305',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '2kZbLlYv',
    'gis13',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำกอน สาขาที่ 4',
    'ตำบลปอน อำเภอทุ่งช้าง จังหวัดน่าน',
    '19.52376498, 100.9361237',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '36cDHpiU',
    'gis11',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำกอนฝั่งขวา',
    'ตำบลเชียงกลาง อำเภอเชียงกลาง จังหวัดน่าน',
    '19.29784305, 100.9130619',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '3btcfRed',
    'gis32',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำมาง',
    'ตำบลบ่อเกลือใต้   อำเภอบ่อเกลือ  จังหวัดน่าน',
    '19.13887895, 101.1517409',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '3DZecXFB',
    'gis52',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำแม่ก๋อน- แม่สาย',
    'ตำบลช่อแฮ  อำเภอเมืองแพร่  จังหวัดแพร่',
    '17.9964641, 100.2647663',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '4qwJfuUL',
    'gis17',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำย่าง',
    'ตำบลศิลาเพชร อำเภอปัว จังหวัดน่าน',
    '19.09047527, 100.9461473',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '7JrEOfAT',
    'gis37',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำขุนสมุน',
    'ตำบลสะเนียน อำเภอเมือง จังหวัดน่าน',
    '18.93481995, 100.588505',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '999999',
    'gisadmin',
    'gisnan054775686',
    '52553499299caaeb944a443a2425ffdd',
    'Admin',
    '-',
    '',
    2,
    '18-05-2022 05:32',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    1
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    '9qJ8RNKZ',
    'gis07',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำงอบ',
    'ตำบลงอบ อำเภอทุ่งช้าง จังหวัดน่าน',
    '19.50702285, 100.9092795',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'aiMoRDdT',
    'gis09',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ',
    'ตำบลทุ่งช้าง อำเภอทุ่งช้าง จังหวัดน่าน',
    '19.40043159, 100.830985',
    0,
    '17-05-2022 09:07',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'bHQUKp6I',
    'gis21',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำห้วยยอด',
    'ตำนาไร่หลวง  อำเภอสองแคว  จังหวัดน่าน',
    '19.35772989, 100.6474617',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'Bmi5OYo3',
    'gis28',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำฟ้า',
    'ตำบลน้ำพาง อำเภอแม่จริม จังหวัดน่าน',
    '18.72220609, 101.1716465',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'btoxZX5T',
    'gis20',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำแหน',
    'ตำบลผาทอง  อำเภอท่าวังผา  จังหวัดน่าน',
    '19.18433798, 100.7520336',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'dTLkMxb8',
    'gis27',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำแก่น-น้ำสา',
    'ตำบลน้ำแก่น อำเภอภูเพียง จังหวัดน่าน',
    '18.71800954, 100.8807096',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'E0pHlIVD',
    'gis06',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำลาด',
    'ตำบลพญาแก้ว อำเภอเชียงกลาง จังหวัดน่าน',
    '19.27451112, 100.9471315',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'fpAgiao5',
    'gis42',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำสะเนียน-ไสล',
    'ตำบลสะเนียน อำเภอเมือง จังหวัดน่าน',
    '18.85226322, 100.5921106',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'GPZzIDkr',
    'gis33',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำหลักลาย',
    'ตำบลอวน อำเภอปัว จังหวัดน่าน',
    '19.00184472, 101.0654941',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'gXbelEvo',
    'gis19',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำสบสาย',
    'ตำบลศรีภูมิ  อำเภอท่าวังผา  จังหวัดน่าน',
    '19.11233708, 100.7056915',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'H2JK9Uwy',
    'gis31',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำขุนน้ำตวง',
    'ตำบลภูฟ้า  อำเภอบ่อเกลือ  จังหวัดน่าน',
    '18.9908187, 101.1885524',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'hL6spkoC',
    'gis05',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำขุนน่าน',
    'ตำบลบ่อเกลือเหนือ อำเภอบ่อเกลือ จังหวัดน่าน',
    '19.34778575, 101.175658',
    0,
    '04-04-2022 08:10',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'I5ucBSWh',
    'gis39',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำแม่สาคร',
    'ตำบลแม่สาคร อำเภอเวียงสา จังหวัดน่าน',
    '18.45679803, 100.5761748',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'i7CefEdk',
    'gis38',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำแม่ขะนิง',
    'ตำบลแม่ขะนิง อำเภอเวียงสา จังหวัดน่าน',
    '18.75272161, 100.5416563',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'ig3ZpXoG',
    'gis18',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำมีด',
    'ตำบลเปือ อำเภอเชียงกลาง จังหวัดน่าน',
    '19.33578018, 100.8253048',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'IqHL0Ov4',
    'gis02',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำเลียบ',
    'ตำบลทุ่งช้าง อำเภอทุ่งช้าง จังหวัดน่าน',
    '19.40, 100.92',
    0,
    '12-04-2022 11:59',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'j8daMy1e',
    'gis23',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำยาว',
    'ตำนาไร่หลวง  อำเภอสองแคว  จังหวัดน่าน',
    '19.40184636, 100.6983197',
    0,
    '04-04-2022 10:52',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'jivYeQ3V',
    'gis48',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำกาด',
    'ตำบลศรีษะเกษ  อำเภอนาน้อย จังหวัดน่าน',
    '18.37244074, 100.8260792',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'JzoGpby4',
    'gis41',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำแม่ถา',
    'ตำบลยาบหัวนา อำเภอเวียงสา จังหวัดน่าน',
    '18.51647921, 100.4026991',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'LFcWuUiQ',
    'gis45',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำขุนสมุน สาขาที่ 2',
    'ตำบลสะเนียน อำเภอเมือง จังหวัดน่าน',
    '18.88677382, 100.6707243',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'lFVjZRW7',
    'gis29',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำขุนว้า',
    'ตำบลดงพญา อำเภอบ่อเกลือ จังหวัดน่าน',
    '19.23655084, 101.1834501',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'mjMF0851',
    'gis54',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำแม่มาน',
    'ตำบลบ้านเหล่า  อำเภอสูงเม่น  จังหวัดแพร่',
    '18.01420296, 100.1877916',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'nhXUdSG8',
    'gis10',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำเปือ',
    'ตำบลพระธาตุ อำเภอเชียงกลาง จังหวัดน่าน',
    '19.33587502, 100.9103547',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'nT7OQ9up',
    'gis35',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำห้วยสาลี่',
    'ตำบลน้ำมวบ อำเภอเวียงสา  จังหวัดน่าน',
    '18.39374907, 100.983412',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'nW0FcPVy',
    'gis26',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำงาว',
    'ตำบลบ่อ อำเภอเมืองน่าน จังหวัดน่าน',
    '18.98138707, 100.7178962',
    0,
    '14-05-2022 06:00',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'nY95vc7u',
    'gis43',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำสมุนตอนล่าง',
    'ตำบลเรือง อำเภอเมือง จังหวัดน่าน',
    '18.84051862, 100.6285808',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'O23m6IaN',
    'gis24',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำขุนน้ำพริก',
    'ตำบลชนแดน  อำเภอสองแคว  จังหวัดน่าน',
    '19.45629726, 100.6600555',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'o356vIgN',
    'gis46',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำหิน',
    'ตำบลนาทะนุง อำเภอนาหมื่น จังหวัดน่าน',
    '18.1781831, 100.5754218',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'O8eLaufH',
    'gis25',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำพงษ์',
    'ตำบลพงษ์ อำเภอสันติสุข จังหวัดน่าน',
    '18.90989955, 100.9654047',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'OioZvVtl',
    'gis50',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำเมืองลี',
    'ตำบลปิงหลวง อำเภอนาหมื่น จังหวัดน่าน',
    '18.18951095, 100.4757214',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'OPp3S8ts',
    'gis44',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำขุนสมุน สาขาที่ 1',
    'ตำบลสะเนียน อำเภอเมือง จังหวัดน่าน',
    '18.94793005, 100.6525509',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'pac7NHjz',
    'gis01',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำและ',
    'ตำบลและ อำเภอทุ่งช้าง จังหวัดน่าน',
    '19.43, 100.92',
    0,
    '11-04-2022 10:16',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'pMSR1iFc',
    'gis55',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยอนุรักษ์และจัดการต้นน้ำห้วยสามสบ',
    'ตำบลศรีษะเกษ  อำเภอนาน้อย จังหวัดน่าน',
    '18, 100',
    0,
    '13-05-2022 06:29',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'SbPCHjg9',
    'gis36',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำมวบ',
    'ตำบลน้ำมวบ  อำเภอเวียงสา  จังหวัดน่าน',
    '18.49240344, 100.9560641',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'SKnlLMFJ',
    'gis16',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำปัว',
    'ตำบลปัว อำเภอปัว จังหวัดน่าน',
    '19.22215318, 100.9649623',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'uJhegTIB',
    'gis53',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำแม่พวก',
    'ตำบลห้วยไร่  อำเภอเด่นชัย  จังหวัดแพร่',
    '17.90854324, 100.110954',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'v8wOMfP9',
    'gis15',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำขว้าง',
    'ตำบลภูคา อำเภอปัว จังหวัดน่าน',
    '19.18490503, 101.0712275',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'vM8QmRqS',
    'gis40',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำสา',
    'ตำบลยาบหัวนา อำเภอเวียงสา จังหวัดน่าน',
    '18.66047836, 100.4903238',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'W7KYape2',
    'gis12',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำกอนฝั่งซ้าย',
    'ตำบลพญาแก้ว อำเภอเชียงกลาง จังหวัดน่าน',
    '19.31077295, 101.0118598',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'wfQhRMHG',
    'gis49',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำขุนสถาน',
    'ตำบลสันทะ อำเภอนาน้อย จังหวัดน่าน',
    '18.2730165, 100.5360411',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'x2NVEwSo',
    'gis03',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำห้วยสะแตง',
    'ตำบลงอบ อำเภอทุ่งช้าง จังหวัดน่าน',
    '19.54010577, 100.8561093',
    0,
    '07-04-2022 04:53',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'XMuDN8mG',
    'gis30',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำหมาวหมอก',
    'ตำบลบ่อเกลือใต้ อำเภอบ่อเกลือ จังหวัดน่าน',
    '19.06165277, 101.1022188',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'xyVpGkKd',
    'gis08',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำสอด',
    'ตำบลและ อำเภอทุ่งช้าง จังหวัดน่าน',
    '19.44025594, 100.8457438',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'Y7gNkUuL',
    'gis34',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำแม่จริม',
    'ตำบลแม่จริม อำเภอแม่จริม จังหวัดน่าน',
    '18.82128953, 100.9993491',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'YXNOEizj',
    'gis47',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำห้วยนาย',
    'ตำบลนาทะนุง อำเภอนาหมื่น จังหวัดน่าน',
    '18.15973122, 100.5777421',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'zNDZrPiK',
    'gis14',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำกอน สาขาที่ 5',
    'ตำบลเมืองลี อำเภอนาหมื่น จังหวัดน่าน',
    '18.1929977, 100.4699838',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );
INSERT INTO
  `logindata` (
    `loginkey`,
    `username`,
    `password`,
    `passwordmd5`,
    `off`,
    `address`,
    `startup_xy`,
    `times`,
    `logintime`,
    `tutorial`,
    `allow`
  )
VALUES
  (
    'ZTw6gkuU',
    'gis51',
    '1234',
    '81dc9bdb52d04dc20036dbd8313ed055',
    'หน่วยจัดการต้นน้ำน้ำเคิม',
    'ตำบลปิงหลวง อำเภอนาหมื่น จังหวัดน่าน',
    '18.11215007, 100.4523457',
    0,
    '',
    '{\"tutorial\": [\"0\",\"0\",\"0\"]}',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: main_db
# ------------------------------------------------------------

INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'A117264c',
    0,
    'raster',
    'OpenStreetMap',
    'http://tile.openstreetmap.org/{z}/{x}/{y}.png',
    '',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'AAAAAAAA',
    1,
    'polygon',
    'ทดสอบทดสอบ',
    '',
    '#b695ff',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'AkpcDfQg',
    1,
    'line',
    'แนวกันไฟ ส่วนจัดการต้นน้ำ 2566',
    '',
    '#eba897',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'ancQzHPB',
    1,
    'polygon',
    'ข้อมูลลุ่มน้ำ',
    '',
    '#26bd91',
    '1',
    0,
    1
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'cDAbad5A',
    0,
    'raster',
    'Esri Imagery/Satellite',
    'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
    '',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'FaSjmEfc',
    1,
    'polygon',
    'ข้อมูลหมู่บ้านใกล้เคียง ?',
    '',
    '#ff3d67',
    '0',
    0,
    1
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'fCPBwqWx',
    1,
    'polygon',
    'โครงการจัดที่ดินทำกินให้ชุมชนฯ (คทช.59-64) ?',
    '',
    '#ff9e7b',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'FOREST01',
    2,
    'polygon',
    'แนวเขตอุทยานแห่งชาติ',
    '',
    '#339933',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'GEOL2550',
    1,
    'polygon',
    'ข้อมูลทางธรณีวิทยา',
    '',
    '#575757',
    '0',
    0,
    1
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'HbaFrSek',
    1,
    'polygon',
    'ข้อมูลชั้นคุณภาพลุ่มน้ำ',
    '',
    '#005ee5',
    '0',
    0,
    1
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'jaaEvad5',
    2,
    'point',
    'ตำแหน่งหมู่บ้าน',
    '',
    '#ff9000',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'KBOFCoPA',
    1,
    'polygon',
    'แปลงปลูกป่าส่วนฟื้นฟู (สวนป่าโครงการ)',
    '',
    '#4fabcb',
    '1',
    1,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'kPJZyUnS',
    0,
    'raster',
    'Google Earth',
    'https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}',
    '',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'L7018000',
    1,
    'raster',
    'แผนที่ภูมิประเทศ L7018',
    'http://gisnan.ddnsthailand.com:8080/tile_service/l7018_tile/{z}/{x}/{y}.png',
    '',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'LDD45000',
    0,
    'raster',
    'กรมพัฒนาที่ดิน 2545',
    'http://gisnan.ddnsthailand.com:8080/tile_service/LDD45_tile/{z}/{x}/{y}.jpg',
    '',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'LU590000',
    1,
    'polygon',
    'ข้อมูลการใช้ประโยชน์ที่ดิน',
    '',
    '#ffb100',
    '0',
    0,
    1
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'M6400001',
    4,
    'polygon',
    'ข้อมูลพื้นที่ทำกิน ตาม ม.64',
    '',
    '#ffe100',
    '1',
    1,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'nKJorIfR',
    1,
    'polygon',
    'แปลงปลูกป่าส่วนฯ ราชดำริ',
    '',
    '#b37aff',
    '1',
    1,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'PLOT0001',
    1,
    'polygon',
    'แปลงปลูกป่าส่วนจัดการต้นน้ำ',
    '',
    '#86d419',
    '1',
    1,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'PROVINCE',
    3,
    'polygon',
    'เขตการปกครอง (ระดับตำบล)',
    '',
    '#222222',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'SZFksAmI',
    1,
    'polygon',
    'แปลงปลูกป่าส่วนฟื้นฟู FPT',
    '',
    '#f024df',
    '1',
    1,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'vFJInHhf',
    1,
    'polygon',
    'ข้อมูลพื้นที่ป่าไม้',
    '',
    '#308f31',
    '0',
    0,
    1
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'WIPqigsb',
    1,
    'line',
    'เส้นทางน้ำ/ชื่อลำห้วย',
    '',
    '#34ceee',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'XzAYKGsT',
    0,
    'raster',
    'ไทยโซต 2562 (THEOS, 2019)',
    'http://gisnan.ddnsthailand.com:8080/tile_service/THEOS62/{z}/{x}/{y}.jpg',
    '',
    '1',
    0,
    0
  );
INSERT INTO
  `main_db` (
    `keyname`,
    `orderx`,
    `type`,
    `name`,
    `url_xyz`,
    `color`,
    `allow`,
    `overlap_chk`,
    `checkme`
  )
VALUES
  (
    'znKtPeWS',
    1,
    'point',
    'ที่ตั้งหน่วยงานภายใน สบอ.13',
    '',
    '#a4001d',
    '1',
    0,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: taskdata
# ------------------------------------------------------------

INSERT INTO
  `taskdata` (
    `idkey`,
    `offkey`,
    `type`,
    `offname`,
    `actkey`,
    `actname`,
    `year`,
    `amount`,
    `date`,
    `note`,
    `jsondata`,
    `publickey`,
    `overlap_data`
  )
VALUES
  (
    'JnVNBxMX',
    'nW0FcPVy',
    'line',
    'หน่วยจัดการต้นน้ำน้ำงาว',
    'Zmuxyd',
    'แนวกันไฟ กิจกรรมควบคุมไฟป่า',
    2565,
    50,
    '18-05-2022 04:28',
    '',
    '{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"properties\":{\"OBJECTID_1\":734,\"km\":18.02976269194,\"OFF_NT\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"TYPE\":\"ควบคุมไฟป่า\",\"L_KM\":60,\"CENTER\":null,\"DESC\":\"หน่วยจัดการต้นน้ำน้ำงาว | ควบคุมไฟป่า | 60\",\"id\":0,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แนวกันไฟ กิจกรรมควบคุมไฟป่า\",\"year\":\"2565\",\"amount\":18,\"amount_pln\":\"50\",\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แนวกันไฟ กิจกรรมควบคุมไฟป่า_2565_50\"},\"geometry\":{\"type\":\"MultiLineString\",\"coordinates\":[[[100.63369,19.040232,0],[100.635216,19.035743,0]],[[100.647245,19.05026,0],[100.646421,19.046579,0],[100.6453,19.045259,0],[100.645166,19.043121,0],[100.644444,19.042126,0],[100.644958,19.040734,0]],[[100.642095,19.060171,0],[100.639829,19.057553,0],[100.639034,19.05615,0],[100.638606,19.053777,0],[100.637862,19.051008,0],[100.637873,19.049117,0],[100.637096,19.047468,0],[100.6354,19.044237,0],[100.633713,19.040219,0]],[[100.624786,19.045369,0],[100.633683,19.040231,0],[100.6364,19.040647,0],[100.640209,19.043083,0],[100.642192,19.043265,0],[100.644444,19.042126,0]],[[100.655321,19.058486,0],[100.654785,19.055568,0],[100.654017,19.054057,0],[100.650475,19.052206,0],[100.649016,19.051207,0],[100.647245,19.05026,0],[100.642137,19.048692,0],[100.640049,19.047132,0],[100.637096,19.047468,0],[100.634923,19.049794,0],[100.631294,19.048659,0],[100.624786,19.045369,0],[100.617052,19.039008,0]],[[100.619616,19.033614,0],[100.618593,19.036252,0],[100.617052,19.039008,0],[100.615786,19.040228,0],[100.615113,19.041197,0],[100.616218,19.042927,0],[100.618858,19.045414,0],[100.620513,19.048165,0],[100.623002,19.052138,0],[100.625927,19.054217,0],[100.629912,19.055509,0],[100.631706,19.057226,0],[100.632571,19.059584,0],[100.632824,19.060859,0],[100.633139,19.061224,0],[100.634065,19.06147,0],[100.636416,19.06128,0],[100.638289,19.061227,0],[100.639925,19.061223,0],[100.641093,19.060709,0],[100.642095,19.060171,0],[100.642854,19.060168,0],[100.643991,19.059235,0],[100.646343,19.058955,0],[100.647683,19.058859,0],[100.649557,19.058505,0],[100.650975,19.059397,0],[100.652,19.059672,0],[100.653576,19.058686,0],[100.655321,19.058486,0]]]}},{\"type\":\"Feature\",\"properties\":{\"OBJECTID_1\":735,\"km\":16.53756555747,\"OFF_NT\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"TYPE\":\"ควบคุมไฟป่า\",\"L_KM\":60,\"CENTER\":null,\"DESC\":\"หน่วยจัดการต้นน้ำน้ำงาว | ควบคุมไฟป่า | 60\",\"id\":1,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แนวกันไฟ กิจกรรมควบคุมไฟป่า\",\"year\":\"2565\",\"amount\":17,\"amount_pln\":\"50\",\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แนวกันไฟ กิจกรรมควบคุมไฟป่า_2565_50\"},\"geometry\":{\"type\":\"MultiLineString\",\"coordinates\":[[[100.666404,19.034659,0],[100.664144,19.034262,0],[100.657799,19.031679,0],[100.655083,19.030008,0]],[[100.654594,19.043027,0],[100.655241,19.042011,0],[100.654836,19.040593,0],[100.653961,19.039036,0],[100.654305,19.037584,0],[100.653012,19.036023,0],[100.653296,19.034615,0],[100.653179,19.033095,0],[100.654007,19.031889,0],[100.654343,19.031245,0],[100.655086,19.030008,0]],[[100.667426,19.039478,0],[100.662771,19.039765,0],[100.661757,19.039826,0],[100.659875,19.039299,0],[100.657725,19.03906,0],[100.653961,19.039036,0]],[[100.655528,19.053384,0],[100.657036,19.053077,0],[100.658537,19.052667,0],[100.659639,19.052638,0],[100.660886,19.053408,0],[100.660963,19.053413,0],[100.661538,19.053705,0],[100.662264,19.05359,0],[100.663941,19.05391,0],[100.666089,19.054381,0],[100.667306,19.054633,0],[100.66865,19.055587,0],[100.669109,19.055834,0]],[[100.672232,19.047439,0],[100.667083,19.046824,0],[100.664218,19.048425,0],[100.66014,19.046835,0],[100.658631,19.045627,0],[100.657868,19.045408,0],[100.654594,19.043027,0]],[[100.655321,19.058486,0],[100.657101,19.059152,0],[100.657993,19.060164,0],[100.659307,19.060641,0],[100.660253,19.060881,0],[100.663708,19.062078,0],[100.664207,19.062237,0],[100.665181,19.061501,0],[100.666409,19.060176,0],[100.666956,19.059537,0],[100.668505,19.056952,0],[100.669788,19.054578,0],[100.670902,19.052576,0],[100.673178,19.050598,0],[100.67274,19.049513,0],[100.672237,19.047612,0],[100.672162,19.044882,0],[100.67072,19.044181,0],[100.669394,19.043699,0],[100.667618,19.041745,0],[100.667405,19.039231,0],[100.666164,19.036384,0],[100.666461,19.034252,0],[100.666921,19.032225,0],[100.666535,19.030858,0],[100.666379,19.029505,0],[100.66545,19.027351,0],[100.663818,19.024789,0]],[[100.654034,19.054089,0],[100.655528,19.053384,0],[100.656055,19.051179,0],[100.655208,19.049369,0],[100.654122,19.048007,0],[100.654594,19.043027,0]],[[100.655085,19.030007,0],[100.656291,19.029213,0],[100.656989,19.027647,0],[100.657265,19.026706,0],[100.657472,19.02517,0],[100.658998,19.024857,0],[100.660754,19.02442,0],[100.663817,19.024786,0]]]}},{\"type\":\"Feature\",\"properties\":{\"OBJECTID_1\":736,\"km\":11.87602777136,\"OFF_NT\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"TYPE\":\"ควบคุมไฟป่า\",\"L_KM\":60,\"CENTER\":null,\"DESC\":\"หน่วยจัดการต้นน้ำน้ำงาว | ควบคุมไฟป่า | 60\",\"id\":2,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แนวกันไฟ กิจกรรมควบคุมไฟป่า\",\"year\":\"2565\",\"amount\":12,\"amount_pln\":\"50\",\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แนวกันไฟ กิจกรรมควบคุมไฟป่า_2565_50\"},\"geometry\":{\"type\":\"MultiLineString\",\"coordinates\":[[[100.640684,19.024002,0],[100.640983,19.024858,0],[100.640995,19.025679,0],[100.640497,19.026158,0],[100.639532,19.026731,0],[100.638684,19.027455,0],[100.638458,19.028131,0],[100.638724,19.028879,0],[100.639354,19.029551,0],[100.639809,19.029965,0],[100.640403,19.030722,0],[100.641056,19.031827,0],[100.640746,19.032587,0],[100.642299,19.033882,0],[100.644482,19.03466,0],[100.646863,19.03556,0],[100.648423,19.036634,0],[100.650107,19.037692,0],[100.651834,19.038913,0],[100.653961,19.039036,0]],[[100.623052,19.028318,0],[100.625847,19.028118,0],[100.627702,19.02781,0],[100.629167,19.027564,0],[100.631006,19.027885,0],[100.631814,19.028459,0],[100.632754,19.028799,0],[100.63384,19.029029,0],[100.635926,19.029116,0],[100.637535,19.029353,0],[100.638724,19.028879,0]],[[100.654594,19.043027,0],[100.651898,19.042821,0],[100.650436,19.042628,0],[100.646802,19.041188,0],[100.645273,19.040887,0],[100.642202,19.039392,0],[100.639115,19.038354,0],[100.635324,19.035694,0]],[[100.655085,19.030007,0],[100.655084,19.030007,0],[100.65407,19.029679,0],[100.651961,19.029114,0],[100.645317,19.031643,0],[100.640746,19.032587,0],[100.6383,19.034345,0],[100.635216,19.035743,0],[100.630749,19.035625,0],[100.628158,19.03477,0],[100.626327,19.033968,0],[100.623351,19.03346,0],[100.619616,19.033614,0],[100.622531,19.030607,0],[100.622906,19.028795,0],[100.623444,19.02703,0],[100.62412,19.023802,0]]]}},{\"type\":\"Feature\",\"properties\":{\"OBJECTID_1\":737,\"km\":15.06470378826,\"OFF_NT\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"TYPE\":\"ควบคุมไฟป่า\",\"L_KM\":60,\"CENTER\":null,\"DESC\":\"หน่วยจัดการต้นน้ำน้ำงาว | ควบคุมไฟป่า | 60\",\"id\":3,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แนวกันไฟ กิจกรรมควบคุมไฟป่า\",\"year\":\"2565\",\"amount\":15,\"amount_pln\":\"50\",\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แนวกันไฟ กิจกรรมควบคุมไฟป่า_2565_50\"},\"geometry\":{\"type\":\"MultiLineString\",\"coordinates\":[[[100.618335,19.018971,0],[100.619451,19.018316,0],[100.622372,19.017451,0],[100.625366,19.01568,0],[100.626327,19.016563,0],[100.627151,19.018596,0],[100.628485,19.01942,0],[100.629271,19.020387,0],[100.629997,19.021563,0]],[[100.640684,19.024002,0],[100.643275,19.023892,0],[100.644477,19.023982,0],[100.646522,19.024738,0],[100.647953,19.025443,0],[100.650043,19.025719,0],[100.652088,19.02635,0],[100.653365,19.025584,0],[100.655269,19.024639,0],[100.656197,19.024532,0],[100.657483,19.025193,0]],[[100.650663,19.019879,0],[100.65095,19.018612,0],[100.652428,19.016926,0],[100.653298,19.01536,0],[100.65426,19.013478,0],[100.655176,19.012218,0],[100.655188,19.012144,0],[100.655199,19.012129,0],[100.655656,19.009974,0],[100.655664,19.009938,0],[100.655754,19.009103,0],[100.655217,19.008608,0],[100.654198,19.007986,0],[100.654158,19.007965,0],[100.65202,19.006868,0],[100.649588,19.006257,0],[100.648641,19.006359,0],[100.64767,19.008139,0],[100.646577,19.008669,0],[100.64652,19.008718,0],[100.646481,19.00875,0],[100.645197,19.010145,0],[100.645201,19.010259,0],[100.645107,19.011088,0],[100.645177,19.011226,0],[100.646069,19.013142,0],[100.647712,19.013511,0],[100.646442,19.015348,0],[100.645581,19.01652,0],[100.644673,19.017671,0],[100.643066,19.020176,0]],[[100.661328,19.018546,0],[100.659464,19.019504,0],[100.65648,19.02008,0],[100.65371,19.019686,0],[100.651347,19.019784,0],[100.64719,19.02036,0],[100.645173,19.020697,0],[100.643066,19.020176,0],[100.641719,19.021442,0],[100.640774,19.022715,0],[100.640684,19.024002,0],[100.637704,19.02436,0],[100.636484,19.025016,0],[100.634353,19.023682,0],[100.633438,19.022586,0],[100.631669,19.021585,0],[100.629997,19.021563,0],[100.624252,19.023784,0],[100.623145,19.023822,0],[100.620743,19.022259,0],[100.618908,19.019472,0],[100.618335,19.018971,0],[100.615862,19.020221,0],[100.615019,19.022624,0],[100.614139,19.024755,0],[100.614091,19.025831,0],[100.614095,19.027008,0],[100.613786,19.027967,0],[100.617774,19.03217,0],[100.619616,19.033614,0]]]}}]}',
    'GsvdqIKf',
    ''
  );
INSERT INTO
  `taskdata` (
    `idkey`,
    `offkey`,
    `type`,
    `offname`,
    `actkey`,
    `actname`,
    `year`,
    `amount`,
    `date`,
    `note`,
    `jsondata`,
    `publickey`,
    `overlap_data`
  )
VALUES
  (
    'MVpCJwwj',
    'nW0FcPVy',
    'polygon',
    'หน่วยจัดการต้นน้ำน้ำงาว',
    'bnyPJG',
    'แปลงปลูกป่าแนวกันชน',
    2565,
    20,
    '02-05-2022 07:39',
    '',
    '{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"properties\":{\"id\":0,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\",\"amount\":156},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.906677,19.346628],[100.913544,19.347195],[100.913372,19.342901],[100.913887,19.341804],[100.908093,19.344599],[100.906677,19.346628]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":1,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":42,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.915174,19.34937],[100.914445,19.34775],[100.914938,19.345988],[100.915711,19.345037],[100.917192,19.345057],[100.91644,19.346819],[100.915754,19.347973],[100.915174,19.34937]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":2,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":8,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.910153,19.34208],[100.909767,19.341067],[100.910025,19.3405],[100.910647,19.340318],[100.910647,19.341128],[100.910797,19.341634],[100.910153,19.34208]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":3,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":28,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.916033,19.342078],[100.913115,19.340215],[100.914445,19.339121],[100.915089,19.339081],[100.916033,19.342078]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":4,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":39,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.903587,19.344184],[100.903716,19.341794],[100.904317,19.34143],[100.905905,19.341551],[100.905948,19.343252],[100.90539,19.343779],[100.903587,19.344184]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":5,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":28,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.900583,19.348599],[100.901055,19.34706],[100.902858,19.346331],[100.903373,19.346574],[100.902901,19.348072],[100.901613,19.348437],[100.900583,19.348599]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":6,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":27,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.90466,19.348599],[100.904274,19.347222],[100.905905,19.346533],[100.90642,19.347505],[100.906291,19.348801],[100.905218,19.348963],[100.90466,19.348599]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":7,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":165,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.894017,19.342604],[100.89642,19.340863],[100.897665,19.339972],[100.901356,19.341713],[100.900884,19.343],[100.897837,19.345278],[100.895863,19.344711],[100.894017,19.342604]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":8,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":69,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.902257,19.34062],[100.901914,19.339486],[100.903373,19.338312],[100.904746,19.337825],[100.907063,19.337501],[100.906634,19.339365],[100.905819,19.33981],[100.902257,19.34062]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":9,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำงาว\",\"act_name\":\"แปลงปลูกป่าแนวกันชน\",\"year\":2565,\"amount\":36,\"amount_pln\":20,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าแนวกันชน_2565_20\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.90157,19.352082],[100.900626,19.351272],[100.901871,19.350422],[100.90333,19.349774],[100.903802,19.349814],[100.903802,19.351272],[100.902858,19.352204],[100.90157,19.352082]]]}}]}',
    'HTOsYXsC',
    '[{\"name\":\"แปลงปลูกป่าส่วนจัดการต้นน้ำ\",\"dbkeyname\":\"PLOT0001\",\"desc_\":\"หน่วยจัดการต้นน้ำน้ำเปือ | ปลูกป่าทั่วไป | 2524 | 1000\",\"overlapJSON\":{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.91269023345572,19.34238131489321],[100.913887,19.341804],[100.913372,19.342901],[100.91340721675066,19.34378019027502],[100.91304338300006,19.343442399000025],[100.91269023345572,19.34238131489321]]]}}},{\"name\":\"แปลงปลูกป่าส่วนจัดการต้นน้ำ\",\"dbkeyname\":\"PLOT0001\",\"desc_\":\"หน่วยจัดการต้นน้ำน้ำเปือ | ปลูกป่าทั่วไป | 2524 | 1000\",\"overlapJSON\":{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.91530668189365,19.34553442111144],[100.915711,19.345037],[100.917192,19.345057],[100.91652182703689,19.346627272288558],[100.91530668189365,19.34553442111144]]]}}},{\"name\":\"แปลงปลูกป่าส่วนจัดการต้นน้ำ\",\"dbkeyname\":\"PLOT0001\",\"desc_\":\"หน่วยจัดการต้นน้ำน้ำเปือ | ปลูกป่าทั่วไป | 2524 | 1000\",\"overlapJSON\":{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.913115,19.340215],[100.914445,19.339121],[100.915089,19.339081],[100.916033,19.342078],[100.913115,19.340215]]]}}},{\"name\":\"แปลงปลูกป่าส่วนฟื้นฟู FPT\",\"dbkeyname\":\"SZFksAmI\",\"desc_\":\"FPT 31 | โครงการปลูกป่าถาวรเฉลิมพระเกียรติ | พื้นที่ที่ฟื้นฟูสภาพเป็นป่าธรรมชาติ | 0 | 7000\",\"overlapJSON\":{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.90799543226922,19.346401060224444],[100.90803006159253,19.344756827576983],[100.90805294383743,19.34465639686005],[100.908093,19.344599],[100.91061916371886,19.34338038978353],[100.91117723945244,19.343648293011558],[100.91179024974997,19.34439473979871],[100.91179609574284,19.344896597295076],[100.9116010820094,19.345448364838244],[100.91164316267523,19.345818387201163],[100.9122906073695,19.346277658021258],[100.91282754378187,19.34697709581935],[100.9129026919067,19.347142047955597],[100.90808463528924,19.346744226767],[100.90808744319983,19.346734709130867],[100.90799543226922,19.346401060224444]]]}}}]'
  );
INSERT INTO
  `taskdata` (
    `idkey`,
    `offkey`,
    `type`,
    `offname`,
    `actkey`,
    `actname`,
    `year`,
    `amount`,
    `date`,
    `note`,
    `jsondata`,
    `publickey`,
    `overlap_data`
  )
VALUES
  (
    'u4uq1TU6',
    'aiMoRDdT',
    'polygon',
    'หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ',
    'lZYLpQ',
    'แปลงปลูกป่า 3 อย่าง ประโยชน์ 4 อย่าง',
    2565,
    100,
    '02-05-2022 03:40',
    '',
    '{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"properties\":{\"id\":0,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ\",\"act_name\":\"แปลงปลูกป่า 3 อย่าง ประโยชน์ 4 อย่าง\",\"year\":2565,\"amount_pln\":100,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ_แปลงปลูกป่า 3 อย่าง ประโยชน์ 4 อย่าง_2565_100\",\"amount\":102},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[101.07748,19.365446],[101.075732,19.365162],[101.075678,19.363178],[101.076236,19.361271],[101.076279,19.361231],[101.079465,19.36079],[101.079905,19.362061],[101.078682,19.364188],[101.07748,19.365446]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":1,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ\",\"act_name\":\"แปลงปลูกป่า 3 อย่าง ประโยชน์ 4 อย่าง\",\"year\":2565,\"amount\":29,\"amount_pln\":100,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ_แปลงปลูกป่า 3 อย่าง ประโยชน์ 4 อย่าง_2565_100\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[101.082287,19.363704],[101.081815,19.362337],[101.082759,19.361081],[101.083746,19.361051],[101.084304,19.362053],[101.083435,19.363035],[101.082287,19.363704]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":2,\"off_name\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ\",\"act_name\":\"แปลงปลูกป่า 3 อย่าง ประโยชน์ 4 อย่าง\",\"year\":2565,\"amount\":14,\"amount_pln\":100,\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ_แปลงปลูกป่า 3 อย่าง ประโยชน์ 4 อย่าง_2565_100\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[101.074948,19.365617],[101.073564,19.364787],[101.074144,19.363542],[101.074594,19.363309],[101.075045,19.365172],[101.074948,19.365617]]]}}]}',
    'EFMQlp1q',
    '[{\"name\":\"แปลงปลูกป่าส่วนฟื้นฟู (สวนป่าโครงการ)\",\"dbkeyname\":\"KBOFCoPA\",\"desc_\":\"ปลูกป่าทั่วไป | 2556 | 1000 | โครงการ กฟผ. เฉลิมพระเกียรติ 60 พรรษา\",\"overlapJSON\":{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[101.081815,19.362337],[101.082759,19.361081],[101.083746,19.361051],[101.084304,19.362053],[101.083435,19.363035],[101.082287,19.363704],[101.081815,19.362337]]]}}},{\"name\":\"แปลงปลูกป่าส่วนฯ ราชดำริ\",\"dbkeyname\":\"nKJorIfR\",\"desc_\":\"แปลงปลูกป่าทั่วไป | 2536 | 500 | โครงการพัฒนาเพื่อความมั่นคงพื้นที่ลุ่มน้ำน่าน อันเนื่องมาจากพระ\",\"overlapJSON\":{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[101.073564,19.364787],[101.074144,19.363542],[101.074594,19.363309],[101.075045,19.365172],[101.074948,19.365617],[101.073564,19.364787]]]}}}]'
  );
INSERT INTO
  `taskdata` (
    `idkey`,
    `offkey`,
    `type`,
    `offname`,
    `actkey`,
    `actname`,
    `year`,
    `amount`,
    `date`,
    `note`,
    `jsondata`,
    `publickey`,
    `overlap_data`
  )
VALUES
  (
    'UgW0ElyC',
    'wfQhRMHG',
    'polygon',
    'หน่วยจัดการต้นน้ำขุนสถาน',
    'kUltab',
    'ข้อมูลจากการสำรวจเบื้องต้น',
    2565,
    100,
    '02-05-2022 07:54',
    '',
    '{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"properties\":{\"id\":0,\"off_name\":\"หน่วยจัดการต้นน้ำขุนสถาน\",\"act_name\":\"ข้อมูลจากการสำรวจเบื้องต้น\",\"year\":\"2565\",\"amount\":136,\"amount_pln\":\"100\",\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำขุนสถาน_ข้อมูลจากการสำรวจเบื้องต้น_2565_100\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.584469,18.244015],[100.583954,18.241243],[100.58507,18.238715],[100.587215,18.238634],[100.587387,18.240754],[100.587473,18.243363],[100.586615,18.245729],[100.584469,18.244015]]]}},{\"type\":\"Feature\",\"properties\":{\"id\":1,\"off_name\":\"หน่วยจัดการต้นน้ำขุนสถาน\",\"act_name\":\"ข้อมูลจากการสำรวจเบื้องต้น\",\"year\":\"2565\",\"amount\":196,\"amount_pln\":\"100\",\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำขุนสถาน_ข้อมูลจากการสำรวจเบื้องต้น_2565_100\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[100.575843,18.24826],[100.581422,18.242797],[100.582752,18.245039],[100.58301,18.245651],[100.583053,18.246303],[100.583782,18.247281],[100.583997,18.24879],[100.580735,18.249442],[100.57919,18.248545],[100.577602,18.24773],[100.576787,18.248464],[100.575843,18.24826]]]}}]}',
    '6HseO4Q8',
    ''
  );
INSERT INTO
  `taskdata` (
    `idkey`,
    `offkey`,
    `type`,
    `offname`,
    `actkey`,
    `actname`,
    `year`,
    `amount`,
    `date`,
    `note`,
    `jsondata`,
    `publickey`,
    `overlap_data`
  )
VALUES
  (
    'VX6p2krd',
    'aiMoRDdT',
    'polygon',
    'หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ',
    'ySGave',
    'แปลงปลูกไม้ใช้สอย',
    2565,
    100,
    '23-03-2022 07:59',
    'แปลง 2',
    '{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"properties\":{\"id\":\"0\",\"off_name\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ\",\"act_name\":\"แปลงปลูกไม้ใช้สอย\",\"year\":\"2565\",\"amnt_pln\":\"100\",\"note\":\"แปลง 2\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ_แปลงปลูกไม้ใช้สอย_2565_100\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[101.045242000000001780790626071393489837646484375,19.0371090000000009467839845456182956695556640625],[101.04514399999999341162038035690784454345703125,19.03919700000000148065737448632717132568359375],[101.04820499999999583451426587998867034912109375,19.03933500000000123009158414788544178009033203125],[101.048439999999999372448655776679515838623046875,19.039964000000001220769263454712927341461181640625],[101.0492650000000054433257901109755039215087890625,19.03980200000000166937752510420978069305419921875],[101.04878700000000435466063208878040313720703125,19.038008999999998849261828581802546977996826171875],[101.04903899999999339343048632144927978515625,19.037653999999999854253474040888249874114990234375],[101.0490879999999975780156091786921024322509765625,19.0370300000000014506440493278205394744873046875],[101.0494120000000037862264434807002544403076171875,19.03631299999999981764631229452788829803466796875],[101.0499650000000002592059900052845478057861328125,19.035728999999999899728209129534661769866943359375],[101.0495140000000020563675207085907459259033203125,19.03534499999999951569407130591571331024169921875],[101.0466009999999954516169964335858821868896484375,19.035630999999998635985321016050875186920166015625],[101.0456559999999939236658974550664424896240234375,19.0367880000000013751559890806674957275390625],[101.045242000000001780790626071393489837646484375,19.0371090000000009467839845456182956695556640625],[101.045242000000001780790626071393489837646484375,19.0371090000000009467839845456182956695556640625]]]}}]}',
    'xCLPzjam',
    ''
  );
INSERT INTO
  `taskdata` (
    `idkey`,
    `offkey`,
    `type`,
    `offname`,
    `actkey`,
    `actname`,
    `year`,
    `amount`,
    `date`,
    `note`,
    `jsondata`,
    `publickey`,
    `overlap_data`
  )
VALUES
  (
    'Wez2fxp4',
    'aiMoRDdT',
    'polygon',
    'หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ',
    'ySGave',
    'แปลงปลูกไม้ใช้สอย',
    2565,
    100,
    '12-04-2022 12:07',
    '',
    '{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"properties\":{\"id\":\"0\",\"off_name\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ\",\"act_name\":\"แปลงปลูกไม้ใช้สอย\",\"year\":\"2565\",\"amnt_pln\":\"100\",\"note\":\"\",\"DESC_\":\"หน่วยจัดการต้นน้ำน้ำเพาะ-น้ำพิ_แปลงปลูกไม้ใช้สอย_2565_100\"},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[101.050082000000003290551831014454364776611328125,19.0398110000000002628439688123762607574462890625],[101.0499379999999973733793012797832489013671875,19.039722000000001145281203207559883594512939453125],[101.049296999999995705366018228232860565185546875,19.04013499999999936562744551338255405426025390625],[101.0487590000000039935912354849278926849365234375,19.040358000000001226226231665350496768951416015625],[101.0492610000000013315002433955669403076171875,19.041056999999998566863723681308329105377197265625],[101.0494929999999982328517944552004337310791015625,19.04140699999999952751750242896378040313720703125],[101.0492109999999996716724126599729061126708984375,19.042412999999999811961970408447086811065673828125],[101.0498889999999931887941784225404262542724609375,19.04268499999999875171852181665599346160888671875],[101.0495829999999983783709467388689517974853515625,19.0433120000000002391971065662801265716552734375],[101.0501650000000068985173129476606845855712890625,19.0435039999999986548573360778391361236572265625],[101.0526210000000020272636902518570423126220703125,19.0416519999999991341610439121723175048828125],[101.0546470000000027766873245127499103546142578125,19.04029299999999835790731594897806644439697265625],[101.0532610000000062200342654250562191009521484375,19.038827000000001277157934964634478092193603515625],[101.0524529999999998608473106287419795989990234375,19.0379870000000011032170732505619525909423828125],[101.052107000000006564732757396996021270751953125,19.0376380000000011705196811817586421966552734375],[101.0518229999999988422132446430623531341552734375,19.037741000000000468617145088501274585723876953125],[101.0521619999999956007741275243461132049560546875,19.039038000000001460421117371879518032073974609375],[101.051817999999997255144990049302577972412109375,19.03961100000000072896000347100198268890380859375],[101.0507620000000059690137277357280254364013671875,19.040327000000001334001353825442492961883544921875],[101.050082000000003290551831014454364776611328125,19.0398110000000002628439688123762607574462890625],[101.050082000000003290551831014454364776611328125,19.0398110000000002628439688123762607574462890625]]]}}]}',
    'PVf7cGCw',
    ''
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
