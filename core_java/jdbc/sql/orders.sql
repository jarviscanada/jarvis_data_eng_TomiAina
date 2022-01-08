CREATE SEQUENCE hp_order_seq start with 10000;
CREATE SEQUENCE hp_orderline_seq start with 10000;

CREATE TABLE orders (
                        order_id bigint NOT NULL DEFAULT nextval('hp_order_seq'),
                        creation_date timestamp DEFAULT NULL,
                        total_due numeric(10,2) DEFAULT NULL,
                        status varchar(50) DEFAULT NULL,
                        customer_id bigint NOT NULL,
                        salesperson_id bigint NOT NULL,
                        PRIMARY KEY (order_id),
                        FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
                        FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
);

CREATE TABLE order_item (
                            order_item_id bigint NOT NULL DEFAULT nextval('hp_orderline_seq'),
                            order_id bigint NOT NULL,
                            product_id bigint NOT NULL,
                            quantity int DEFAULT NULL,
                            PRIMARY KEY (order_item_id),
                            FOREIGN KEY (order_id) REFERENCES orders(order_id),
                            FOREIGN KEY (product_id) REFERENCES product(product_id)
);

ALTER SEQUENCE hp_order_seq OWNED BY orders.order_id;
ALTER SEQUENCE hp_orderline_seq OWnED BY order_item.order_item_id;

INSERT INTO orders (order_id, creation_date, total_due, status, customer_id, salesperson_id)
VALUES
    (1000,'2016-05-14 00:00:00',118.22,'paid',413,130),
    (1001,'2016-07-31 00:00:00',211.22,'returned',128,102),
    (1002,'2016-07-09 00:00:00',139.81,'past due',791,115),
    (1003,'2016-04-04 00:00:00',323.71,'paid',974,139),
    (1004,'2016-02-16 00:00:00',214.02,'paid',866,102),
    (1005,'2016-07-25 00:00:00',7.38,'paid',798,118),
    (1006,'2016-07-16 00:00:00',21.48,'paid',606,133),
    (1007,'2015-06-30 00:00:00',157.13,'paid',265,111),
    (1008,'2016-06-19 00:00:00',60.86,'paid',831,146),
    (1009,'2016-07-01 00:00:00',276.78,'cancelled',789,108),
    (1010,'2015-07-15 00:00:00',108.69,'paid',653,121),
    (1011,'2016-04-12 00:00:00',426.61,'paid',811,108),
    (1012,'2015-08-26 00:00:00',220.55,'paid',751,118),
    (1013,'2015-08-15 00:00:00',168.42,'past due',1093,150),
    (1014,'2015-11-22 00:00:00',393.13,'past due',181,144),
    (1015,'2016-01-06 00:00:00',36.9,'paid',661,136),
    (1016,'2015-11-26 00:00:00',122.24,'due',1080,150),
    (1017,'2015-10-20 00:00:00',277.58,'paid',552,140),
    (1018,'2015-10-03 00:00:00',105.61,'paid',292,114),
    (1019,'2015-09-24 00:00:00',238.45,'paid',486,117),
    (1020,'2015-06-24 00:00:00',221.4,'paid',925,118),
    (1021,'2015-06-25 00:00:00',98.45,'paid',110,141),
    (1022,'2015-08-21 00:00:00',57.28,'paid',971,135),
    (1023,'2016-04-11 00:00:00',143.91,'paid',561,120),
    (1024,'2015-11-12 00:00:00',97.51,'paid',978,122),
    (1025,'2016-02-27 00:00:00',141.41,'paid',336,103),
    (1026,'2016-05-18 00:00:00',136.53,'past due',794,122),
    (1027,'2015-09-11 00:00:00',112.38,'paid',126,131),
    (1028,'2015-10-20 00:00:00',145.18,'paid',371,143),
    (1029,'2016-05-27 00:00:00',48.33,'paid',199,144),
    (1030,'2016-07-19 00:00:00',60.86,'paid',561,138),
    (1031,'2015-08-06 00:00:00',26.85,'paid',859,125),
    (1032,'2016-02-01 00:00:00',153.94,'cancelled',469,114),
    (1033,'2015-07-29 00:00:00',276.01,'paid',914,149),
    (1034,'2015-07-12 00:00:00',62.65,'paid',586,149),
    (1035,'2015-09-10 00:00:00',404.25,'due',717,121),
    (1036,'2015-06-30 00:00:00',232.47,'due',136,109),
    (1037,'2016-07-30 00:00:00',34.01,'returned',334,142),
    (1038,'2016-02-26 00:00:00',227.46,'paid',699,141),
    (1039,'2015-06-23 00:00:00',283.53,'paid',1065,126),
    (1040,'2015-11-09 00:00:00',32.22,'paid',228,125),
    (1041,'2015-12-04 00:00:00',41.17,'paid',675,113),
    (1042,'2015-07-09 00:00:00',196.9,'paid',833,148),
    (1043,'2016-02-28 00:00:00',30.43,'paid',783,120),
    (1044,'2015-10-09 00:00:00',13.95,'past due',652,143),
    (1045,'2016-07-05 00:00:00',290.63,'past due',1039,146),
    (1046,'2015-11-22 00:00:00',373.99,'due',982,129),
    (1047,'2016-06-30 00:00:00',12.53,'cancelled',977,100),
    (1048,'2016-02-12 00:00:00',169.74,'paid',929,147),
    (1049,'2016-04-17 00:00:00',25.06,'paid',734,133),
    (1050,'2016-07-02 00:00:00',78.76,'returned',971,113),
    (1051,'2016-05-05 00:00:00',142.59,'paid',883,102),
    (1052,'2015-09-23 00:00:00',241.34,'due',204,134),
    (1053,'2016-01-25 00:00:00',66.42,'paid',1066,149),
    (1054,'2016-06-19 00:00:00',136.45,'paid',666,121),
    (1055,'2015-11-17 00:00:00',242.66,'paid',915,140),
    (1056,'2016-03-18 00:00:00',218.9,'past due',135,136),
    (1057,'2015-12-20 00:00:00',187.12,'paid',348,128),
    (1058,'2016-03-03 00:00:00',515.06,'paid',1071,115),
    (1059,'2015-11-09 00:00:00',334.53,'paid',347,135),
    (1060,'2015-06-24 00:00:00',130.17,'paid',133,117),
    (1061,'2016-01-13 00:00:00',638.29,'paid',660,141),
    (1062,'2016-07-03 00:00:00',219.64,'paid',717,109),
    (1063,'2016-01-17 00:00:00',208.24,'paid',487,121),
    (1064,'2016-07-27 00:00:00',317.59,'paid',789,140),
    (1065,'2015-07-31 00:00:00',127.61,'paid',157,132),
    (1066,'2015-10-11 00:00:00',216.59,'paid',695,148),
    (1067,'2015-10-12 00:00:00',97.54,'paid',849,132),
    (1068,'2016-05-08 00:00:00',462.66,'paid',302,128),
    (1069,'2015-07-25 00:00:00',199.25,'paid',678,101),
    (1070,'2016-05-19 00:00:00',488.13,'paid',227,122),
    (1071,'2016-04-08 00:00:00',258.3,'paid',853,144),
    (1072,'2015-11-27 00:00:00',74.49,'returned',868,136),
    (1073,'2015-06-13 00:00:00',201.36,'paid',122,129),
    (1074,'2015-06-19 00:00:00',198.3,'paid',529,106),
    (1075,'2016-01-08 00:00:00',125.3,'paid',570,139),
    (1076,'2015-11-08 00:00:00',236.08,'due',571,149),
    (1077,'2016-07-15 00:00:00',129.15,'paid',714,101),
    (1078,'2016-02-09 00:00:00',81.87,'paid',804,133),
    (1079,'2016-04-02 00:00:00',147.6,'paid',509,150),
    (1080,'2015-12-30 00:00:00',53.7,'paid',469,117),
    (1081,'2016-01-11 00:00:00',113.1,'due',1002,120),
    (1082,'2016-02-25 00:00:00',312.91,'paid',415,122),
    (1083,'2015-11-01 00:00:00',218.1,'paid',803,141),
    (1084,'2016-02-13 00:00:00',64.44,'paid',141,110),
    (1085,'2015-11-16 00:00:00',276.75,'due',454,110),
    (1086,'2015-12-14 00:00:00',66.42,'paid',468,124),
    (1087,'2016-01-25 00:00:00',228.78,'paid',805,116),
    (1088,'2016-08-08 00:00:00',287.82,'paid',118,132),
    (1089,'2016-08-09 00:00:00',482.54,'returned',250,108),
    (1090,'2015-08-22 00:00:00',207.11,'paid',866,139),
    (1091,'2016-07-18 00:00:00',290.44,'paid',533,142),
    (1092,'2016-01-12 00:00:00',106.27,'paid',139,143),
    (1093,'2016-07-19 00:00:00',151.98,'paid',905,102),
    (1094,'2015-11-19 00:00:00',153.94,'paid',1055,120),
    (1095,'2016-02-13 00:00:00',186.42,'paid',466,122),
    (1096,'2015-10-29 00:00:00',259.54,'returned',903,122),
    (1097,'2015-11-12 00:00:00',273.45,'paid',600,130),
    (1098,'2015-06-15 00:00:00',451.43,'paid',507,114),
    (1099,'2016-03-02 00:00:00',366.99,'due',925,136),
    (1100,'2015-06-07 00:00:00',192.79,'paid',450,123),
    (1101,'2015-08-19 00:00:00',206.67,'due',153,115),
    (1102,'2015-11-02 00:00:00',99.63,'paid',830,131),
    (1103,'2015-09-20 00:00:00',416.31,'paid',895,140),
    (1104,'2015-09-01 00:00:00',218.07,'paid',448,102),
    (1105,'2016-05-10 00:00:00',283.39,'paid',666,147),
    (1106,'2016-05-23 00:00:00',507.35,'paid',743,119),
    (1107,'2015-07-25 00:00:00',212.15,'paid',949,115),
    (1108,'2015-11-19 00:00:00',125.46,'paid',758,139),
    (1109,'2015-08-09 00:00:00',67.44,'paid',810,110),
    (1110,'2016-07-11 00:00:00',199.26,'paid',211,120),
    (1111,'2016-05-27 00:00:00',155.89,'paid',400,101),
    (1112,'2016-05-12 00:00:00',277.47,'paid',822,106),
    (1113,'2015-08-21 00:00:00',273.87,'due',189,102),
    (1114,'2015-08-02 00:00:00',40.59,'paid',248,148),
    (1115,'2016-02-03 00:00:00',277.75,'paid',415,121),
    (1116,'2015-11-01 00:00:00',161.51,'paid',153,107),
    (1117,'2015-12-19 00:00:00',315.83,'paid',935,137),
    (1118,'2016-06-23 00:00:00',276.01,'paid',1098,134),
    (1119,'2016-05-04 00:00:00',107.01,'paid',166,123),
    (1120,'2016-07-13 00:00:00',263.24,'paid',1067,119),
    (1121,'2016-06-29 00:00:00',277.22,'paid',164,115),
    (1122,'2016-01-15 00:00:00',101.01,'cancelled',555,143),
    (1123,'2016-01-16 00:00:00',130.2,'paid',191,108),
    (1124,'2016-06-27 00:00:00',62.73,'paid',461,132),
    (1125,'2016-06-20 00:00:00',143.91,'due',658,144),
    (1126,'2016-03-24 00:00:00',84.87,'paid',693,140),
    (1127,'2015-08-04 00:00:00',144.6,'returned',624,150),
    (1128,'2015-12-20 00:00:00',210.33,'due',610,143),
    (1129,'2016-04-03 00:00:00',112.77,'paid',268,129),
    (1130,'2016-04-19 00:00:00',396.18,'paid',791,129),
    (1131,'2015-10-26 00:00:00',84.87,'paid',955,103),
    (1132,'2016-04-06 00:00:00',374.48,'due',538,149),
    (1133,'2016-02-19 00:00:00',195.57,'returned',899,143),
    (1134,'2015-06-08 00:00:00',62.65,'past due',916,100),
    (1135,'2016-06-12 00:00:00',291.1,'paid',544,135),
    (1136,'2016-02-11 00:00:00',7.38,'returned',511,125),
    (1137,'2016-03-16 00:00:00',44.75,'past due',846,121),
    (1138,'2016-03-22 00:00:00',261.23,'returned',225,135),
    (1139,'2015-06-30 00:00:00',58.38,'paid',822,135),
    (1140,'2016-04-10 00:00:00',17.9,'paid',752,123),
    (1141,'2015-08-14 00:00:00',22.34,'paid',155,145),
    (1142,'2016-02-15 00:00:00',12.53,'paid',125,144),
    (1143,'2016-06-23 00:00:00',20.22,'paid',778,121),
    (1144,'2015-12-25 00:00:00',198.41,'paid',734,131),
    (1145,'2016-02-03 00:00:00',280.44,'paid',670,134),
    (1146,'2015-12-08 00:00:00',115.41,'paid',746,130),
    (1147,'2016-05-01 00:00:00',250.92,'paid',704,136),
    (1148,'2016-07-05 00:00:00',269.65,'paid',387,137),
    (1149,'2016-06-26 00:00:00',66.42,'returned',193,116),
    (1150,'2016-08-01 00:00:00',371.76,'returned',916,128),
    (1151,'2015-06-05 00:00:00',166.99,'past due',447,114),
    (1152,'2016-01-11 00:00:00',275.66,'cancelled',633,102),
    (1153,'2016-04-02 00:00:00',465.58,'paid',210,132),
    (1154,'2016-07-02 00:00:00',225.09,'paid',724,120),
    (1155,'2016-01-26 00:00:00',194.36,'cancelled',144,100),
    (1156,'2015-07-26 00:00:00',168.89,'due',813,144),
    (1157,'2016-04-24 00:00:00',101.47,'paid',898,148),
    (1158,'2016-06-01 00:00:00',75.18,'cancelled',513,133),
    (1159,'2016-06-29 00:00:00',217.71,'paid',529,146),
    (1160,'2016-03-29 00:00:00',68.68,'paid',367,137),
    (1161,'2015-11-30 00:00:00',244.51,'paid',338,100),
    (1162,'2015-09-01 00:00:00',24.78,'paid',917,127),
    (1163,'2015-10-02 00:00:00',284.33,'paid',133,147),
    (1164,'2016-02-19 00:00:00',226.88,'paid',359,120),
    (1165,'2016-06-09 00:00:00',265.35,'returned',307,132),
    (1166,'2016-07-04 00:00:00',189.79,'paid',1043,147),
    (1167,'2015-06-21 00:00:00',217.3,'past due',669,105),
    (1168,'2016-01-01 00:00:00',132.84,'past due',444,108),
    (1169,'2016-07-04 00:00:00',36.9,'paid',592,123),
    (1170,'2015-06-13 00:00:00',22.03,'paid',782,116),
    (1171,'2015-07-06 00:00:00',277.36,'paid',126,127),
    (1172,'2016-03-03 00:00:00',191.88,'paid',653,101),
    (1173,'2015-10-08 00:00:00',3.58,'paid',369,121),
    (1174,'2015-10-17 00:00:00',226.69,'paid',768,144),
    (1175,'2016-02-09 00:00:00',114.56,'paid',847,127),
    (1176,'2015-10-31 00:00:00',275.49,'past due',482,124),
    (1177,'2015-11-15 00:00:00',134.19,'paid',281,141),
    (1178,'2015-08-02 00:00:00',337.12,'due',280,103),
    (1179,'2016-07-08 00:00:00',558.9,'paid',308,114),
    (1180,'2016-06-15 00:00:00',44.75,'cancelled',820,144),
    (1181,'2016-02-29 00:00:00',285.62,'returned',483,148),
    (1182,'2016-06-12 00:00:00',169.74,'paid',718,103),
    (1183,'2016-03-12 00:00:00',331.88,'past due',985,127),
    (1184,'2015-11-08 00:00:00',35.8,'paid',555,100),
    (1185,'2015-09-19 00:00:00',143.89,'paid',292,119),
    (1186,'2016-03-13 00:00:00',241.09,'paid',422,101),
    (1187,'2016-02-15 00:00:00',198.27,'paid',1009,146),
    (1188,'2016-05-24 00:00:00',42.96,'paid',330,138),
    (1189,'2015-07-25 00:00:00',93.08,'paid',108,111),
    (1190,'2016-03-13 00:00:00',206.89,'paid',911,118),
    (1191,'2016-01-09 00:00:00',168.26,'paid',343,112),
    (1192,'2016-05-28 00:00:00',192.68,'paid',945,140),
    (1193,'2015-06-30 00:00:00',32.65,'paid',528,105),
    (1194,'2015-09-22 00:00:00',127.5,'paid',846,124),
    (1195,'2016-05-18 00:00:00',30.43,'paid',107,116),
    (1196,'2016-05-19 00:00:00',143.06,'paid',862,115),
    (1197,'2016-02-29 00:00:00',233.08,'paid',712,134),
    (1198,'2015-12-25 00:00:00',206.12,'cancelled',968,130),
    (1199,'2016-05-05 00:00:00',55.35,'paid',672,147);

INSERT INTO order_item (order_item_id, order_id, product_id, quantity)
VALUES
    (1000,1128,6,46),
    (1001,1186,16,31),
    (1002,1147,4,39),
    (1003,1050,15,44),
    (1004,1174,13,33),
    (1005,1178,3,8),
    (1006,1006,5,12),
    (1007,1097,9,28),
    (1008,1139,11,12),
    (1010,1105,13,29),
    (1011,1053,8,4),
    (1012,1137,5,25),
    (1013,1074,3,14),
    (1014,1025,9,39),
    (1015,1152,5,23),
    (1016,1059,9,3),
    (1017,1120,10,1),
    (1018,1061,14,45),
    (1019,1011,14,16),
    (1020,1118,1,47),
    (1021,1079,8,39),
    (1022,1081,2,3),
    (1023,1089,10,38),
    (1024,1197,15,31),
    (1025,1120,15,26),
    (1026,1177,10,32),
    (1027,1190,13,29),
    (1028,1048,6,12),
    (1029,1023,6,19),
    (1030,1164,8,40),
    (1031,1055,13,16),
    (1032,1009,14,17),
    (1033,1046,9,42),
    (1034,1131,6,23),
    (1035,1008,5,34),
    (1036,1016,5,25),
    (1037,1120,1,34),
    (1038,1130,1,9),
    (1039,1163,9,41),
    (1040,1093,7,1),
    (1041,1094,7,30),
    (1042,1014,1,30),
    (1043,1038,13,20),
    (1044,1179,7,36),
    (1045,1115,11,41),
    (1046,1009,8,18),
    (1047,1170,13,2),
    (1048,1011,10,2),
    (1049,1064,2,22),
    (1050,1029,11,27),
    (1051,1121,1,13),
    (1052,1073,13,47),
    (1053,1034,11,3),
    (1054,1129,3,47),
    (1055,1182,6,36),
    (1056,1117,1,11),
    (1057,1161,3,2),
    (1058,1028,9,29),
    (1059,1070,12,48),
    (1060,1090,15,17),
    (1061,1134,9,2),
    (1062,1115,8,19),
    (1063,1067,16,3),
    (1064,1135,9,41),
    (1065,1123,9,48),
    (1066,1178,14,38),
    (1067,1038,10,48),
    (1068,1128,8,3),
    (1069,1098,4,3),
    (1070,1003,9,40),
    (1071,1003,16,19),
    (1072,1114,4,11),
    (1073,1106,6,34),
    (1074,1076,15,16),
    (1075,1139,4,8),
    (1076,1019,13,48),
    (1077,1001,9,34),
    (1078,1151,10,21),
    (1079,1007,3,25),
    (1080,1121,8,45),
    (1081,1034,11,32),
    (1082,1166,2,33),
    (1083,1068,5,20),
    (1084,1115,13,34),
    (1085,1198,16,35),
    (1086,1001,9,23),
    (1087,1009,15,17),
    (1089,1174,3,5),
    (1090,1120,11,47),
    (1091,1152,11,35),
    (1092,1120,7,32),
    (1093,1112,11,13),
    (1094,1000,6,17),
    (1095,1194,10,20),
    (1096,1042,15,25),
    (1097,1110,8,23),
    (1098,1037,15,19),
    (1099,1151,9,31),
    (1100,1088,12,1),
    (1101,1009,7,16),
    (1102,1048,16,15),
    (1103,1002,11,25),
    (1104,1127,12,29),
    (1105,1104,13,19),
    (1106,1172,14,5),
    (1107,1000,3,31),
    (1108,1102,2,27),
    (1109,1163,16,30),
    (1110,1010,14,13),
    (1111,1066,5,36),
    (1112,1113,13,32),
    (1113,1047,1,7),
    (1114,1061,9,2),
    (1115,1169,8,10),
    (1116,1039,6,39),
    (1117,1115,15,9),
    (1118,1108,6,32),
    (1119,1161,15,41),
    (1120,1093,4,21),
    (1121,1014,16,31),
    (1122,1100,14,44),
    (1123,1106,12,40),
    (1124,1159,2,20),
    (1125,1187,12,31),
    (1126,1051,10,27),
    (1127,1099,6,46),
    (1128,1065,14,19),
    (1129,1161,9,12),
    (1130,1059,13,24),
    (1131,1059,6,27),
    (1132,1155,15,21),
    (1133,1068,3,46),
    (1134,1184,15,20),
    (1135,1042,1,40),
    (1136,1088,2,25),
    (1137,1198,15,43),
    (1138,1075,5,47),
    (1139,1195,1,17),
    (1140,1105,2,5),
    (1141,1148,11,13),
    (1142,1148,10,43),
    (1143,1118,12,46),
    (1144,1018,13,41),
    (1145,1161,1,28),
    (1146,1017,2,2),
    (1147,1156,14,22),
    (1148,1113,7,41),
    (1149,1076,1,19),
    (1150,1163,3,17),
    (1151,1119,6,29),
    (1152,1041,7,23),
    (1153,1091,6,22),
    (1154,1082,6,15),
    (1155,1020,16,4),
    (1156,1064,6,50),
    (1157,1073,4,6),
    (1158,1058,16,25),
    (1159,1152,11,49),
    (1160,1054,4,20),
    (1161,1196,2,15),
    (1162,1081,15,43),
    (1163,1011,9,26),
    (1164,1062,16,44),
    (1165,1007,9,3),
    (1166,1191,13,14),
    (1167,1049,5,14),
    (1168,1098,15,46),
    (1169,1175,9,44),
    (1170,1002,10,15),
    (1171,1080,7,30),
    (1172,1033,9,47),
    (1173,1072,7,17),
    (1174,1019,3,11),
    (1175,1072,1,4),
    (1176,1070,16,41),
    (1177,1084,5,36),
    (1178,1159,4,39),
    (1179,1082,16,47),
    (1180,1078,8,12),
    (1181,1176,5,32),
    (1183,1165,8,32),
    (1184,1116,7,40),
    (1185,1052,10,46),
    (1186,1180,11,1),
    (1187,1033,10,2),
    (1188,1144,7,49),
    (1189,1028,14,18),
    (1190,1090,6,44),
    (1191,1082,1,27),
    (1192,1171,1,27),
    (1193,1046,10,37),
    (1194,1179,14,22),
    (1195,1060,1,15),
    (1196,1113,7,21),
    (1197,1171,9,29),
    (1198,1003,10,11),
    (1199,1051,9,24),
    (1200,1098,5,46),
    (1201,1082,13,20),
    (1202,1155,11,1),
    (1203,1108,10,2),
    (1204,1189,9,6),
    (1205,1196,3,49),
    (1206,1121,4,18),
    (1207,1105,8,44),
    (1208,1010,4,15),
    (1209,1165,16,37),
    (1210,1199,12,9),
    (1211,1099,6,36),
    (1212,1085,6,30),
    (1213,1052,9,40),
    (1214,1063,9,38),
    (1215,1076,2,47),
    (1216,1106,13,34),
    (1217,1094,15,33),
    (1218,1132,16,48),
    (1219,1093,10,6),
    (1220,1035,9,30),
    (1221,1086,16,18),
    (1222,1070,7,48),
    (1223,1089,11,28),
    (1224,1104,12,46),
    (1225,1001,11,35),
    (1226,1097,7,32),
    (1227,1158,15,42),
    (1228,1070,4,20),
    (1229,1116,11,9),
    (1230,1155,16,42),
    (1231,1023,12,20),
    (1232,1111,6,34),
    (1233,1013,11,24),
    (1234,1156,9,49),
    (1235,1145,12,26),
    (1236,1002,13,9),
    (1237,1055,6,46),
    (1238,1039,1,41),
    (1239,1128,10,8),
    (1240,1039,13,37),
    (1241,1002,16,3),
    (1242,1104,7,8),
    (1243,1199,12,6),
    (1244,1058,16,20),
    (1245,1025,11,40),
    (1246,1048,14,19),
    (1247,1005,16,2),
    (1248,1186,7,11),
    (1249,1125,10,16),
    (1250,1110,14,31),
    (1251,1022,13,9),
    (1252,1053,10,14),
    (1253,1055,12,12),
    (1254,1171,14,48),
    (1255,1036,10,24),
    (1256,1153,11,43),
    (1257,1074,8,29),
    (1258,1197,14,12),
    (1259,1179,2,50),
    (1260,1093,5,20),
    (1261,1017,11,32),
    (1262,1132,11,1),
    (1263,1068,8,43),
    (1264,1058,14,49),
    (1265,1177,1,9),
    (1266,1096,14,17),
    (1267,1113,1,43),
    (1268,1013,10,34),
    (1269,1120,11,6),
    (1270,1091,3,6),
    (1271,1089,4,28),
    (1272,1074,9,37),
    (1273,1146,12,24),
    (1274,1176,10,11),
    (1275,1145,10,2),
    (1276,1105,1,18),
    (1277,1075,15,23),
    (1278,1153,12,50),
    (1279,1021,11,8),
    (1280,1130,4,42),
    (1281,1103,8,39),
    (1282,1125,14,23),
    (1283,1197,7,25),
    (1284,1096,16,48),
    (1285,1036,8,39),
    (1286,1017,13,20),
    (1287,1020,12,33),
    (1288,1164,3,1),
    (1289,1096,9,11),
    (1290,1164,16,21),
    (1291,1163,11,39),
    (1292,1087,8,21),
    (1293,1068,12,11),
    (1294,1087,8,1),
    (1295,1093,6,4),
    (1296,1032,5,40),
    (1297,1123,14,12),
    (1298,1132,14,18),
    (1299,1172,16,30),
    (1300,1071,8,47),
    (1301,1068,7,3),
    (1302,1113,13,16),
    (1303,1011,8,46),
    (1304,1065,7,28),
    (1305,1154,10,19),
    (1306,1132,10,35),
    (1307,1112,16,49),
    (1308,1149,4,11),
    (1309,1066,13,46),
    (1310,1030,11,6),
    (1311,1178,7,47),
    (1312,1129,9,16),
    (1313,1197,14,16),
    (1314,1174,14,43),
    (1315,1112,1,8),
    (1316,1149,10,7),
    (1317,1078,5,21),
    (1318,1021,9,47),
    (1319,1092,13,47),
    (1320,1197,16,8),
    (1321,1130,12,25),
    (1322,1135,4,39),
    (1323,1003,11,50),
    (1324,1109,15,15),
    (1325,1135,8,20),
    (1326,1178,13,25),
    (1327,1035,14,47),
    (1328,1059,2,20),
    (1329,1112,9,33),
    (1330,1060,2,28),
    (1331,1081,1,14),
    (1332,1105,16,5),
    (1333,1056,13,48),
    (1334,1107,14,41),
    (1335,1061,4,32),
    (1336,1106,4,47),
    (1337,1146,11,15),
    (1338,1176,13,31),
    (1339,1068,2,35),
    (1340,1154,2,42),
    (1341,1087,2,4),
    (1342,1153,12,32),
    (1343,1140,7,10),
    (1344,1188,5,24),
    (1345,1153,5,46),
    (1346,1027,11,3),
    (1347,1089,4,33),
    (1348,1012,6,36),
    (1349,1062,13,16),
    (1350,1142,9,7),
    (1351,1107,13,34),
    (1352,1121,1,12),
    (1353,1012,5,49),
    (1354,1058,14,32),
    (1355,1001,9,26),
    (1356,1038,1,4),
    (1357,1035,6,48),
    (1358,1014,9,25),
    (1359,1139,14,2),
    (1360,1103,2,28),
    (1361,1091,4,31),
    (1362,1059,13,23),
    (1364,1118,10,6),
    (1365,1046,12,27),
    (1366,1168,10,36),
    (1367,1109,12,11),
    (1368,1166,7,34),
    (1369,1033,14,50),
    (1370,1179,6,37),
    (1371,1152,11,31),
    (1372,1054,1,35),
    (1373,1027,12,29),
    (1374,1172,6,17),
    (1375,1136,2,2),
    (1376,1056,5,31),
    (1377,1099,5,3),
    (1378,1083,9,37),
    (1379,1161,2,26),
    (1380,1187,15,18),
    (1381,1072,4,10),
    (1382,1088,14,46),
    (1383,1167,5,41),
    (1384,1130,12,36),
    (1385,1024,4,24),
    (1386,1176,9,27),
    (1387,1144,10,17),
    (1388,1152,11,16),
    (1389,1065,2,2),
    (1390,1175,5,20),
    (1391,1042,9,32),
    (1392,1124,8,2),
    (1393,1059,15,40),
    (1394,1186,2,29),
    (1395,1085,2,45),
    (1396,1111,13,17),
    (1397,1022,1,21),
    (1398,1083,14,30),
    (1399,1098,12,49),
    (1400,1003,9,29),
    (1401,1099,2,16),
    (1402,1073,1,2),
    (1403,1167,6,39),
    (1404,1068,1,6),
    (1405,1117,3,50),
    (1406,1026,6,37),
    (1407,1064,5,29),
    (1408,1061,12,35),
    (1409,1066,7,39),
    (1410,1133,8,33),
    (1411,1126,8,23),
    (1412,1020,8,23),
    (1413,1100,9,17),
    (1414,1144,10,13),
    (1415,1134,5,33),
    (1416,1007,12,29),
    (1417,1083,15,19),
    (1418,1103,6,40),
    (1419,1166,3,4),
    (1420,1083,15,4),
    (1421,1073,12,2),
    (1422,1191,7,35),
    (1423,1062,13,16),
    (1424,1056,14,21),
    (1425,1097,16,45),
    (1426,1031,15,15),
    (1427,1173,5,2),
    (1428,1189,13,46),
    (1429,1117,14,35),
    (1430,1071,6,23),
    (1431,1018,9,18),
    (1432,1192,5,14),
    (1433,1179,8,25),
    (1434,1061,2,44),
    (1435,1019,10,36),
    (1436,1038,4,2),
    (1437,1024,1,5),
    (1438,1115,3,32),
    (1439,1147,4,29),
    (1440,1032,13,46),
    (1441,1058,7,28),
    (1442,1153,6,1),
    (1443,1087,4,36),
    (1444,1067,8,5),
    (1445,1077,16,35),
    (1446,1182,10,10),
    (1447,1011,4,25),
    (1448,1067,1,38),
    (1449,1014,3,43),
    (1450,1194,9,30),
    (1451,1192,2,43),
    (1452,1090,9,8),
    (1453,1011,14,14),
    (1454,1192,1,5),
    (1455,1002,1,7),
    (1456,1015,2,10),
    (1457,1191,5,45),
    (1458,1145,16,48),
    (1459,1098,11,38),
    (1460,1004,4,32),
    (1461,1089,15,21),
    (1462,1151,7,19),
    (1463,1079,10,1),
    (1464,1061,9,33),
    (1465,1092,16,6),
    (1466,1010,11,3),
    (1467,1022,11,2),
    (1468,1116,14,20),
    (1469,1091,13,47),
    (1470,1178,9,30),
    (1471,1089,8,8),
    (1472,1046,1,35),
    (1473,1043,1,17),
    (1474,1030,9,28),
    (1475,1014,10,28),
    (1476,1148,9,49),
    (1477,1187,12,14),
    (1478,1042,5,13),
    (1479,1073,11,47),
    (1480,1009,4,24),
    (1481,1028,7,15),
    (1482,1127,9,21),
    (1483,1190,2,42),
    (1484,1098,15,15),
    (1485,1103,13,12),
    (1486,1170,14,5),
    (1487,1176,16,20),
    (1488,1040,15,18),
    (1489,1004,14,26),
    (1490,1017,8,48),
    (1491,1063,8,38),
    (1492,1180,7,24),
    (1493,1094,5,23),
    (1494,1124,2,15),
    (1495,1117,8,21),
    (1496,1016,8,21),
    (1497,1133,8,20),
    (1498,1165,1,6),
    (1499,1088,2,6);
