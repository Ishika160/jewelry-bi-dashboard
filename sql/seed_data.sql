-- ============================================================
-- Jewelry BI System - Seed Data
-- Generated from Excel dummy data files
-- ============================================================
-- Run: ddev mysql < sql/seed_data.sql
-- ============================================================

USE db;

-- ============================================================
-- CATEGORIES
-- ============================================================
INSERT INTO categories (category_id, category_name, description) VALUES
  (1, 'Chain', 'Gold and diamond chains'),
  (2, 'Ring', 'Gold, diamond and gemstone rings'),
  (3, 'Earring', 'Studs, drops and jhumkas'),
  (4, 'Bangle', 'Gold and diamond bangles'),
  (5, 'Bracelet', 'Gold and platinum bracelets'),
  (6, 'Necklace Set', 'Necklace and earring sets');

-- ============================================================
-- PRODUCTS
-- ============================================================
INSERT INTO products (product_id, category_id, product_name, sku, metal_type, purity, color, gross_weight, net_weight, stone_weight, hallmark_code, making_charges, cost_price, selling_price, additional_info) VALUES
  (1, 1, 'Yellow Gold Chain', 'CH01', 'Gold', '18KT', 'Yellow Gold', 15.8, 15.8, 0.0, 'Y1A4UY', 9600.41, 88600.41, 114882.45, 'Gold Chain'),
  (2, 1, 'Yellow Gold Chain', 'CH02', 'Gold', '18KT', 'Yellow Gold', 12.88, 12.88, 0.0, 'G7FY9L', 6265.73, 70665.73, 89440.98, 'Gold Chain'),
  (3, 1, 'Yellow Gold Chain', 'CH03', 'Gold', '22KT', 'Yellow Gold', 29.26, 29.26, 0.0, '3VOYTH', 20513.07, 201925.07, 259548.37, 'Gold Chain'),
  (4, 1, 'Yellow Gold Chain', 'CH04', 'Gold', '18KT', 'Yellow Gold', 3.82, 3.82, 0.0, 'S47FCU', 2088.15, 21188.15, 25468.08, 'Gold Chain'),
  (5, 1, 'Yellow Gold Chain', 'CH05', 'Gold', '22KT', 'Yellow Gold', 12.14, 12.14, 0.0, 'LZVAG9', 6953.75, 82221.75, 100812.89, 'Gold Chain'),
  (6, 1, 'Yellow Gold Chain', 'CH06', 'Gold', '22KT', 'Yellow Gold', 5.01, 5.01, 0.0, '08AGO2', 3861.21, 34923.21, 43658.9, 'Gold Chain'),
  (7, 1, 'Yellow Gold Chain', 'CH07', 'Gold', '22KT', 'Yellow Gold', 45.63, 45.63, 0.0, 'E9GQP1', 40636.02, 323542.02, 417040.18, 'Gold Chain'),
  (8, 1, 'Yellow Gold Chain', 'CH08', 'Gold', '18KT', 'Yellow Gold', 18.03, 18.03, 0.0, '2IHS84', 8855.15, 99005.15, 116561.36, 'Gold Chain'),
  (9, 1, 'Yellow Gold Chain', 'CH09', 'Gold', '22KT', 'Yellow Gold', 34.14, 34.14, 0.0, '5FOA6G', 17215.53, 228883.53, 294105.51, 'Gold Chain'),
  (10, 1, 'White Gold Chain', 'CH10', 'Gold', '18KT', 'White Gold', 10.32, 10.32, 0.0, 'E12UBK', 6886.37, 58486.37, 71263.42, 'Gold Chain'),
  (11, 1, 'Rose Gold Chain', 'CH11', 'Gold', '18KT', 'Rose Gold', 28.07, 28.07, 0.0, 'EVQD3B', 19971.05, 160321.05, 184855.66, 'Gold Chain'),
  (12, 1, 'Yellow Gold Chain', 'CH12', 'Gold', '18KT', 'Yellow Gold', 9.43, 9.43, 0.0, 'QBOWWF', 4943.61, 52093.61, 63281.26, 'Gold Chain'),
  (13, 1, 'White Gold Chain', 'CH13', 'Gold', '22KT', 'White Gold', 21.12, 21.12, 0.0, 'UGJB2Y', 11350.9, 142294.9, 166035.55, 'Gold Chain'),
  (14, 1, 'Yellow Gold Chain', 'CH14', 'Gold', '22KT', 'Yellow Gold', 16.81, 16.81, 0.0, '5MO2HS', 14886.9, 119108.9, 151597.14, 'Gold Chain'),
  (15, 1, 'Yellow Gold Chain', 'CH15', 'Gold', '22KT', 'Yellow Gold', 35.19, 35.19, 0.0, '0PGW1T', 23539.59, 241717.59, 300516.36, 'Gold Chain'),
  (16, 1, 'Yellow Gold Chain', 'CH16', 'Gold', '22KT', 'Yellow Gold', 16.85, 16.85, 0.0, '026FP2', 10920.94, 115390.94, 135219.49, 'Gold Chain'),
  (17, 1, 'Yellow Gold Chain', 'CH17', 'Gold', '22KT', 'Yellow Gold', 19.74, 19.74, 0.0, 'CN8SY4', 11479.03, 133867.03, 169050.16, 'Gold Chain'),
  (18, 1, 'Rose Gold Chain', 'CH18', 'Gold', '22KT', 'Rose Gold', 47.85, 47.85, 0.0, 'D4ZYEE', 37874.62, 334544.62, 424562.58, 'Gold Chain'),
  (19, 1, 'Yellow Gold Chain', 'CH19', 'Gold', '22KT', 'Yellow Gold', 22.86, 22.86, 0.0, 'IEW06U', 15715.74, 157447.74, 203153.17, 'Gold Chain'),
  (20, 1, 'Yellow Gold Chain', 'CH20', 'Gold', '18KT', 'Yellow Gold', 45.91, 45.91, 0.0, '0ZPSXQ', 21642.05, 251192.05, 304395.05, 'Gold Chain'),
  (21, 1, 'Yellow Gold Chain', 'CH21', 'Gold', '18KT', 'Yellow Gold', 6.51, 6.51, 0.0, 'KD1GRX', 4334.97, 36884.97, 44333.52, 'Gold Chain'),
  (22, 1, 'Yellow Gold Chain', 'CH22', 'Gold', '18KT', 'Yellow Gold', 10.65, 10.65, 0.0, '0Q4A0O', 6279.52, 59529.52, 74568.64, 'Gold Chain'),
  (23, 1, 'White Gold Chain', 'CH23', 'Gold', '18KT', 'White Gold', 29.65, 29.65, 0.0, 'TX0UBH', 19126.82, 167376.82, 199419.48, 'Gold Chain'),
  (24, 1, 'Yellow Gold Chain', 'CH24', 'Gold', '22KT', 'Yellow Gold', 35.37, 35.37, 0.0, 'MH22XT', 28108.2, 247402.2, 286521.68, 'Gold Chain'),
  (25, 1, 'Yellow Gold Chain', 'CH25', 'Gold', '22KT', 'Yellow Gold', 37.47, 37.47, 0.0, 'ENDEUO', 24981.16, 257295.16, 301390.02, 'Gold Chain'),
  (26, 1, 'Yellow Gold Chain', 'CH26', 'Gold', '22KT', 'Yellow Gold', 44.71, 44.71, 0.0, 'C0UEXM', 32618.4, 309820.4, 362035.54, 'Gold Chain'),
  (27, 1, 'Yellow Gold Chain', 'CH27', 'Gold', '18KT', 'Yellow Gold', 37.85, 37.85, 0.0, 'S9POAE', 19592.48, 208842.48, 271333.49, 'Gold Chain'),
  (28, 1, 'Yellow Gold Chain', 'CH28', 'Gold', '18KT', 'Yellow Gold', 19.97, 19.97, 0.0, 'LJHP3G', 14843.06, 114693.06, 132151.22, 'Gold Chain'),
  (29, 1, 'Yellow Gold Chain', 'CH29', 'Gold', '18KT', 'Yellow Gold', 38.58, 38.58, 0.0, 'JE0H12', 28926.87, 221826.87, 255611.35, 'Gold Chain'),
  (30, 1, 'Rose Gold Chain', 'CH30', 'Gold', '22KT', 'Rose Gold', 40.21, 40.21, 0.0, 'VSF7TR', 35304.28, 284606.28, 333146.68, 'Gold Chain'),
  (31, 1, 'Yellow Gold Chain', 'CH31', 'Gold', '22KT', 'Yellow Gold', 38.59, 38.59, 0.0, 'RDP3D9', 25103.02, 264361.02, 321512.18, 'Gold Chain'),
  (32, 1, 'Yellow Gold Chain', 'CH32', 'Gold', '18KT', 'Yellow Gold', 31.82, 31.82, 0.0, 'ASM1LZ', 22970.24, 182070.24, 220815.45, 'Gold Chain'),
  (33, 1, 'Yellow Gold Chain', 'CH33', 'Gold', '22KT', 'Yellow Gold', 10.09, 10.09, 0.0, 'M66OEM', 8674.9, 71232.9, 84201.15, 'Gold Chain'),
  (34, 1, 'Rose Gold Chain', 'CH34', 'Gold', '18KT', 'Rose Gold', 45.33, 45.33, 0.0, 'ZAXV9H', 22653.81, 249303.81, 306507.12, 'Gold Chain'),
  (35, 1, 'Yellow Gold Chain', 'CH35', 'Gold', '22KT', 'Yellow Gold', 44.75, 44.75, 0.0, 'L7KR1U', 22780.39, 300230.39, 381638.3, 'Gold Chain'),
  (36, 1, 'White Gold Chain', 'CH36', 'Gold', '22KT', 'White Gold', 47.46, 47.46, 0.0, 'Z8RQ9F', 34541.09, 328793.09, 402002.24, 'Gold Chain'),
  (37, 1, 'Yellow Gold Chain', 'CH37', 'Gold', '18KT', 'Yellow Gold', 23.24, 23.24, 0.0, 'N089RB', 17408.91, 133608.91, 159611.06, 'Gold Chain'),
  (38, 1, 'Yellow Gold Chain', 'CH38', 'Gold', '18KT', 'Yellow Gold', 32.57, 32.57, 0.0, '9S0G1R', 21565.64, 184415.64, 230291.21, 'Gold Chain'),
  (39, 1, 'Yellow Gold Chain', 'CH39', 'Gold', '22KT', 'Yellow Gold', 35.14, 35.14, 0.0, 'K2O7VA', 18348.18, 236216.18, 291238.16, 'Gold Chain'),
  (40, 1, 'Yellow Gold Chain', 'CH40', 'Gold', '18KT', 'Yellow Gold', 36.97, 36.97, 0.0, 'XDN5YU', 19414.35, 204264.35, 252775.89, 'Gold Chain'),
  (41, 1, 'White Gold Chain', 'CH41', 'Gold', '22KT', 'White Gold', 17.42, 17.42, 0.0, 'HVX6V1', 13408.61, 121412.61, 144820.15, 'Gold Chain'),
  (42, 1, 'Yellow Gold Chain', 'CH42', 'Gold', '18KT', 'Yellow Gold', 20.83, 20.83, 0.0, '3GYLOX', 14317.45, 118467.45, 144167.93, 'Gold Chain'),
  (43, 1, 'Yellow Gold Chain', 'CH43', 'Gold', '22KT', 'Yellow Gold', 25.77, 25.77, 0.0, '9QFDR2', 23960.92, 183734.92, 217050.22, 'Gold Chain'),
  (44, 1, 'Yellow Gold Chain', 'CH44', 'Gold', '22KT', 'Yellow Gold', 48.04, 48.04, 0.0, '5S53LJ', 39349.77, 337197.77, 423282.82, 'Gold Chain'),
  (45, 1, 'Yellow Gold Chain', 'CH45', 'Gold', '22KT', 'Yellow Gold', 38.68, 38.68, 0.0, 'C3WMES', 22215.49, 262031.49, 325095.91, 'Gold Chain'),
  (46, 1, 'Yellow Gold Chain', 'CH46', 'Gold', '22KT', 'Yellow Gold', 37.57, 37.57, 0.0, 'YAHC0N', 34733.16, 267667.16, 327512.98, 'Gold Chain'),
  (47, 1, 'Yellow Gold Chain', 'CH47', 'Gold', '22KT', 'Yellow Gold', 26.53, 26.53, 0.0, 'RJS6WS', 20546.44, 185032.44, 215666.71, 'Gold Chain'),
  (48, 1, 'Yellow Gold Chain', 'CH48', 'Gold', '22KT', 'Yellow Gold', 25.11, 25.11, 0.0, '5LY1PL', 14891.55, 170573.55, 204678.85, 'Gold Chain'),
  (49, 1, 'Yellow Gold Chain', 'CH49', 'Gold', '22KT', 'Yellow Gold', 27.74, 27.74, 0.0, 'OO7WHF', 23117.7, 195105.7, 233391.71, 'Gold Chain'),
  (50, 1, 'Yellow Gold Chain', 'CH50', 'Gold', '22KT', 'Yellow Gold', 40.59, 40.59, 0.0, 'KKCCQN', 35096.94, 286754.94, 354449.55, 'Gold Chain');

INSERT INTO products (product_id, category_id, product_name, sku, metal_type, purity, color, gross_weight, net_weight, stone_weight, hallmark_code, making_charges, cost_price, selling_price, additional_info) VALUES
  (51, 1, 'Yellow Gold Chain', 'CH51', 'Gold', '22KT', 'Yellow Gold', 35.04, 35.04, 0.0, 'VJO8NR', 31111.61, 248359.61, 287477.74, 'Gold Chain'),
  (52, 1, 'White Gold Chain', 'CH52', 'Gold', '22KT', 'White Gold', 44.63, 44.63, 0.0, '8XNAUV', 36992.14, 313698.14, 367892.05, 'Gold Chain'),
  (53, 1, 'Yellow Gold Chain', 'CH53', 'Gold', '22KT', 'Yellow Gold', 49.61, 49.61, 0.0, 'FR924Z', 32818.86, 340400.86, 433052.29, 'Gold Chain'),
  (54, 1, 'Yellow Gold Chain', 'CH54', 'Gold', '22KT', 'Yellow Gold', 23.7, 23.7, 0.0, 'U4T462', 12376.9, 159316.9, 187261.84, 'Gold Chain'),
  (55, 1, 'Yellow Gold Chain', 'CH55', 'Gold', '22KT', 'Yellow Gold', 49.78, 49.78, 0.0, '2AOZT8', 38302.21, 346938.21, 448820.62, 'Gold Chain'),
  (56, 1, 'Yellow Gold Chain', 'CH56', 'Gold', '18KT', 'Yellow Gold', 47.32, 47.32, 0.0, '9XYBCU', 20814.75, 257414.75, 305238.78, 'Gold Chain'),
  (57, 1, 'Yellow Gold Chain', 'CH57', 'Gold', '22KT', 'Yellow Gold', 15.48, 15.48, 0.0, 'LOB5SX', 7797.21, 103773.21, 125866.33, 'Gold Chain'),
  (58, 1, 'Yellow Gold Chain', 'CH58', 'Gold', '18KT', 'Yellow Gold', 16.94, 16.94, 0.0, 'K2KG4U', 7663.38, 92363.38, 114246.94, 'Gold Chain'),
  (59, 1, 'Yellow Gold Chain', 'CH59', 'Gold', '22KT', 'Yellow Gold', 24.04, 24.04, 0.0, 'KBRFZS', 17580.3, 166628.3, 202552.98, 'Gold Chain'),
  (60, 1, 'Yellow Gold Chain', 'CH60', 'Gold', '22KT', 'Yellow Gold', 29.95, 29.95, 0.0, 'NWUN0Z', 19498.28, 205188.28, 260868.68, 'Gold Chain'),
  (61, 1, 'Yellow Gold Chain', 'CH61', 'Gold', '22KT', 'Yellow Gold', 16.61, 16.61, 0.0, 'ZZX77M', 12054.82, 115036.82, 146702.27, 'Gold Chain'),
  (62, 1, 'Yellow Gold Chain', 'CH62', 'Gold', '22KT', 'Yellow Gold', 15.22, 15.22, 0.0, '3ZC560', 8414.39, 102778.39, 124609.07, 'Gold Chain'),
  (63, 1, 'Yellow Gold Chain', 'CH63', 'Gold', '22KT', 'Yellow Gold', 44.6, 44.6, 0.0, 'AE1KOR', 38551.69, 315071.69, 366791.12, 'Gold Chain'),
  (64, 1, 'Yellow Gold Chain', 'CH64', 'Gold', '22KT', 'Yellow Gold', 11.11, 11.11, 0.0, 'AEYWGO', 7857.56, 76739.56, 90057.67, 'Gold Chain'),
  (65, 1, 'Yellow Gold Chain', 'CH65', 'Gold', '18KT', 'Yellow Gold', 26.12, 26.12, 0.0, 'WEA79B', 14192.07, 144792.07, 179523.08, 'Gold Chain'),
  (66, 1, 'Yellow Gold Chain', 'CH66', 'Gold', '18KT', 'Yellow Gold', 8.44, 8.44, 0.0, 'T1J52A', 5049.69, 47249.69, 60593.02, 'Gold Chain'),
  (67, 1, 'Rose Gold Chain', 'CH67', 'Gold', '18KT', 'Rose Gold', 7.65, 7.65, 0.0, 'E51XSI', 4611.72, 42861.72, 50542.87, 'Gold Chain'),
  (68, 1, 'Yellow Gold Chain', 'CH68', 'Gold', '18KT', 'Yellow Gold', 47.32, 47.32, 0.0, 'VJDANF', 31128.54, 267728.54, 335838.92, 'Gold Chain'),
  (69, 1, 'Yellow Gold Chain', 'CH69', 'Gold', '22KT', 'Yellow Gold', 32.87, 32.87, 0.0, 'Y6MMAO', 25702.37, 229496.37, 293452.86, 'Gold Chain'),
  (70, 1, 'Rose Gold Chain', 'CH70', 'Gold', '22KT', 'Rose Gold', 43.72, 43.72, 0.0, 'Z7X6C0', 28759.35, 299823.35, 358054.63, 'Gold Chain'),
  (71, 1, 'Yellow Gold Chain', 'CH71', 'Gold', '22KT', 'Yellow Gold', 42.22, 42.22, 0.0, 'EIU4VU', 33313.39, 295077.39, 371982.67, 'Gold Chain'),
  (72, 1, 'Yellow Gold Chain', 'CH72', 'Gold', '22KT', 'Yellow Gold', 9.88, 9.88, 0.0, 'HB3JW9', 4905.95, 66161.95, 81999.13, 'Gold Chain'),
  (73, 1, 'Rose Gold Chain', 'CH73', 'Gold', '22KT', 'Rose Gold', 42.11, 42.11, 0.0, 'NO148P', 37858.6, 298940.6, 367035.48, 'Gold Chain'),
  (74, 1, 'Yellow Gold Chain', 'CH74', 'Gold', '18KT', 'Yellow Gold', 12.94, 12.94, 0.0, 'CGKOKL', 5429.26, 70129.26, 82839.44, 'Gold Chain'),
  (75, 1, 'Yellow Gold Chain', 'CH75', 'Gold', '22KT', 'Yellow Gold', 10.5, 10.5, 0.0, '0FVQDJ', 7135.6, 72235.6, 85857.23, 'Gold Chain'),
  (76, 1, 'Yellow Gold Chain', 'CH76', 'Gold', '22KT', 'Yellow Gold', 43.49, 43.49, 0.0, '037WO0', 38316.72, 307954.72, 387528.66, 'Gold Chain'),
  (77, 1, 'Yellow Gold Chain', 'CH77', 'Gold', '22KT', 'Yellow Gold', 33.15, 33.15, 0.0, 'JHYCJN', 21602.87, 227132.87, 292163.1, 'Gold Chain'),
  (78, 1, 'Yellow Gold Chain', 'CH78', 'Gold', '22KT', 'Yellow Gold', 31.81, 31.81, 0.0, 'S2LIE1', 23424.88, 220646.88, 279275.66, 'Gold Chain'),
  (79, 1, 'Rose Gold Chain', 'CH79', 'Gold', '22KT', 'Rose Gold', 8.31, 8.31, 0.0, '74JXKC', 7545.08, 59067.08, 75198.57, 'Gold Chain'),
  (80, 1, 'White Gold Chain', 'CH80', 'Gold', '18KT', 'White Gold', 17.9, 17.9, 0.0, '42CVKE', 10515.48, 100015.48, 116112.79, 'Gold Chain'),
  (81, 1, 'White Gold Chain', 'CH81', 'Gold', '22KT', 'White Gold', 46.59, 46.59, 0.0, 'EO1LBT', 32327.9, 321185.9, 370615.6, 'Gold Chain'),
  (82, 1, 'Yellow Gold Chain', 'CH82', 'Gold', '22KT', 'Yellow Gold', 36.28, 36.28, 0.0, 'ELNWM3', 27966.11, 252902.11, 328551.63, 'Gold Chain'),
  (83, 1, 'White Gold Chain', 'CH83', 'Gold', '22KT', 'White Gold', 24.51, 24.51, 0.0, 'Y5DLMX', 18456.83, 170418.83, 204409.43, 'Gold Chain'),
  (84, 1, 'Rose Gold Chain', 'CH84', 'Gold', '22KT', 'Rose Gold', 14.03, 14.03, 0.0, 'M0UJT5', 10205.14, 97191.14, 122214.71, 'Gold Chain'),
  (85, 1, 'Yellow Gold Chain', 'CH85', 'Gold', '18KT', 'Yellow Gold', 38.12, 38.12, 0.0, 'CTR7WW', 26589.86, 217189.86, 263697.71, 'Gold Chain'),
  (86, 1, 'Yellow Gold Chain', 'CH86', 'Gold', '22KT', 'Yellow Gold', 29.23, 29.23, 0.0, 'UNQY2K', 14933.03, 196159.03, 240680.95, 'Gold Chain'),
  (87, 1, 'Yellow Gold Chain', 'CH87', 'Gold', '22KT', 'Yellow Gold', 21.05, 21.05, 0.0, 'KHI8HP', 14716.72, 145226.72, 170418.33, 'Gold Chain'),
  (88, 1, 'White Gold Chain', 'CH88', 'Gold', '22KT', 'White Gold', 10.62, 10.62, 0.0, 'HH1OL0', 6053.85, 71897.85, 84190.56, 'Gold Chain'),
  (89, 2, 'White Gold Ring', 'RG01', 'Gold', '22KT', 'White Gold', 6.87, 6.87, 0.0, '8JSLTD', 3755.97, 46349.97, 58850.07, 'Gold Ring'),
  (90, 2, 'Yellow Gold Ring', 'RG02', 'Gold', '18KT', 'Yellow Gold', 4.73, 4.73, 0.0, '6GRNUJ', 2607.75, 26257.75, 33334.24, 'Gold Ring'),
  (91, 2, 'White Gold Ring', 'RG03', 'Gold', '22KT', 'White Gold', 9.19, 9.19, 0.0, 'Y6EP4C', 6914.33, 63892.33, 80219.68, 'Gold Ring'),
  (92, 2, 'White Gold Ring', 'RG04', 'Gold', '22KT', 'White Gold', 4.11, 4.11, 0.0, 'J9DO38', 3411.63, 28893.63, 33421.09, 'Gold Ring'),
  (93, 2, 'White Gold Ring', 'RG05', 'Gold', '18KT', 'White Gold', 4.83, 4.83, 0.0, 'Q55WSW', 2493.88, 26643.88, 34023.31, 'Gold Ring'),
  (94, 2, 'Yellow Gold Ring', 'RG06', 'Gold', '18KT', 'Yellow Gold', 3.63, 3.3, 0.33, 'K2VGVE', 1435.34, 17935.34, 21425.72, 'Kundan Ring'),
  (95, 2, 'Yellow Gold Ring', 'RG07', 'Gold', '18KT', 'Yellow Gold', 7.19, 3.49, 3.7, '20QFUY', 2213.07, 19663.07, 23189.29, 'Kundan Ring'),
  (96, 2, 'Rose Gold Ring', 'RG08', 'Gold', '18KT', 'Rose Gold', 4.56, 4.56, 0.0, 'JR4P2M', 2187.3, 24987.3, 32189.45, 'Gold Ring'),
  (97, 2, 'White Gold Ring', 'RG09', 'Gold', '22KT', 'White Gold', 3.46, 3.46, 0.0, 'XFKGDA', 3029.63, 24481.63, 30052.45, 'Gold Ring'),
  (98, 2, 'Rose Gold Ring', 'RG10', 'Gold', '22KT', 'Rose Gold', 9.02, 7.56, 1.46, '0AEMH9', 4597.42, 51469.42, 64345.62, 'Kundan Ring'),
  (99, 2, 'Rose Gold Ring', 'RG11', 'Gold', '22KT', 'Rose Gold', 8.9, 7.23, 1.67, 'HF58G8', 5124.69, 49950.69, 62730.14, 'Kundan Ring'),
  (100, 2, 'Yellow Gold Ring', 'RG12', 'Gold', '18KT', 'Yellow Gold', 8.95, 8.95, 0.0, 'RZ4QEZ', 5665.16, 50415.16, 62385.59, 'Gold Ring');

INSERT INTO products (product_id, category_id, product_name, sku, metal_type, purity, color, gross_weight, net_weight, stone_weight, hallmark_code, making_charges, cost_price, selling_price, additional_info) VALUES
  (101, 2, 'Yellow Gold Ring', 'RG13', 'Gold', '18KT', 'Yellow Gold', 7.03, 7.03, 0.0, 'I6P6WY', 3234.25, 38384.25, 45359.99, 'Gold Ring'),
  (102, 2, 'White Gold Ring', 'RG14', 'Gold', '22KT', 'White Gold', 1.65, 1.65, 0.0, 'YZR321', 961.92, 11191.92, 14050.03, 'Gold Ring'),
  (103, 2, 'Yellow Gold Ring', 'RG15', 'Gold', '22KT', 'Yellow Gold', 8.11, 8.11, 0.0, '02JUQB', 4661.45, 54943.45, 71334.87, 'Gold Ring'),
  (104, 2, 'Rose Gold Ring', 'RG16', 'Gold', '22KT', 'Rose Gold', 15.29, 11.34, 3.95, '13F27N', 9707.33, 80015.33, 98237.1, 'Kundan Ring'),
  (105, 2, 'Rose Gold Ring', 'RG17', 'Gold', '22KT', 'Rose Gold', 2.57, 2.57, 0.0, '2KWNBP', 2340.16, 18274.16, 22340.8, 'Gold Ring'),
  (106, 2, 'Rose Gold Ring', 'RG18', 'Gold', '22KT', 'Rose Gold', 11.61, 8.89, 2.72, 'LHZ4IM', 7055.95, 62173.95, 77746.22, 'Kundan Ring'),
  (107, 2, 'White Gold Ring', 'RG19', 'Gold', '18KT', 'White Gold', 6.37, 6.37, 0.0, 'IR19QH', 2943.63, 34793.63, 42417.0, 'Gold Ring'),
  (108, 2, 'White Gold Ring', 'RG20', 'Gold', '18KT', 'White Gold', 10.3, 10.3, 0.0, '16BZ01', 5463.48, 56963.48, 68782.4, 'Gold Ring'),
  (109, 2, 'Rose Gold Ring', 'RG21', 'Gold', '18KT', 'Rose Gold', 6.07, 6.07, 0.0, 'XW8D3D', 3792.68, 34142.68, 41595.42, 'Gold Ring'),
  (110, 2, 'Yellow Gold Ring', 'RG22', 'Gold', '18KT', 'Yellow Gold', 6.55, 5.48, 1.07, '6PQSN2', 3364.41, 30764.41, 35795.46, 'Kundan Ring'),
  (111, 2, 'Rose Gold Ring', 'RG23', 'Gold', '22KT', 'Rose Gold', 7.41, 4.44, 2.97, '1NVO1Z', 3808.58, 31336.58, 40540.12, 'Kundan Ring'),
  (112, 2, 'Rose Gold Ring', 'RG24', 'Gold', '18KT', 'Rose Gold', 1.72, 1.72, 0.0, 'IWRPTH', 1187.81, 9787.81, 11806.42, 'Gold Ring'),
  (113, 2, 'White Gold Ring', 'RG25', 'Gold', '22KT', 'White Gold', 8.25, 8.25, 0.0, 'WZ3Q78', 5765.42, 56915.42, 70173.19, 'Gold Ring'),
  (114, 2, 'Yellow Gold Ring', 'RG26', 'Gold', '18KT', 'Yellow Gold', 5.7, 5.7, 0.0, 'R2H2LB', 2715.99, 31215.99, 40037.52, 'Gold Ring'),
  (115, 2, 'Yellow Gold Ring', 'RG27', 'Gold', '22KT', 'Yellow Gold', 13.28, 10.59, 2.69, 'DEE9GV', 5764.54, 71422.54, 86989.31, 'Kundan Ring'),
  (116, 2, 'White Gold Ring', 'RG28', 'Gold', '18KT', 'White Gold', 7.86, 7.86, 0.0, '722XI9', 3515.02, 42815.02, 49715.07, 'Gold Ring'),
  (117, 2, 'Yellow Gold Ring', 'RG29', 'Gold', '18KT', 'Yellow Gold', 5.49, 5.49, 0.0, '0X5IZ9', 3491.74, 30941.74, 38144.08, 'Gold Ring'),
  (118, 2, 'Yellow Gold Ring', 'RG30', 'Gold', '22KT', 'Yellow Gold', 10.11, 10.11, 0.0, 'IR24VN', 7948.2, 70630.2, 85221.94, 'Gold Ring'),
  (119, 2, 'White Gold Ring', 'RG31', 'Gold', '18KT', 'White Gold', 5.11, 3.58, 1.53, '4Y0XVY', 2635.24, 20535.24, 24733.13, 'Kundan Ring'),
  (120, 2, 'Rose Gold Ring', 'RG32', 'Gold', '22KT', 'Rose Gold', 6.49, 6.49, 0.0, 'FVPK3O', 5666.3, 45904.3, 57297.73, 'Gold Ring'),
  (121, 2, 'White Gold Ring', 'RG33', 'Gold', '22KT', 'White Gold', 5.39, 5.39, 0.0, 'A0E1VG', 4643.52, 38061.52, 44772.25, 'Gold Ring'),
  (122, 2, 'Rose Gold Ring', 'RG34', 'Gold', '18KT', 'Rose Gold', 6.04, 6.04, 0.0, 'Z6EWD0', 4101.76, 34301.76, 43283.88, 'Gold Ring'),
  (123, 2, 'Rose Gold Ring', 'RG35', 'Gold', '18KT', 'Rose Gold', 3.56, 3.56, 0.0, 'EKXUHZ', 1488.87, 19288.87, 23503.37, 'Gold Ring'),
  (124, 3, 'Yellow Gold Earring', 'ER01', 'Gold', '18KT', 'Yellow Gold', 9.33, 8.46, 0.87, 'WM3AKM', 5183.4, 47483.4, 54828.73, 'Kundan Earrings'),
  (125, 3, 'Rose Gold Earring', 'ER02', 'Gold', '18KT', 'Rose Gold', 2.54, 2.54, 0.0, 'A47DRF', 1338.25, 14038.25, 17835.44, 'Gold Earrings'),
  (126, 3, 'Yellow Gold Earring', 'ER03', 'Gold', '18KT', 'Yellow Gold', 8.99, 7.87, 1.12, '0UZAYF', 5315.85, 44665.85, 52633.48, 'Kundan Earrings'),
  (127, 3, 'Yellow Gold Earring', 'ER04', 'Gold', '18KT', 'Yellow Gold', 8.77, 4.69, 4.08, 'ZRGTPN', 2444.44, 25894.44, 32937.06, 'Kundan Earrings'),
  (128, 3, 'White Gold Earring', 'ER05', 'Gold', '18KT', 'White Gold', 16.29, 16.29, 0.0, 'TKP4W3', 9936.5, 91386.5, 108239.81, 'Gold Earrings'),
  (129, 3, 'Rose Gold Earring', 'ER06', 'Gold', '22KT', 'Rose Gold', 15.43, 14.68, 0.75, '4GXVEP', 12668.55, 103684.55, 129903.94, 'Kundan Earrings'),
  (130, 3, 'Yellow Gold Earring', 'ER07', 'Gold', '22KT', 'Yellow Gold', 3.23, 3.23, 0.0, '85A2P8', 2880.41, 22906.41, 28851.21, 'Gold Earrings'),
  (131, 3, 'Rose Gold Earring', 'ER08', 'Gold', '22KT', 'Rose Gold', 14.18, 10.82, 3.36, '20K6DZ', 8870.77, 75954.77, 89076.45, 'Kundan Earrings'),
  (132, 3, 'Rose Gold Earring', 'ER09', 'Gold', '22KT', 'Rose Gold', 6.29, 6.29, 0.0, 'E93IOE', 3513.76, 42511.76, 54622.77, 'Gold Earrings'),
  (133, 3, 'Yellow Gold Earring', 'ER10', 'Gold', '22KT', 'Yellow Gold', 11.12, 7.99, 3.13, 'MQFKQV', 5709.96, 55247.96, 70178.99, 'Kundan Earrings'),
  (134, 3, 'Yellow Gold Earring', 'ER11', 'Gold', '22KT', 'Yellow Gold', 3.91, 2.93, 0.98, 'ISX0UL', 1709.81, 19875.81, 23204.18, 'Kundan Earrings'),
  (135, 3, 'Yellow Gold Earring', 'ER12', 'Gold', '22KT', 'Yellow Gold', 6.32, 6.32, 0.0, 'WDNOUZ', 3922.15, 43106.15, 56025.78, 'Gold Earrings'),
  (136, 3, 'Yellow Gold Earring', 'ER13', 'Gold', '18KT', 'Yellow Gold', 10.3, 10.3, 0.0, 'PE82A3', 7469.33, 58969.33, 73270.57, 'Gold Earrings'),
  (137, 3, 'White Gold Earring', 'ER14', 'Gold', '18KT', 'White Gold', 15.79, 15.79, 0.0, 'H7Y2PV', 7006.05, 85956.05, 106082.79, 'Gold Earrings'),
  (138, 3, 'White Gold Earring', 'ER15', 'Gold', '18KT', 'White Gold', 12.52, 12.52, 0.0, '42CF2S', 7994.1, 70594.1, 84651.41, 'Gold Earrings'),
  (139, 3, 'Yellow Gold Earring', 'ER16', 'Gold', '22KT', 'Yellow Gold', 16.64, 16.64, 0.0, 'JI86CL', 14518.12, 117686.12, 137404.16, 'Gold Earrings'),
  (140, 3, 'White Gold Earring', 'ER17', 'Gold', '18KT', 'White Gold', 7.19, 7.19, 0.0, '328IKZ', 3709.46, 39659.46, 46492.29, 'Gold Earrings'),
  (141, 3, 'Rose Gold Earring', 'ER18', 'Gold', '18KT', 'Rose Gold', 17.64, 12.56, 5.08, 'MDZ4SA', 9369.53, 72169.53, 87211.38, 'Kundan Earrings'),
  (142, 3, 'Yellow Gold Earring', 'ER19', 'Gold', '18KT', 'Yellow Gold', 6.58, 6.58, 0.0, '2SBWTR', 3983.39, 36883.39, 47947.72, 'Gold Earrings'),
  (143, 3, 'White Gold Earring', 'ER20', 'Gold', '22KT', 'White Gold', 14.98, 14.98, 0.0, 'OQONI4', 13090.32, 105966.32, 123588.38, 'Gold Earrings'),
  (144, 3, 'Rose Gold Earring', 'ER21', 'Gold', '18KT', 'Rose Gold', 3.21, 3.21, 0.0, '37JOK3', 1799.66, 17849.66, 22846.67, 'Gold Earrings'),
  (145, 3, 'Yellow Gold Earring', 'ER22', 'Gold', '22KT', 'Yellow Gold', 4.92, 4.92, 0.0, '07WPJM', 3846.71, 34350.71, 40764.8, 'Gold Earrings'),
  (146, 3, 'Rose Gold Earring', 'ER23', 'Gold', '18KT', 'Rose Gold', 2.93, 2.93, 0.0, '0D7HR4', 1291.83, 15941.83, 20203.5, 'Gold Earrings'),
  (147, 3, 'White Gold Earring', 'ER24', 'Gold', '18KT', 'White Gold', 6.27, 4.82, 1.45, '0W4KEV', 2849.92, 26949.92, 34662.44, 'Kundan Earrings'),
  (148, 3, 'Yellow Gold Earring', 'ER25', 'Gold', '18KT', 'Yellow Gold', 14.3, 14.3, 0.0, 'YIFKJZ', 10435.13, 81935.13, 98474.84, 'Gold Earrings'),
  (149, 3, 'Rose Gold Earring', 'ER26', 'Gold', '18KT', 'Rose Gold', 8.87, 8.87, 0.0, '07I4WD', 3678.15, 48028.15, 55317.94, 'Gold Earrings'),
  (150, 3, 'White Gold Earring', 'ER27', 'Gold', '22KT', 'White Gold', 10.72, 9.95, 0.77, 'CS6AE2', 7477.06, 69167.06, 82584.8, 'Kundan Earrings');

INSERT INTO products (product_id, category_id, product_name, sku, metal_type, purity, color, gross_weight, net_weight, stone_weight, hallmark_code, making_charges, cost_price, selling_price, additional_info) VALUES
  (151, 3, 'White Gold Earring', 'ER28', 'Gold', '22KT', 'White Gold', 14.44, 14.44, 0.0, 'UW1THP', 10080.04, 99608.04, 116602.7, 'Gold Earrings'),
  (152, 3, 'Yellow Gold Earring', 'ER29', 'Gold', '22KT', 'Yellow Gold', 16.51, 16.51, 0.0, 'TGGZTL', 11922.37, 114284.37, 139003.31, 'Gold Earrings'),
  (153, 3, 'White Gold Earring', 'ER30', 'Gold', '22KT', 'White Gold', 9.45, 7.47, 1.98, '65BGCX', 5668.48, 51982.48, 61824.13, 'Kundan Earrings'),
  (154, 3, 'Yellow Gold Earring', 'ER31', 'Gold', '18KT', 'Yellow Gold', 4.05, 4.05, 0.0, 'XMO2V0', 2530.28, 22780.28, 27949.4, 'Gold Earrings'),
  (155, 3, 'White Gold Earring', 'ER32', 'Gold', '22KT', 'White Gold', 6.04, 6.04, 0.0, 'Y0GV61', 4642.02, 42090.02, 51786.95, 'Gold Earrings'),
  (156, 3, 'White Gold Earring', 'ER33', 'Gold', '22KT', 'White Gold', 4.32, 4.32, 0.0, 'UMJQBP', 2210.32, 28994.32, 37630.47, 'Gold Earrings'),
  (157, 3, 'Rose Gold Earring', 'ER34', 'Gold', '22KT', 'Rose Gold', 8.07, 7.26, 0.81, 'XESO24', 6355.11, 51367.11, 61111.22, 'Kundan Earrings'),
  (158, 3, 'White Gold Earring', 'ER35', 'Gold', '18KT', 'White Gold', 13.48, 8.97, 4.51, 'D1LPE7', 4421.87, 49271.87, 61381.05, 'Kundan Earrings'),
  (159, 4, 'White Gold Bangle', 'BG01', 'Gold', '22KT', 'White Gold', 54.81, 48.73, 6.08, '74A4CU', 32360.79, 334486.79, 426913.37, 'Kundan Bangle'),
  (160, 4, 'White Gold Bangle', 'BG02', 'Gold', '18KT', 'White Gold', 29.65, 21.92, 7.73, '6TMYDU', 12435.18, 122035.18, 144662.87, 'Kundan Bangle'),
  (161, 4, 'White Gold Bangle', 'BG03', 'Gold', '22KT', 'White Gold', 25.5, 25.5, 0.0, 'KBSE7P', 23391.98, 181491.98, 220662.48, 'Plain Gold Bangle'),
  (162, 4, 'Yellow Gold Bangle', 'BG04', 'Gold', '18KT', 'Yellow Gold', 60.18, 60.18, 0.0, 'YGDNRJ', 39334.62, 340234.62, 437053.56, 'Plain Gold Bangle'),
  (163, 4, 'White Gold Bangle', 'BG05', 'Gold', '18KT', 'White Gold', 29.3, 18.68, 10.62, 'DDN8MX', 13828.64, 107228.64, 132451.04, 'Kundan Bangle'),
  (164, 4, 'Yellow Gold Bangle', 'BG06', 'Gold', '22KT', 'Yellow Gold', 75.88, 75.88, 0.0, 'VCC36P', 50166.99, 520622.99, 662656.42, 'Plain Gold Bangle'),
  (165, 4, 'Yellow Gold Bangle', 'BG07', 'Gold', '18KT', 'Yellow Gold', 22.4, 22.4, 0.0, '8XMF7L', 11096.75, 123096.75, 157567.3, 'Plain Gold Bangle'),
  (166, 4, 'White Gold Bangle', 'BG08', 'Gold', '18KT', 'White Gold', 77.92, 77.92, 0.0, '4SSF6M', 41046.0, 430646.0, 514784.97, 'Plain Gold Bangle'),
  (167, 4, 'Rose Gold Bangle', 'BG09', 'Gold', '22KT', 'Rose Gold', 37.28, 29.66, 7.62, 'KT5USS', 16255.52, 200147.52, 233216.76, 'Kundan Bangle'),
  (168, 4, 'Rose Gold Bangle', 'BG10', 'Gold', '18KT', 'Rose Gold', 51.8, 51.8, 0.0, 'JWQ3V3', 31388.58, 290388.58, 364411.04, 'Plain Gold Bangle'),
  (169, 4, 'Rose Gold Bangle', 'BG11', 'Gold', '22KT', 'Rose Gold', 76.88, 76.88, 0.0, 'BA6YU0', 55162.03, 531818.03, 624005.32, 'Plain Gold Bangle'),
  (170, 4, 'White Gold Bangle', 'BG12', 'Gold', '18KT', 'White Gold', 13.2, 10.42, 2.78, 'NWMZ3D', 7156.84, 59256.84, 76005.21, 'Kundan Bangle'),
  (171, 4, 'White Gold Bangle', 'BG13', 'Gold', '22KT', 'White Gold', 60.04, 60.04, 0.0, 'U71OI7', 34656.74, 406904.74, 524064.85, 'Plain Gold Bangle'),
  (172, 4, 'Yellow Gold Bangle', 'BG14', 'Gold', '18KT', 'Yellow Gold', 90.01, 78.07, 11.94, '69AL95', 42942.84, 433292.84, 522725.72, 'Kundan Bangle'),
  (173, 4, 'White Gold Bangle', 'BG15', 'Gold', '18KT', 'White Gold', 29.65, 29.65, 0.0, 'JYHWE5', 15537.32, 163787.32, 198231.78, 'Plain Gold Bangle'),
  (174, 4, 'Yellow Gold Bangle', 'BG16', 'Gold', '18KT', 'Yellow Gold', 74.86, 74.86, 0.0, 'I68UZG', 40547.42, 414847.42, 537313.09, 'Plain Gold Bangle'),
  (175, 4, 'White Gold Bangle', 'BG17', 'Gold', '22KT', 'White Gold', 58.94, 58.94, 0.0, 'N7VIGL', 42897.4, 408325.4, 489608.8, 'Plain Gold Bangle'),
  (176, 4, 'White Gold Bangle', 'BG18', 'Gold', '22KT', 'White Gold', 43.69, 43.69, 0.0, 'JQ9X7U', 38296.18, 309174.18, 381150.84, 'Plain Gold Bangle'),
  (177, 4, 'Yellow Gold Bangle', 'BG19', 'Gold', '18KT', 'Yellow Gold', 68.26, 60.63, 7.63, '61WJJX', 37419.83, 340569.83, 428219.22, 'Kundan Bangle'),
  (178, 4, 'White Gold Bangle', 'BG20', 'Gold', '18KT', 'White Gold', 75.33, 75.33, 0.0, 'ZGOF10', 34453.57, 411103.57, 498515.26, 'Plain Gold Bangle'),
  (179, 4, 'Rose Gold Bangle', 'BG21', 'Gold', '22KT', 'Rose Gold', 46.2, 36.03, 10.17, 'R35CVE', 26516.07, 249902.07, 288502.58, 'Kundan Bangle'),
  (180, 4, 'Yellow Gold Bangle', 'BG22', 'Gold', '18KT', 'Yellow Gold', 75.46, 65.71, 9.75, 'ZYZWIE', 43529.75, 372079.75, 431575.33, 'Kundan Bangle'),
  (181, 4, 'White Gold Bangle', 'BG23', 'Gold', '22KT', 'White Gold', 53.98, 45.35, 8.63, '7FGR6Z', 29639.49, 310809.49, 399740.95, 'Kundan Bangle'),
  (182, 4, 'Yellow Gold Bangle', 'BG24', 'Gold', '18KT', 'Yellow Gold', 19.6, 19.6, 0.0, 'HZ6LP7', 11792.08, 109792.08, 136640.66, 'Plain Gold Bangle'),
  (183, 4, 'Yellow Gold Bangle', 'BG25', 'Gold', '22KT', 'Yellow Gold', 10.11, 10.11, 0.0, 'Y45M5Q', 6376.56, 69058.56, 85396.88, 'Plain Gold Bangle'),
  (184, 4, 'Rose Gold Bangle', 'BG26', 'Gold', '22KT', 'Rose Gold', 48.89, 48.89, 0.0, 'M38B4J', 26330.12, 329448.12, 387309.97, 'Plain Gold Bangle'),
  (185, 4, 'Rose Gold Bangle', 'BG27', 'Gold', '18KT', 'Rose Gold', 17.59, 17.59, 0.0, 'VCUVQ4', 9939.92, 97889.92, 115515.22, 'Plain Gold Bangle'),
  (186, 4, 'Rose Gold Bangle', 'BG28', 'Gold', '18KT', 'Rose Gold', 67.39, 63.39, 4.0, 'Y39YPN', 32928.8, 349878.8, 449875.99, 'Kundan Bangle'),
  (187, 4, 'White Gold Bangle', 'BG29', 'Gold', '18KT', 'White Gold', 12.57, 12.57, 0.0, 'DUSXV4', 8941.07, 71791.07, 91050.5, 'Plain Gold Bangle'),
  (188, 4, 'Rose Gold Bangle', 'BG30', 'Gold', '18KT', 'Rose Gold', 33.93, 28.92, 5.01, 'SQCBFW', 17321.49, 161921.49, 209871.15, 'Kundan Bangle'),
  (189, 4, 'White Gold Bangle', 'BG31', 'Gold', '18KT', 'White Gold', 11.73, 11.73, 0.0, 'Y4NYFV', 5888.69, 64538.69, 79238.68, 'Plain Gold Bangle'),
  (190, 4, 'Yellow Gold Bangle', 'BG32', 'Gold', '22KT', 'Yellow Gold', 65.35, 58.97, 6.38, 'GUX7OH', 29360.15, 394974.15, 495519.34, 'Kundan Bangle'),
  (191, 4, 'Yellow Gold Bangle', 'BG33', 'Gold', '18KT', 'Yellow Gold', 43.26, 43.26, 0.0, 'AFOJQQ', 21452.83, 237752.83, 291159.29, 'Plain Gold Bangle'),
  (192, 4, 'White Gold Bangle', 'BG34', 'Gold', '22KT', 'White Gold', 74.74, 66.9, 7.84, 'DZLJOT', 46429.16, 461209.16, 568860.29, 'Kundan Bangle'),
  (193, 4, 'Rose Gold Bangle', 'BG35', 'Gold', '22KT', 'Rose Gold', 60.81, 60.81, 0.0, 'A8SOFO', 47047.89, 424069.89, 534366.25, 'Plain Gold Bangle'),
  (194, 4, 'Yellow Gold Bangle', 'BG36', 'Gold', '22KT', 'Yellow Gold', 74.77, 63.67, 11.1, 'I7GCU9', 44349.81, 439103.81, 564123.7, 'Kundan Bangle'),
  (195, 4, 'Yellow Gold Bangle', 'BG37', 'Gold', '22KT', 'Yellow Gold', 69.28, 63.17, 6.11, 'RGIVLA', 48424.08, 440078.08, 551502.41, 'Kundan Bangle'),
  (196, 4, 'White Gold Bangle', 'BG38', 'Gold', '22KT', 'White Gold', 30.22, 30.22, 0.0, 'DF4YI9', 26137.26, 213501.26, 272607.4, 'Plain Gold Bangle'),
  (197, 4, 'Rose Gold Bangle', 'BG39', 'Gold', '22KT', 'Rose Gold', 33.52, 33.52, 0.0, '3945OH', 22048.01, 229872.01, 291627.39, 'Plain Gold Bangle'),
  (198, 4, 'Rose Gold Bangle', 'BG40', 'Gold', '22KT', 'Rose Gold', 58.85, 58.85, 0.0, 'HFLEKI', 43605.37, 408475.37, 493919.13, 'Plain Gold Bangle'),
  (199, 4, 'Yellow Gold Bangle', 'BG41', 'Gold', '18KT', 'Yellow Gold', 21.02, 9.85, 11.17, 'OCJQTV', 7130.73, 56380.73, 70217.16, 'Kundan Bangle'),
  (200, 4, 'Yellow Gold Bangle', 'BG42', 'Gold', '22KT', 'Yellow Gold', 16.66, 12.8, 3.86, 'ENT1NE', 9812.31, 89172.31, 113456.19, 'Kundan Bangle');

INSERT INTO products (product_id, category_id, product_name, sku, metal_type, purity, color, gross_weight, net_weight, stone_weight, hallmark_code, making_charges, cost_price, selling_price, additional_info) VALUES
  (201, 4, 'White Gold Bangle', 'BG43', 'Gold', '22KT', 'White Gold', 78.32, 75.16, 3.16, '5U3HVT', 56187.03, 522179.03, 659438.49, 'Kundan Bangle'),
  (202, 4, 'Yellow Gold Bangle', 'BG44', 'Gold', '22KT', 'Yellow Gold', 67.29, 63.97, 3.32, 'QQP4YU', 36215.41, 432829.41, 512989.61, 'Kundan Bangle'),
  (203, 4, 'White Gold Bangle', 'BG45', 'Gold', '22KT', 'White Gold', 47.98, 47.98, 0.0, '7NLIHF', 39156.88, 336632.88, 398832.48, 'Plain Gold Bangle'),
  (204, 4, 'White Gold Bangle', 'BG46', 'Gold', '18KT', 'White Gold', 30.47, 26.75, 3.72, '9GFWWG', 11135.03, 144885.03, 187471.44, 'Kundan Bangle'),
  (205, 4, 'Yellow Gold Bangle', 'BG47', 'Gold', '22KT', 'Yellow Gold', 19.51, 19.51, 0.0, 'LWH1SP', 12833.73, 133795.73, 173346.34, 'Plain Gold Bangle'),
  (206, 4, 'White Gold Bangle', 'BG48', 'Gold', '22KT', 'White Gold', 21.22, 17.99, 3.23, 'WNXYXR', 13337.2, 124875.2, 154276.55, 'Kundan Bangle'),
  (207, 4, 'Rose Gold Bangle', 'BG49', 'Gold', '18KT', 'Rose Gold', 29.43, 20.97, 8.46, 'M9Q5OA', 10502.06, 115352.06, 139549.53, 'Kundan Bangle'),
  (208, 4, 'Rose Gold Bangle', 'BG50', 'Gold', '22KT', 'Rose Gold', 40.93, 39.74, 1.19, '40IA1E', 30678.82, 277066.82, 341481.8, 'Kundan Bangle'),
  (209, 4, 'Rose Gold Bangle', 'BG51', 'Gold', '18KT', 'Rose Gold', 65.96, 62.64, 3.32, '712237', 43048.51, 356248.51, 426802.77, 'Kundan Bangle'),
  (210, 4, 'Rose Gold Bangle', 'BG52', 'Gold', '18KT', 'Rose Gold', 17.79, 17.79, 0.0, 'DZI5CQ', 10183.79, 99133.79, 114567.0, 'Plain Gold Bangle'),
  (211, 4, 'Yellow Gold Bangle', 'BG53', 'Gold', '18KT', 'Yellow Gold', 57.84, 54.49, 3.35, '7YCK2I', 27836.4, 300286.4, 379051.84, 'Kundan Bangle'),
  (212, 4, 'White Gold Bangle', 'BG54', 'Gold', '22KT', 'White Gold', 64.19, 62.58, 1.61, 'BOV1FW', 34076.79, 422072.79, 497749.48, 'Kundan Bangle'),
  (213, 4, 'Yellow Gold Bangle', 'BG55', 'Gold', '22KT', 'Yellow Gold', 26.88, 26.88, 0.0, 'LZCUO5', 14157.86, 180813.86, 223211.48, 'Plain Gold Bangle'),
  (214, 4, 'Rose Gold Bangle', 'BG56', 'Gold', '22KT', 'Rose Gold', 70.05, 70.05, 0.0, '1IH0TK', 40571.26, 474881.26, 562091.91, 'Plain Gold Bangle'),
  (215, 4, 'Rose Gold Bangle', 'BG57', 'Gold', '22KT', 'Rose Gold', 18.04, 16.09, 1.95, 'ZOMTY1', 13473.93, 113231.93, 135258.82, 'Kundan Bangle'),
  (216, 4, 'Rose Gold Bangle', 'BG58', 'Gold', '22KT', 'Rose Gold', 86.95, 76.28, 10.67, '45GPYO', 42976.58, 515912.58, 642613.51, 'Kundan Bangle'),
  (217, 4, 'Rose Gold Bangle', 'BG59', 'Gold', '18KT', 'Rose Gold', 44.75, 38.46, 6.29, '7ZHMRJ', 15892.09, 208192.09, 259824.68, 'Kundan Bangle'),
  (218, 4, 'White Gold Bangle', 'BG60', 'Gold', '22KT', 'White Gold', 15.8, 15.8, 0.0, 'RM6FID', 8312.04, 106272.04, 129753.6, 'Plain Gold Bangle'),
  (219, 4, 'Yellow Gold Bangle', 'BG61', 'Gold', '22KT', 'Yellow Gold', 64.24, 64.24, 0.0, 'GCQRSE', 47934.23, 446222.23, 526521.99, 'Plain Gold Bangle'),
  (220, 4, 'Yellow Gold Bangle', 'BG62', 'Gold', '22KT', 'Yellow Gold', 40.21, 39.69, 0.52, '3E3EOP', 32126.45, 278204.45, 358759.78, 'Kundan Bangle'),
  (221, 4, 'Yellow Gold Bangle', 'BG63', 'Gold', '18KT', 'Yellow Gold', 49.84, 49.84, 0.0, 'UGGMHB', 33052.71, 282252.71, 360759.43, 'Plain Gold Bangle'),
  (222, 4, 'Yellow Gold Bangle', 'BG64', 'Gold', '18KT', 'Yellow Gold', 63.35, 56.85, 6.5, 'UAVRGX', 38231.98, 322481.98, 387787.11, 'Kundan Bangle'),
  (223, 4, 'Yellow Gold Bangle', 'BG65', 'Gold', '18KT', 'Yellow Gold', 57.36, 49.05, 8.31, 'JGKJ57', 21134.9, 266384.9, 306774.95, 'Kundan Bangle'),
  (224, 5, 'Yellow Gold Bracelet', 'BR01', 'Gold', '18KT', 'Yellow Gold', 27.66, 25.65, 2.01, 'SBB3O9', 11049.6, 139299.6, 179944.4, 'Designer Bracelet'),
  (225, 5, 'Rose Gold Bracelet', 'BR02', 'Gold', '22KT', 'Rose Gold', 13.75, 13.75, 0.0, 'NRVG67', 10747.48, 95997.48, 115171.41, 'Designer Bracelet'),
  (226, 5, 'Yellow Gold Bracelet', 'BR03', 'Gold', '22KT', 'Yellow Gold', 11.41, 11.41, 0.0, 'WXUZXK', 8926.55, 79668.55, 100740.77, 'Designer Bracelet'),
  (227, 5, 'Yellow Gold Bracelet', 'BR04', 'Gold', '22KT', 'Yellow Gold', 14.04, 14.04, 0.0, '90XCLK', 11585.8, 98633.8, 114764.86, 'Designer Bracelet'),
  (228, 5, 'White Gold Bracelet', 'BR05', 'Gold', '22KT', 'White Gold', 25.65, 25.65, 0.0, 'JDFWAN', 23403.71, 182433.71, 216161.49, 'Designer Bracelet'),
  (229, 5, 'Yellow Gold Bracelet', 'BR06', 'Gold', '22KT', 'Yellow Gold', 14.83, 13.5, 1.33, 'GUD2LJ', 7875.82, 91575.82, 107167.57, 'Designer Bracelet'),
  (230, 5, 'White Gold Bracelet', 'BR07', 'Gold', '22KT', 'White Gold', 15.06, 15.06, 0.0, '89ZA7S', 13022.86, 106394.86, 128728.23, 'Designer Bracelet'),
  (231, 5, 'White Gold Bracelet', 'BR08', 'Gold', '18KT', 'White Gold', 8.08, 8.08, 0.0, 'S2HB5R', 3894.73, 44294.73, 57068.87, 'Designer Bracelet'),
  (232, 5, 'Rose Gold Bracelet', 'BR09', 'Gold', '22KT', 'Rose Gold', 26.52, 25.95, 0.57, 'HYPSIP', 19007.07, 179897.07, 232108.31, 'Designer Bracelet'),
  (233, 5, 'White Gold Bracelet', 'BR10', 'Gold', '22KT', 'White Gold', 21.41, 21.41, 0.0, 'DEINAT', 16605.22, 149347.22, 189762.21, 'Designer Bracelet'),
  (234, 5, 'Rose Gold Bracelet', 'BR11', 'Gold', '18KT', 'Rose Gold', 12.74, 12.74, 0.0, 'UQF058', 8412.29, 72112.29, 85053.41, 'Designer Bracelet'),
  (235, 5, 'Rose Gold Bracelet', 'BR12', 'Gold', '18KT', 'Rose Gold', 7.5, 7.5, 0.0, 'QWE1L8', 4654.17, 42154.17, 49395.57, 'Designer Bracelet'),
  (236, 5, 'White Gold Bracelet', 'BR13', 'Gold', '22KT', 'White Gold', 27.65, 26.38, 1.27, '5ZVA6S', 19343.81, 182899.81, 235671.45, 'Designer Bracelet'),
  (237, 5, 'Yellow Gold Bracelet', 'BR14', 'Gold', '22KT', 'Yellow Gold', 17.98, 17.98, 0.0, 'CI7LHS', 9666.13, 121142.13, 150683.93, 'Designer Bracelet'),
  (238, 5, 'White Gold Bracelet', 'BR15', 'Gold', '22KT', 'White Gold', 20.28, 20.28, 0.0, '9TWB97', 18693.35, 144429.35, 185930.14, 'Designer Bracelet'),
  (239, 5, 'Rose Gold Bracelet', 'BR16', 'Gold', '18KT', 'Rose Gold', 10.87, 10.87, 0.0, 'W032EB', 7417.55, 61767.55, 72750.19, 'Designer Bracelet'),
  (240, 5, 'Yellow Gold Bracelet', 'BR17', 'Gold', '22KT', 'Yellow Gold', 7.73, 6.11, 1.62, 'ET21V9', 5356.97, 43238.97, 51184.11, 'Designer Bracelet'),
  (241, 5, 'Yellow Gold Bracelet', 'BR18', 'Gold', '18KT', 'Yellow Gold', 22.52, 22.52, 0.0, '4DCBTV', 11761.38, 124361.38, 155984.16, 'Designer Bracelet'),
  (242, 5, 'Rose Gold Bracelet', 'BR19', 'Gold', '18KT', 'Rose Gold', 30.1, 27.68, 2.42, '7EQ0XQ', 20512.93, 158912.93, 206316.83, 'Designer Bracelet'),
  (243, 5, 'White Gold Bracelet', 'BR20', 'Gold', '22KT', 'White Gold', 19.6, 19.6, 0.0, '7P9L5H', 14151.02, 135671.02, 175152.0, 'Designer Bracelet'),
  (244, 5, 'White Gold Bracelet', 'BR21', 'Gold', '18KT', 'White Gold', 13.93, 13.93, 0.0, '811OZG', 7369.68, 77019.68, 98688.2, 'Designer Bracelet'),
  (245, 5, 'White Gold Bracelet', 'BR22', 'Gold', '18KT', 'White Gold', 12.88, 12.88, 0.0, 'LN8KPP', 8503.78, 72903.78, 94404.0, 'Designer Bracelet'),
  (246, 5, 'Rose Gold Bracelet', 'BR23', 'Gold', '22KT', 'Rose Gold', 4.17, 4.17, 0.0, 'HFYI7U', 3805.72, 29659.72, 37682.43, 'Designer Bracelet'),
  (247, 5, 'Yellow Gold Bracelet', 'BR24', 'Gold', '18KT', 'Yellow Gold', 28.89, 28.89, 0.0, 'N8VYBS', 20659.48, 165109.48, 199808.11, 'Designer Bracelet'),
  (248, 5, 'Rose Gold Bracelet', 'BR25', 'Gold', '18KT', 'Rose Gold', 28.94, 28.94, 0.0, 'D98C44', 16811.82, 161511.82, 192176.4, 'Designer Bracelet'),
  (249, 6, 'Yellow Gold Necklace Set', 'NS01', 'Gold', '18KT', 'Yellow Gold', 148.94, 129.91, 19.03, 'VSBN55', 70769.15, 720319.15, 856242.61, 'Bridal'),
  (250, 6, 'Yellow Gold Necklace Set', 'NS02', 'Gold', '22KT', 'Yellow Gold', 130.97, 130.97, 0.0, 'LK624A', 83647.43, 895661.43, 1052488.89, 'Temple');

INSERT INTO products (product_id, category_id, product_name, sku, metal_type, purity, color, gross_weight, net_weight, stone_weight, hallmark_code, making_charges, cost_price, selling_price, additional_info) VALUES
  (251, 6, 'Yellow Gold Necklace Set', 'NS03', 'Gold', '22KT', 'Yellow Gold', 82.48, 82.48, 0.0, 'I9G893', 74665.92, 586041.92, 692735.25, 'Temple'),
  (252, 6, 'Yellow Gold Necklace Set', 'NS04', 'Gold', '18KT', 'Yellow Gold', 60.13, 34.07, 26.06, '7QVH4R', 24545.1, 194895.1, 239669.18, 'Polki'),
  (253, 6, 'Yellow Gold Necklace Set', 'NS05', 'Gold', '22KT', 'Yellow Gold', 172.84, 172.84, 0.0, 'NV8RJJ', 139502.51, 1211110.51, 1520496.28, 'Antique'),
  (254, 6, 'Yellow Gold Necklace Set', 'NS06', 'Gold', '22KT', 'Yellow Gold', 78.94, 58.94, 20.0, 'GQ6SB5', 33942.11, 399370.11, 471664.49, 'Polki'),
  (255, 6, 'Yellow Gold Necklace Set', 'NS07', 'Gold', '18KT', 'Yellow Gold', 155.7, 136.86, 18.84, '6QL79D', 96902.29, 781202.29, 960727.35, 'Polki'),
  (256, 6, 'Yellow Gold Necklace Set', 'NS08', 'Gold', '18KT', 'Yellow Gold', 28.39, 28.39, 0.0, 'YXLJ6Y', 14596.85, 156546.85, 196977.01, 'Temple'),
  (257, 6, 'Yellow Gold Necklace Set', 'NS09', 'Gold', '18KT', 'Yellow Gold', 147.44, 147.44, 0.0, '1ZSJ27', 66126.23, 803326.23, 1031632.0, 'Temple'),
  (258, 6, 'Yellow Gold Necklace Set', 'NS10', 'Gold', '18KT', 'Yellow Gold', 39.69, 39.69, 0.0, 'HPEYQW', 16048.73, 214498.73, 259299.46, 'Temple'),
  (259, 6, 'Yellow Gold Necklace Set', 'NS11', 'Gold', '18KT', 'Yellow Gold', 85.08, 85.08, 0.0, '6V4ORK', 60087.47, 485487.47, 631057.97, 'Temple'),
  (260, 6, 'Yellow Gold Necklace Set', 'NS12', 'Gold', '18KT', 'Yellow Gold', 42.6, 24.86, 17.74, 'S9S77A', 14537.87, 138837.87, 175441.6, 'Polki'),
  (261, 6, 'Yellow Gold Necklace Set', 'NS13', 'Gold', '22KT', 'Yellow Gold', 134.2, 134.2, 0.0, '2ZACZE', 70761.55, 902801.55, 1162572.81, 'Plain Gold'),
  (262, 6, 'Yellow Gold Necklace Set', 'NS14', 'Gold', '22KT', 'Yellow Gold', 37.81, 21.49, 16.32, 'FVVMGY', 12659.57, 145897.57, 179603.03, 'Polki'),
  (263, 6, 'Yellow Gold Necklace Set', 'NS15', 'Gold', '22KT', 'Yellow Gold', 41.07, 27.7, 13.37, 'RKH6S5', 25161.58, 196901.58, 242539.49, 'Kundan'),
  (264, 6, 'Yellow Gold Necklace Set', 'NS16', 'Gold', '18KT', 'Yellow Gold', 56.54, 56.54, 0.0, 'WXB118', 30602.27, 313302.27, 383310.51, 'Plain Gold'),
  (265, 6, 'Yellow Gold Necklace Set', 'NS17', 'Gold', '18KT', 'Yellow Gold', 165.83, 165.83, 0.0, 'D0H1P7', 112835.86, 941985.86, 1156996.26, 'Antique'),
  (266, 6, 'Yellow Gold Necklace Set', 'NS18', 'Gold', '22KT', 'Yellow Gold', 162.06, 162.06, 0.0, 'E1U6DS', 102803.8, 1107575.8, 1324953.03, 'Plain Gold'),
  (267, 6, 'Yellow Gold Necklace Set', 'NS19', 'Gold', '18KT', 'Yellow Gold', 157.37, 157.37, 0.0, 'MT58G7', 94724.29, 881574.29, 1068550.22, 'Temple'),
  (268, 6, 'Yellow Gold Necklace Set', 'NS20', 'Gold', '22KT', 'Yellow Gold', 112.07, 112.07, 0.0, 'O7DR55', 70704.88, 765538.88, 926555.03, 'Plain Gold'),
  (269, 6, 'Yellow Gold Necklace Set', 'NS21', 'Gold', '18KT', 'Yellow Gold', 147.43, 147.43, 0.0, 'SZKU83', 64298.0, 801448.0, 942688.6, 'Antique'),
  (270, 6, 'Yellow Gold Necklace Set', 'NS22', 'Gold', '18KT', 'Yellow Gold', 144.05, 144.05, 0.0, 'ZKUZ6A', 88413.67, 808663.67, 954284.62, 'Antique'),
  (271, 6, 'Yellow Gold Necklace Set', 'NS23', 'Gold', '22KT', 'Yellow Gold', 30.35, 30.35, 0.0, '0S8N4D', 20759.34, 208929.34, 248246.83, 'Plain Gold'),
  (272, 6, 'Yellow Gold Necklace Set', 'NS24', 'Gold', '18KT', 'Yellow Gold', 24.03, 24.03, 0.0, 'QF6CT4', 13387.8, 133537.8, 161828.86, 'Plain Gold'),
  (273, 6, 'Yellow Gold Necklace Set', 'NS25', 'Gold', '22KT', 'Yellow Gold', 119.91, 119.91, 0.0, 'XBULXK', 81458.61, 824900.61, 1007685.13, 'Temple'),
  (274, 6, 'Yellow Gold Necklace Set', 'NS26', 'Gold', '22KT', 'Yellow Gold', 162.94, 162.94, 0.0, 'INGENS', 99631.68, 1109859.68, 1310602.8, 'Antique'),
  (275, 6, 'Yellow Gold Necklace Set', 'NS27', 'Gold', '18KT', 'Yellow Gold', 157.6, 151.45, 6.15, '6EYHXA', 93803.91, 851053.91, 998355.15, 'Kundan'),
  (276, 6, 'Yellow Gold Necklace Set', 'NS28', 'Gold', '18KT', 'Yellow Gold', 165.91, 165.91, 0.0, '3M0W1Z', 73878.94, 903428.94, 1136369.66, 'Temple'),
  (277, 6, 'Yellow Gold Necklace Set', 'NS29', 'Gold', '22KT', 'Yellow Gold', 76.5, 71.38, 5.12, 'NVBZFJ', 54944.05, 497500.05, 644090.28, 'Bridal'),
  (278, 6, 'Yellow Gold Necklace Set', 'NS30', 'Gold', '18KT', 'Yellow Gold', 134.77, 123.61, 11.16, 'PL3JH3', 65490.43, 683540.43, 813614.25, 'Polki'),
  (279, 6, 'Yellow Gold Necklace Set', 'NS31', 'Gold', '22KT', 'Yellow Gold', 29.84, 29.84, 0.0, '4WL13Y', 18245.95, 203253.95, 251044.13, 'Plain Gold'),
  (280, 6, 'Yellow Gold Necklace Set', 'NS32', 'Gold', '18KT', 'Yellow Gold', 132.7, 132.7, 0.0, '6Q3QZC', 92116.0, 755616.0, 903959.94, 'Temple'),
  (281, 6, 'Yellow Gold Necklace Set', 'NS33', 'Gold', '18KT', 'Yellow Gold', 206.28, 172.47, 33.81, '0DQGVO', 121495.21, 983845.21, 1142053.16, 'Polki'),
  (282, 6, 'Yellow Gold Necklace Set', 'NS34', 'Gold', '18KT', 'Yellow Gold', 129.13, 129.13, 0.0, '3LRX44', 64835.84, 710485.84, 855724.6, 'Plain Gold'),
  (283, 6, 'Yellow Gold Necklace Set', 'NS35', 'Gold', '18KT', 'Yellow Gold', 62.09, 28.81, 33.28, '28I958', 19832.56, 163882.56, 211484.43, 'Kundan');

-- ============================================================
-- INVENTORY
-- ============================================================
INSERT INTO inventory (product_id, quantity_in_stock, reorder_level, last_restocked) VALUES
  (1, 2, 3, '2026-06-09'),
  (2, 6, 5, '2026-02-24'),
  (3, 2, 10, '2026-06-18'),
  (4, 1, 8, '2026-04-02'),
  (5, 0, 3, NULL),
  (6, 5, 5, '2026-05-20'),
  (7, 0, 8, NULL),
  (8, 5, 10, '2026-06-23'),
  (9, 20, 5, '2026-04-19'),
  (10, 7, 3, '2026-02-23'),
  (11, 20, 5, '2026-03-05'),
  (12, 5, 5, '2026-01-03'),
  (13, 15, 3, '2026-03-28'),
  (14, 12, 8, '2026-03-26'),
  (15, 0, 10, NULL),
  (16, 25, 8, '2026-01-13'),
  (17, 1, 8, '2026-03-27'),
  (18, 12, 8, '2026-02-23'),
  (19, 1, 3, '2026-06-08'),
  (20, 8, 3, '2026-02-28'),
  (21, 2, 5, '2026-03-15'),
  (22, 12, 5, '2026-03-12'),
  (23, 5, 10, '2026-03-23'),
  (24, 1, 8, '2026-06-06'),
  (25, 6, 5, '2026-04-13'),
  (26, 7, 10, '2026-06-18'),
  (27, 6, 10, '2026-03-27'),
  (28, 0, 5, NULL),
  (29, 0, 5, NULL),
  (30, 15, 5, '2026-01-07'),
  (31, 10, 5, '2026-06-16'),
  (32, 15, 10, '2026-04-05'),
  (33, 7, 5, '2026-02-24'),
  (34, 7, 10, '2026-05-14'),
  (35, 15, 5, '2026-02-05'),
  (36, 30, 3, '2026-01-28'),
  (37, 2, 5, '2026-06-06'),
  (38, 20, 8, '2026-01-13'),
  (39, 15, 8, '2026-04-17'),
  (40, 7, 8, '2026-01-22'),
  (41, 2, 10, '2026-05-25'),
  (42, 7, 10, '2026-03-04'),
  (43, 8, 5, '2026-02-15'),
  (44, 0, 10, NULL),
  (45, 7, 8, '2026-02-17'),
  (46, 2, 10, '2026-03-27'),
  (47, 5, 5, '2026-03-25'),
  (48, 4, 8, '2026-05-01'),
  (49, 10, 5, '2026-01-04'),
  (50, 12, 5, '2026-02-02');

INSERT INTO inventory (product_id, quantity_in_stock, reorder_level, last_restocked) VALUES
  (51, 6, 8, '2026-01-03'),
  (52, 30, 3, '2026-05-25'),
  (53, 3, 5, '2026-06-16'),
  (54, 4, 5, '2026-05-28'),
  (55, 20, 5, '2026-05-25'),
  (56, 5, 10, '2026-03-13'),
  (57, 12, 5, '2026-05-15'),
  (58, 2, 5, '2026-02-03'),
  (59, 10, 3, '2026-05-18'),
  (60, 6, 8, '2026-02-01'),
  (61, 1, 10, '2026-06-02'),
  (62, 6, 3, '2026-01-28'),
  (63, 10, 3, '2026-05-08'),
  (64, 7, 10, '2026-04-07'),
  (65, 3, 10, '2026-05-19'),
  (66, 30, 5, '2026-04-26'),
  (67, 20, 5, '2026-01-04'),
  (68, 20, 5, '2026-04-14'),
  (69, 25, 10, '2026-01-22'),
  (70, 2, 3, '2026-04-24'),
  (71, 10, 3, '2026-02-07'),
  (72, 5, 8, '2026-04-05'),
  (73, 20, 5, '2026-03-15'),
  (74, 6, 3, '2026-04-26'),
  (75, 2, 3, '2026-06-18'),
  (76, 0, 3, NULL),
  (77, 6, 5, '2026-04-16'),
  (78, 30, 5, '2026-04-02'),
  (79, 4, 5, '2026-01-13'),
  (80, 7, 5, '2026-03-14'),
  (81, 30, 5, '2026-02-10'),
  (82, 5, 3, '2026-05-24'),
  (83, 0, 10, NULL),
  (84, 10, 3, '2026-01-19'),
  (85, 30, 8, '2026-05-06'),
  (86, 0, 8, NULL),
  (87, 1, 5, '2026-01-20'),
  (88, 1, 10, '2026-02-13'),
  (89, 2, 8, '2026-02-19'),
  (90, 0, 8, NULL),
  (91, 1, 5, '2026-06-19'),
  (92, 10, 5, '2026-02-22'),
  (93, 10, 5, '2026-03-13'),
  (94, 3, 10, '2026-06-10'),
  (95, 25, 5, '2026-01-01'),
  (96, 25, 8, '2026-05-04'),
  (97, 1, 8, '2026-02-17'),
  (98, 7, 5, '2026-03-03'),
  (99, 6, 5, '2026-03-06'),
  (100, 25, 8, '2026-06-10');

INSERT INTO inventory (product_id, quantity_in_stock, reorder_level, last_restocked) VALUES
  (101, 0, 10, NULL),
  (102, 8, 10, '2026-01-05'),
  (103, 7, 3, '2026-01-24'),
  (104, 3, 5, '2026-03-20'),
  (105, 5, 10, '2026-03-07'),
  (106, 7, 8, '2026-04-09'),
  (107, 0, 3, NULL),
  (108, 20, 5, '2026-01-01'),
  (109, 10, 5, '2026-06-09'),
  (110, 4, 10, '2026-04-18'),
  (111, 20, 8, '2026-01-04'),
  (112, 1, 10, '2026-02-18'),
  (113, 0, 5, NULL),
  (114, 3, 5, '2026-02-02'),
  (115, 8, 5, '2026-01-12'),
  (116, 5, 10, '2026-02-22'),
  (117, 2, 5, '2026-05-28'),
  (118, 20, 8, '2026-06-05'),
  (119, 6, 5, '2026-02-14'),
  (120, 0, 5, NULL),
  (121, 10, 5, '2026-06-28'),
  (122, 6, 5, '2026-02-26'),
  (123, 2, 5, '2026-01-28'),
  (124, 30, 5, '2026-02-27'),
  (125, 25, 5, '2026-03-27'),
  (126, 6, 5, '2026-01-22'),
  (127, 5, 5, '2026-03-09'),
  (128, 1, 5, '2026-03-21'),
  (129, 15, 10, '2026-05-11'),
  (130, 0, 3, NULL),
  (131, 7, 5, '2026-05-09'),
  (132, 0, 3, NULL),
  (133, 20, 5, '2026-06-26'),
  (134, 10, 5, '2026-05-17'),
  (135, 2, 5, '2026-05-07'),
  (136, 7, 3, '2026-06-14'),
  (137, 0, 8, NULL),
  (138, 5, 5, '2026-04-03'),
  (139, 10, 8, '2026-03-22'),
  (140, 2, 10, '2026-03-17'),
  (141, 8, 10, '2026-04-11'),
  (142, 15, 10, '2026-03-18'),
  (143, 3, 5, '2026-04-22'),
  (144, 15, 10, '2026-06-06'),
  (145, 8, 5, '2026-05-27'),
  (146, 0, 5, NULL),
  (147, 8, 5, '2026-04-26'),
  (148, 10, 5, '2026-04-15'),
  (149, 5, 8, '2026-04-26'),
  (150, 4, 10, '2026-01-10');

INSERT INTO inventory (product_id, quantity_in_stock, reorder_level, last_restocked) VALUES
  (151, 10, 3, '2026-02-22'),
  (152, 8, 5, '2026-02-05'),
  (153, 0, 3, NULL),
  (154, 6, 5, '2026-05-28'),
  (155, 1, 5, '2026-04-21'),
  (156, 5, 10, '2026-06-13'),
  (157, 30, 5, '2026-02-05'),
  (158, 0, 3, NULL),
  (159, 20, 5, '2026-02-26'),
  (160, 25, 3, '2026-05-08'),
  (161, 2, 5, '2026-02-26'),
  (162, 25, 10, '2026-05-18'),
  (163, 10, 5, '2026-05-27'),
  (164, 20, 8, '2026-04-06'),
  (165, 30, 5, '2026-03-25'),
  (166, 6, 10, '2026-03-25'),
  (167, 30, 10, '2026-02-09'),
  (168, 25, 3, '2026-06-10'),
  (169, 6, 5, '2026-03-11'),
  (170, 1, 5, '2026-02-08'),
  (171, 15, 10, '2026-02-23'),
  (172, 5, 3, '2026-04-14'),
  (173, 10, 8, '2026-04-14'),
  (174, 0, 5, NULL),
  (175, 20, 5, '2026-05-23'),
  (176, 0, 8, NULL),
  (177, 15, 5, '2026-01-12'),
  (178, 8, 5, '2026-04-18'),
  (179, 6, 5, '2026-02-09'),
  (180, 20, 5, '2026-01-13'),
  (181, 10, 10, '2026-06-26'),
  (182, 15, 10, '2026-02-27'),
  (183, 25, 5, '2026-05-18'),
  (184, 0, 5, NULL),
  (185, 0, 3, NULL),
  (186, 20, 5, '2026-04-06'),
  (187, 0, 5, NULL),
  (188, 15, 5, '2026-02-15'),
  (189, 10, 5, '2026-04-09'),
  (190, 20, 5, '2026-01-16'),
  (191, 0, 10, NULL),
  (192, 0, 5, NULL),
  (193, 6, 10, '2026-01-25'),
  (194, 0, 3, NULL),
  (195, 6, 5, '2026-01-20'),
  (196, 3, 5, '2026-02-16'),
  (197, 2, 8, '2026-02-15'),
  (198, 7, 5, '2026-02-20'),
  (199, 2, 5, '2026-03-04'),
  (200, 0, 5, NULL);

INSERT INTO inventory (product_id, quantity_in_stock, reorder_level, last_restocked) VALUES
  (201, 15, 5, '2026-06-07'),
  (202, 1, 8, '2026-06-27'),
  (203, 6, 3, '2026-06-25'),
  (204, 8, 10, '2026-05-26'),
  (205, 2, 8, '2026-01-12'),
  (206, 20, 10, '2026-03-03'),
  (207, 10, 3, '2026-04-27'),
  (208, 30, 3, '2026-04-12'),
  (209, 25, 10, '2026-02-14'),
  (210, 4, 10, '2026-05-21'),
  (211, 7, 8, '2026-05-25'),
  (212, 30, 5, '2026-04-27'),
  (213, 7, 5, '2026-02-27'),
  (214, 1, 5, '2026-04-08'),
  (215, 25, 8, '2026-05-22'),
  (216, 15, 5, '2026-01-16'),
  (217, 10, 5, '2026-04-07'),
  (218, 12, 5, '2026-03-09'),
  (219, 7, 8, '2026-01-17'),
  (220, 5, 3, '2026-02-24'),
  (221, 20, 5, '2026-05-25'),
  (222, 6, 10, '2026-04-21'),
  (223, 30, 5, '2026-01-03'),
  (224, 8, 5, '2026-04-23'),
  (225, 6, 5, '2026-06-19'),
  (226, 12, 5, '2026-05-17'),
  (227, 12, 5, '2026-06-18'),
  (228, 10, 5, '2026-06-15'),
  (229, 7, 5, '2026-03-08'),
  (230, 2, 10, '2026-02-11'),
  (231, 2, 10, '2026-05-25'),
  (232, 4, 5, '2026-02-24'),
  (233, 30, 5, '2026-06-19'),
  (234, 8, 3, '2026-02-10'),
  (235, 6, 5, '2026-02-10'),
  (236, 0, 10, NULL),
  (237, 3, 5, '2026-01-02'),
  (238, 8, 10, '2026-02-21'),
  (239, 30, 3, '2026-01-19'),
  (240, 8, 5, '2026-04-15'),
  (241, 10, 5, '2026-01-09'),
  (242, 30, 3, '2026-01-13'),
  (243, 30, 3, '2026-05-21'),
  (244, 0, 5, NULL),
  (245, 3, 8, '2026-03-03'),
  (246, 6, 3, '2026-05-25'),
  (247, 20, 8, '2026-05-26'),
  (248, 6, 8, '2026-04-15'),
  (249, 25, 5, '2026-05-14'),
  (250, 8, 8, '2026-05-02');

INSERT INTO inventory (product_id, quantity_in_stock, reorder_level, last_restocked) VALUES
  (251, 2, 5, '2026-06-07'),
  (252, 7, 10, '2026-01-06'),
  (253, 6, 5, '2026-05-03'),
  (254, 4, 3, '2026-04-15'),
  (255, 30, 5, '2026-01-08'),
  (256, 8, 10, '2026-03-23'),
  (257, 25, 3, '2026-06-08'),
  (258, 7, 10, '2026-05-22'),
  (259, 5, 5, '2026-01-18'),
  (260, 6, 10, '2026-02-09'),
  (261, 3, 3, '2026-01-06'),
  (262, 8, 8, '2026-06-27'),
  (263, 8, 5, '2026-01-15'),
  (264, 8, 10, '2026-04-09'),
  (265, 30, 5, '2026-01-20'),
  (266, 0, 5, NULL),
  (267, 10, 8, '2026-03-01'),
  (268, 1, 5, '2026-06-27'),
  (269, 0, 10, NULL),
  (270, 7, 8, '2026-01-25'),
  (271, 4, 5, '2026-05-21'),
  (272, 25, 5, '2026-02-19'),
  (273, 20, 10, '2026-04-03'),
  (274, 30, 5, '2026-04-11'),
  (275, 10, 10, '2026-01-28'),
  (276, 4, 5, '2026-04-23'),
  (277, 30, 5, '2026-06-13'),
  (278, 0, 5, NULL),
  (279, 1, 5, '2026-03-11'),
  (280, 2, 5, '2026-05-27'),
  (281, 0, 10, NULL),
  (282, 25, 5, '2026-01-07'),
  (283, 12, 8, '2026-04-21');

-- ============================================================
-- CUSTOMERS
-- ============================================================
INSERT INTO customers (customer_id, customer_code, customer_name, phone, city, state, address, gender, customer_since, customer_type) VALUES
  (1, 'CUST0001', 'Rohit Bansal', '9229909354', 'Jaipur', 'Rajasthan', '591, Raja Park, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (2, 'CUST0002', 'Sneha Verma', '9629361773', 'Jaipur', 'Rajasthan', '508, C-Scheme, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (3, 'CUST0003', 'Ananya Verma', '9284542079', 'Jaipur', 'Rajasthan', '127, Vaishali Nagar, Jaipur', 'Male', '2026-01-01', 'Regular'),
  (4, 'CUST0004', 'Rohit Soni', '9878044780', 'Jaipur', 'Rajasthan', '624, Bani Park, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (5, 'CUST0005', 'Harsh Gupta', '9449288806', 'Jaipur', 'Rajasthan', '641, Jagatpura, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (6, 'CUST0006', 'Simran Arora', '9896720518', 'Jaipur', 'Rajasthan', '178, Malviya Nagar, Jaipur', 'Female', '2026-01-01', 'Regular'),
  (7, 'CUST0007', 'Ananya Singh', '9036854925', 'Jaipur', 'Rajasthan', '182, Mansarovar, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (8, 'CUST0008', 'Arjun Singh', '9446398737', 'Jaipur', 'Rajasthan', '619, Jagatpura, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (9, 'CUST0009', 'Manav Jain', '9649987676', 'Jaipur', 'Rajasthan', '166, Tonk Road, Jaipur', 'Male', '2025-01-01', 'Regular'),
  (10, 'CUST0010', 'Yash Singh', '9594074661', 'Jaipur', 'Rajasthan', '675, Pratap Nagar, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (11, 'CUST0011', 'Yash Goyal', '9426182248', 'Jaipur', 'Rajasthan', '397, C-Scheme, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (12, 'CUST0012', 'Divya Mathur', '9553779956', 'Jaipur', 'Rajasthan', '855, Pratap Nagar, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (13, 'CUST0013', 'Arjun Choudhary', '9650340492', 'Jaipur', 'Rajasthan', '86, Jagatpura, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (14, 'CUST0014', 'Divya Gupta', '9927819939', 'Jaipur', 'Rajasthan', '911, Mansarovar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (15, 'CUST0015', 'Meera Sharma', '9971379919', 'Jaipur', 'Rajasthan', '336, Shyam Nagar, Jaipur', 'Male', '2024-01-01', 'Regular'),
  (16, 'CUST0016', 'Pooja Gupta', '9398434138', 'Jaipur', 'Rajasthan', '924, Bani Park, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (17, 'CUST0017', 'Arjun Gupta', '9004023419', 'Jaipur', 'Rajasthan', '483, Mansarovar, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (18, 'CUST0018', 'Nisha Sharma', '9429885000', 'Jaipur', 'Rajasthan', '677, Pratap Nagar, Jaipur', 'Male', '2025-01-01', 'Regular'),
  (19, 'CUST0019', 'Simran Verma', '9570352331', 'Jaipur', 'Rajasthan', '335, Adarsh Nagar, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (20, 'CUST0020', 'Mohit Soni', '9531245810', 'Jaipur', 'Rajasthan', '40, Malviya Nagar, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (21, 'CUST0021', 'Ayush Sharma', '9962805987', 'Jaipur', 'Rajasthan', '546, Raja Park, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (22, 'CUST0022', 'Divya Maheshwari', '9929677366', 'Jaipur', 'Rajasthan', '143, Jhotwara, Jaipur', 'Male', '2025-01-01', 'Regular'),
  (23, 'CUST0023', 'Neha Arora', '9846238391', 'Jaipur', 'Rajasthan', '494, Shyam Nagar, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (24, 'CUST0024', 'Riya Maheshwari', '9402700870', 'Jaipur', 'Rajasthan', '424, Mansarovar, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (25, 'CUST0025', 'Amit Soni', '9933419254', 'Jaipur', 'Rajasthan', '166, Shyam Nagar, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (26, 'CUST0026', 'Ritika Gupta', '9474968163', 'Jaipur', 'Rajasthan', '980, Vaishali Nagar, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (27, 'CUST0027', 'Vikas Mathur', '9991259500', 'Jaipur', 'Rajasthan', '833, Tonk Road, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (28, 'CUST0028', 'Kavya Choudhary', '9246311155', 'Jaipur', 'Rajasthan', '924, Malviya Nagar, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (29, 'CUST0029', 'Priya Mehta', '9137781517', 'Jaipur', 'Rajasthan', '656, Vaishali Nagar, Jaipur', 'Male', '2026-01-01', 'Regular'),
  (30, 'CUST0030', 'Vihaan Sharma', '9072032344', 'Jaipur', 'Rajasthan', '469, Jhotwara, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (31, 'CUST0031', 'Arjun Mehta', '9558633270', 'Jaipur', 'Rajasthan', '112, Vidhyadhar Nagar, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (32, 'CUST0032', 'Aditi Mehta', '9816020492', 'Jaipur', 'Rajasthan', '161, C-Scheme, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (33, 'CUST0033', 'Vihaan Choudhary', '9533388223', 'Jaipur', 'Rajasthan', '870, Bani Park, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (34, 'CUST0034', 'Vihaan Maheshwari', '9084726555', 'Jaipur', 'Rajasthan', '886, Shyam Nagar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (35, 'CUST0035', 'Ritika Mehta', '9397917666', 'Jaipur', 'Rajasthan', '795, Vaishali Nagar, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (36, 'CUST0036', 'Ayush Goyal', '9483838997', 'Jaipur', 'Rajasthan', '84, Pratap Nagar, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (37, 'CUST0037', 'Nitin Bansal', '9933568337', 'Jaipur', 'Rajasthan', '37, Shyam Nagar, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (38, 'CUST0038', 'Arjun Khandelwal', '9368949976', 'Jaipur', 'Rajasthan', '551, Pratap Nagar, Jaipur', 'Female', '2026-01-01', 'Regular'),
  (39, 'CUST0039', 'Harsh Gupta', '9483370365', 'Jaipur', 'Rajasthan', '355, Mansarovar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (40, 'CUST0040', 'Rohit Khandelwal', '9804123405', 'Jaipur', 'Rajasthan', '341, Bani Park, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (41, 'CUST0041', 'Arjun Goyal', '9060661522', 'Jaipur', 'Rajasthan', '274, Vaishali Nagar, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (42, 'CUST0042', 'Nitin Khandelwal', '9656125621', 'Jaipur', 'Rajasthan', '30, Adarsh Nagar, Jaipur', 'Male', '2026-01-01', 'Regular'),
  (43, 'CUST0043', 'Ritika Verma', '9525905791', 'Jaipur', 'Rajasthan', '527, Jagatpura, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (44, 'CUST0044', 'Amit Mehta', '9458595350', 'Jaipur', 'Rajasthan', '763, Jhotwara, Jaipur', 'Male', '2026-01-01', 'Regular'),
  (45, 'CUST0045', 'Ananya Choudhary', '9886320354', 'Jaipur', 'Rajasthan', '424, Vaishali Nagar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (46, 'CUST0046', 'Amit Soni', '9734023864', 'Jaipur', 'Rajasthan', '659, Shyam Nagar, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (47, 'CUST0047', 'Nisha Bansal', '9158035336', 'Jaipur', 'Rajasthan', '75, Jagatpura, Jaipur', 'Male', '2021-01-01', 'VIP'),
  (48, 'CUST0048', 'Arjun Verma', '9804766051', 'Jaipur', 'Rajasthan', '97, Adarsh Nagar, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (49, 'CUST0049', 'Ritika Bansal', '9178660571', 'Jaipur', 'Rajasthan', '549, Adarsh Nagar, Jaipur', 'Male', '2025-01-01', 'Regular'),
  (50, 'CUST0050', 'Manav Mehta', '9638806867', 'Jaipur', 'Rajasthan', '59, Bani Park, Jaipur', 'Male', '2023-01-01', 'Premium');

INSERT INTO customers (customer_id, customer_code, customer_name, phone, city, state, address, gender, customer_since, customer_type) VALUES
  (51, 'CUST0051', 'Yash Goyal', '9755908557', 'Jaipur', 'Rajasthan', '260, C-Scheme, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (52, 'CUST0052', 'Manav Gupta', '9441654535', 'Jaipur', 'Rajasthan', '599, Raja Park, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (53, 'CUST0053', 'Divya Goyal', '9096427881', 'Jaipur', 'Rajasthan', '363, Bani Park, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (54, 'CUST0054', 'Divya Mathur', '9861963295', 'Jaipur', 'Rajasthan', '648, Shyam Nagar, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (55, 'CUST0055', 'Riya Bansal', '9527852829', 'Jaipur', 'Rajasthan', '106, Civil Lines, Jaipur', 'Male', '2025-01-01', 'Regular'),
  (56, 'CUST0056', 'Ritika Maheshwari', '9723092756', 'Jaipur', 'Rajasthan', '21, Jagatpura, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (57, 'CUST0057', 'Simran Mehta', '9768902522', 'Jaipur', 'Rajasthan', '466, Raja Park, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (58, 'CUST0058', 'Karan Jain', '9561698912', 'Jaipur', 'Rajasthan', '224, Mansarovar, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (59, 'CUST0059', 'Rahul Arora', '9468593470', 'Jaipur', 'Rajasthan', '299, Shyam Nagar, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (60, 'CUST0060', 'Vihaan Gupta', '9487794370', 'Jaipur', 'Rajasthan', '80, Jagatpura, Jaipur', 'Male', '2021-01-01', 'VIP'),
  (61, 'CUST0061', 'Harsh Singh', '9410371108', 'Jaipur', 'Rajasthan', '591, Jhotwara, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (62, 'CUST0062', 'Rahul Agarwal', '9823618603', 'Jaipur', 'Rajasthan', '391, Shyam Nagar, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (63, 'CUST0063', 'Aditi Singh', '9777551583', 'Jaipur', 'Rajasthan', '716, Vidhyadhar Nagar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (64, 'CUST0064', 'Pooja Jain', '9606438496', 'Jaipur', 'Rajasthan', '49, Tonk Road, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (65, 'CUST0065', 'Karan Mathur', '9521551075', 'Jaipur', 'Rajasthan', '283, Adarsh Nagar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (66, 'CUST0066', 'Nitin Choudhary', '9908937647', 'Jaipur', 'Rajasthan', '135, Mansarovar, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (67, 'CUST0067', 'Nisha Sharma', '9255924705', 'Jaipur', 'Rajasthan', '703, Raja Park, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (68, 'CUST0068', 'Neha Jain', '9607028773', 'Jaipur', 'Rajasthan', '118, C-Scheme, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (69, 'CUST0069', 'Karan Bansal', '9749254569', 'Jaipur', 'Rajasthan', '900, Adarsh Nagar, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (70, 'CUST0070', 'Ananya Goyal', '9263498701', 'Jaipur', 'Rajasthan', '755, Jagatpura, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (71, 'CUST0071', 'Harsh Jain', '9846246943', 'Jaipur', 'Rajasthan', '745, Jhotwara, Jaipur', 'Male', '2021-01-01', 'VIP'),
  (72, 'CUST0072', 'Rahul Arora', '9719348820', 'Jaipur', 'Rajasthan', '511, Jagatpura, Jaipur', 'Female', '2026-01-01', 'Regular'),
  (73, 'CUST0073', 'Divya Goyal', '9199007463', 'Jaipur', 'Rajasthan', '516, Jagatpura, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (74, 'CUST0074', 'Ayush Choudhary', '9226286960', 'Jaipur', 'Rajasthan', '579, Jagatpura, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (75, 'CUST0075', 'Nisha Bansal', '9897020492', 'Jaipur', 'Rajasthan', '992, Shyam Nagar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (76, 'CUST0076', 'Tanvi Mathur', '9685355485', 'Jaipur', 'Rajasthan', '87, Tonk Road, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (77, 'CUST0077', 'Mohit Jain', '9391895271', 'Jaipur', 'Rajasthan', '99, Shyam Nagar, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (78, 'CUST0078', 'Meera Verma', '9176985493', 'Jaipur', 'Rajasthan', '48, Jagatpura, Jaipur', 'Male', '2026-01-01', 'Regular'),
  (79, 'CUST0079', 'Tanvi Arora', '9194304832', 'Jaipur', 'Rajasthan', '844, Raja Park, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (80, 'CUST0080', 'Nisha Mathur', '9339864651', 'Jaipur', 'Rajasthan', '273, Mansarovar, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (81, 'CUST0081', 'Vikas Jain', '9838056982', 'Jaipur', 'Rajasthan', '516, Adarsh Nagar, Jaipur', 'Male', '2026-01-01', 'Regular'),
  (82, 'CUST0082', 'Ishita Jain', '9210726213', 'Jaipur', 'Rajasthan', '647, Civil Lines, Jaipur', 'Male', '2021-01-01', 'VIP'),
  (83, 'CUST0083', 'Aarav Goyal', '9099710748', 'Jaipur', 'Rajasthan', '983, Jhotwara, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (84, 'CUST0084', 'Priya Khandelwal', '9431991615', 'Jaipur', 'Rajasthan', '137, Malviya Nagar, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (85, 'CUST0085', 'Ishita Arora', '9055568288', 'Jaipur', 'Rajasthan', '967, Jhotwara, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (86, 'CUST0086', 'Sneha Khandelwal', '9625795715', 'Jaipur', 'Rajasthan', '193, Mansarovar, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (87, 'CUST0087', 'Simran Goyal', '9897519424', 'Jaipur', 'Rajasthan', '832, Vidhyadhar Nagar, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (88, 'CUST0088', 'Aarav Arora', '9045345087', 'Jaipur', 'Rajasthan', '531, Raja Park, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (89, 'CUST0089', 'Aarav Mathur', '9567227049', 'Jaipur', 'Rajasthan', '22, C-Scheme, Jaipur', 'Female', '2026-01-01', 'Regular'),
  (90, 'CUST0090', 'Vikas Jain', '9741602033', 'Jaipur', 'Rajasthan', '388, Vidhyadhar Nagar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (91, 'CUST0091', 'Arjun Mehta', '9077927858', 'Jaipur', 'Rajasthan', '727, Tonk Road, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (92, 'CUST0092', 'Vihaan Agarwal', '9750802074', 'Jaipur', 'Rajasthan', '696, Jhotwara, Jaipur', 'Female', '2026-01-01', 'Regular'),
  (93, 'CUST0093', 'Simran Soni', '9280730246', 'Jaipur', 'Rajasthan', '532, Bani Park, Jaipur', 'Male', '2021-01-01', 'VIP'),
  (94, 'CUST0094', 'Karan Soni', '9968117190', 'Jaipur', 'Rajasthan', '171, Jhotwara, Jaipur', 'Male', '2021-01-01', 'VIP'),
  (95, 'CUST0095', 'Amit Bansal', '9156484596', 'Jaipur', 'Rajasthan', '525, Jagatpura, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (96, 'CUST0096', 'Mohit Bansal', '9814761506', 'Jaipur', 'Rajasthan', '367, Pratap Nagar, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (97, 'CUST0097', 'Arjun Maheshwari', '9885789709', 'Jaipur', 'Rajasthan', '936, Shyam Nagar, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (98, 'CUST0098', 'Nitin Jain', '9294438191', 'Jaipur', 'Rajasthan', '116, Bani Park, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (99, 'CUST0099', 'Meera Mehta', '9307592844', 'Jaipur', 'Rajasthan', '965, Bani Park, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (100, 'CUST0100', 'Manav Choudhary', '9321364613', 'Jaipur', 'Rajasthan', '679, Adarsh Nagar, Jaipur', 'Male', '2024-01-01', 'Regular');

INSERT INTO customers (customer_id, customer_code, customer_name, phone, city, state, address, gender, customer_since, customer_type) VALUES
  (101, 'CUST0101', 'Tanvi Sharma', '9999475657', 'Jaipur', 'Rajasthan', '333, C-Scheme, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (102, 'CUST0102', 'Kavya Mehta', '9613575341', 'Jaipur', 'Rajasthan', '888, Vaishali Nagar, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (103, 'CUST0103', 'Priya Bansal', '9601944994', 'Jaipur', 'Rajasthan', '202, Pratap Nagar, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (104, 'CUST0104', 'Vihaan Mathur', '9384179537', 'Jaipur', 'Rajasthan', '674, Adarsh Nagar, Jaipur', 'Female', '2022-01-01', 'VIP'),
  (105, 'CUST0105', 'Ritika Goyal', '9310291151', 'Jaipur', 'Rajasthan', '259, Raja Park, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (106, 'CUST0106', 'Aarav Choudhary', '9987095148', 'Jaipur', 'Rajasthan', '153, Vidhyadhar Nagar, Jaipur', 'Male', '2024-01-01', 'Regular'),
  (107, 'CUST0107', 'Riya Jain', '9101021861', 'Jaipur', 'Rajasthan', '246, Raja Park, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (108, 'CUST0108', 'Karan Sharma', '9872593446', 'Jaipur', 'Rajasthan', '225, Vidhyadhar Nagar, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (109, 'CUST0109', 'Karan Mehta', '9755536067', 'Jaipur', 'Rajasthan', '409, Malviya Nagar, Jaipur', 'Male', '2022-01-01', 'VIP'),
  (110, 'CUST0110', 'Ayush Choudhary', '9263364287', 'Jaipur', 'Rajasthan', '31, Jhotwara, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (111, 'CUST0111', 'Arjun Agarwal', '9868264558', 'Jaipur', 'Rajasthan', '924, Civil Lines, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (112, 'CUST0112', 'Kavya Singh', '9138345134', 'Jaipur', 'Rajasthan', '298, Vidhyadhar Nagar, Jaipur', 'Male', '2025-01-01', 'Regular'),
  (113, 'CUST0113', 'Vikas Agarwal', '9734064690', 'Jaipur', 'Rajasthan', '149, Tonk Road, Jaipur', 'Male', '2026-01-01', 'Regular'),
  (114, 'CUST0114', 'Nisha Khandelwal', '9258675312', 'Jaipur', 'Rajasthan', '975, Jagatpura, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (115, 'CUST0115', 'Ritika Arora', '9803900431', 'Jaipur', 'Rajasthan', '118, Vidhyadhar Nagar, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (116, 'CUST0116', 'Mohit Jain', '9499347976', 'Jaipur', 'Rajasthan', '975, Tonk Road, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (117, 'CUST0117', 'Amit Agarwal', '9927589407', 'Jaipur', 'Rajasthan', '242, Bani Park, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (118, 'CUST0118', 'Sakshi Choudhary', '9626676593', 'Jaipur', 'Rajasthan', '947, Jagatpura, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (119, 'CUST0119', 'Riya Goyal', '9470589371', 'Jaipur', 'Rajasthan', '651, Vaishali Nagar, Jaipur', 'Male', '2021-01-01', 'VIP'),
  (120, 'CUST0120', 'Vihaan Gupta', '9002612984', 'Jaipur', 'Rajasthan', '333, Vidhyadhar Nagar, Jaipur', 'Female', '2026-01-01', 'Regular'),
  (121, 'CUST0121', 'Nitin Soni', '9415973365', 'Jaipur', 'Rajasthan', '932, Jhotwara, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (122, 'CUST0122', 'Yash Jain', '9604883840', 'Jaipur', 'Rajasthan', '695, Malviya Nagar, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (123, 'CUST0123', 'Ayush Maheshwari', '9378281722', 'Jaipur', 'Rajasthan', '889, Raja Park, Jaipur', 'Male', '2025-01-01', 'Regular'),
  (124, 'CUST0124', 'Nisha Jain', '9848041948', 'Jaipur', 'Rajasthan', '666, Raja Park, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (125, 'CUST0125', 'Aditi Singh', '9352475264', 'Jaipur', 'Rajasthan', '189, Shyam Nagar, Jaipur', 'Male', '2024-01-01', 'Regular'),
  (126, 'CUST0126', 'Vihaan Agarwal', '9401520884', 'Jaipur', 'Rajasthan', '789, Raja Park, Jaipur', 'Male', '2020-01-01', 'VIP'),
  (127, 'CUST0127', 'Priya Mathur', '9407403425', 'Jaipur', 'Rajasthan', '162, Civil Lines, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (128, 'CUST0128', 'Aarav Choudhary', '9180594824', 'Jaipur', 'Rajasthan', '617, Malviya Nagar, Jaipur', 'Female', '2024-01-01', 'Regular'),
  (129, 'CUST0129', 'Aditi Soni', '9875034577', 'Jaipur', 'Rajasthan', '672, C-Scheme, Jaipur', 'Female', '2025-01-01', 'Regular'),
  (130, 'CUST0130', 'Kavya Goyal', '9822634746', 'Jaipur', 'Rajasthan', '328, Adarsh Nagar, Jaipur', 'Male', '2026-01-01', 'Regular'),
  (131, 'CUST0131', 'Tanvi Singh', '9565388741', 'Jaipur', 'Rajasthan', '250, Vidhyadhar Nagar, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (132, 'CUST0132', 'Mohit Mehta', '9790750151', 'Jaipur', 'Rajasthan', '566, C-Scheme, Jaipur', 'Male', '2023-01-01', 'Premium'),
  (133, 'CUST0133', 'Sakshi Verma', '9116999144', 'Jaipur', 'Rajasthan', '417, Jhotwara, Jaipur', 'Female', '2026-01-01', 'Regular'),
  (134, 'CUST0134', 'Manav Gupta', '9747856160', 'Jaipur', 'Rajasthan', '496, Shyam Nagar, Jaipur', 'Female', '2021-01-01', 'VIP'),
  (135, 'CUST0135', 'Aarav Mathur', '9072577156', 'Jaipur', 'Rajasthan', '196, Raja Park, Jaipur', 'Female', '2020-01-01', 'VIP'),
  (136, 'CUST0136', 'Vihaan Sharma', '9220609283', 'Jaipur', 'Rajasthan', '539, Mansarovar, Jaipur', 'Female', '2023-01-01', 'Premium'),
  (137, 'CUST0137', 'Karan Jain', '9428524156', 'Jaipur', 'Rajasthan', '838, Shyam Nagar, Jaipur', 'Male', '2025-01-01', 'Regular'),
  (138, 'CUST0138', 'Meera Goyal', '9768135223', 'Jaipur', 'Rajasthan', '903, C-Scheme, Jaipur', 'Male', '2021-01-01', 'VIP'),
  (139, 'CUST0139', 'Mohit Choudhary', '9071925913', 'Udaipur', 'Rajasthan', '28, Main Market, Udaipur', 'Female', '2022-01-01', 'VIP'),
  (140, 'CUST0140', 'Amit Mathur', '9548158077', 'Jodhpur', 'Rajasthan', '875, Main Market, Jodhpur', 'Male', '2026-01-01', 'Regular'),
  (141, 'CUST0141', 'Tanvi Verma', '9745038721', 'Ajmer', 'Rajasthan', '373, Main Market, Ajmer', 'Female', '2024-01-01', 'Regular'),
  (142, 'CUST0142', 'Divya Khandelwal', '9037797206', 'Kota', 'Rajasthan', '707, MG Road, Kota', 'Male', '2020-01-01', 'VIP'),
  (143, 'CUST0143', 'Kavya Jain', '9261735586', 'Ahmedabad', 'Gujarat', '241, Civil Lines, Ahmedabad', 'Male', '2026-01-01', 'Regular'),
  (144, 'CUST0144', 'Yash Choudhary', '9599535257', 'Delhi', 'Delhi', '328, Main Market, Delhi', 'Female', '2023-01-01', 'Premium'),
  (145, 'CUST0145', 'Nitin Goyal', '9072190022', 'Ahmedabad', 'Gujarat', '57, Shastri Nagar, Ahmedabad', 'Female', '2021-01-01', 'VIP'),
  (146, 'CUST0146', 'Meera Arora', '9071392132', 'Gurugram', 'Haryana', '584, Civil Lines, Gurugram', 'Male', '2020-01-01', 'VIP'),
  (147, 'CUST0147', 'Rahul Sharma', '9583922515', 'Gurugram', 'Haryana', '75, MG Road, Gurugram', 'Female', '2026-01-01', 'Regular'),
  (148, 'CUST0148', 'Priya Sharma', '9272087350', 'Ahmedabad', 'Gujarat', '475, Civil Lines, Ahmedabad', 'Male', '2026-01-01', 'Regular'),
  (149, 'CUST0149', 'Neha Mathur', '9017475089', 'Jodhpur', 'Rajasthan', '801, MG Road, Jodhpur', 'Male', '2025-01-01', 'Regular'),
  (150, 'CUST0150', 'Vihaan Agarwal', '9496968664', 'Delhi', 'Delhi', '416, Civil Lines, Delhi', 'Female', '2025-01-01', 'Regular');

-- ============================================================
-- SALES AND SALE_ITEMS
-- ============================================================
INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (1, 14, 'INV-20240103-0001', '2024-01-03', 86122.33, 0.00, 0.00, 3.0, 2583.67, 88706.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (1, 1, 43, 1, 88706.0, '18KT', 11.12, 6.2, 66637.0, 10011.0, 0.00, 88706.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (2, 23, 'INV-20240109-0002', '2024-01-09', 168985.44, 0.00, 0.00, 3.0, 5069.56, 174055.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (2, 2, 167, 1, 174055.0, '18KT', 21.12, 9.0, 74364.0, 2863.0, 0.00, 174055.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (3, 69, 'INV-20240112-0003', '2024-01-12', 517633.01, 0.00, 0.00, 3.0, 15528.99, 533162.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (3, 3, 117, 1, 533162.0, '18KT', 66.36, 9.2, 72428.0, 8312.0, 0.00, 533162.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (4, 10, 'INV-20240116-0004', '2024-01-16', 229156.31, 0.00, 0.00, 3.0, 6874.69, 236031.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (4, 4, 267, 1, 236031.0, '18KT', 24.74, 18.0, 72819.0, 23449.0, 0.00, 236031.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (5, 138, 'INV-20240116-0005', '2024-01-16', 518335.92, 0.00, 0.00, 3.0, 15550.08, 533886.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (5, 5, 116, 1, 533886.0, '22KT', 60.8, 17.5, 72713.0, 14424.0, 0.00, 533886.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (6, 86, 'INV-20240203-0006', '2024-02-03', 262482.52, 0.00, 0.00, 3.0, 7874.48, 270357.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (6, 6, 58, 1, 270357.0, '22KT', 29.67, 16.3, 71941.0, 22116.0, 0.00, 270357.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (7, 14, 'INV-20240223-0007', '2024-02-23', 138570.87, 0.00, 0.00, 3.0, 4157.13, 142728.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (7, 7, 109, 1, 142728.0, '18KT', 15.18, 14.1, 73757.0, 14978.0, 0.00, 142728.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (8, 35, 'INV-20240224-0008', '2024-02-24', 72801.94, 0.00, 0.00, 3.0, 2184.06, 74986.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (8, 8, 96, 1, 74986.0, '22KT', 7.55, 13.1, 62846.0, 21321.0, 0.00, 74986.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (9, 144, 'INV-20240301-0009', '2024-03-01', 202353.4, 0.00, 0.00, 3.0, 6070.6, 208424.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (9, 9, 244, 1, 208424.0, '22KT', 27.1, 7.8, 65131.0, 18152.0, 0.00, 208424.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (10, 63, 'INV-20240407-0010', '2024-04-07', 470194.17, 0.00, 0.00, 3.0, 14105.83, 484300.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (10, 10, 182, 1, 484300.0, '18KT', 63.39, 3.6, 71203.0, 16695.0, 0.00, 484300.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (11, 1, 'INV-20240415-0011', '2024-04-15', 121483.5, 0.00, 0.00, 3.0, 3644.5, 125128.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (11, 11, 66, 1, 125128.0, '18KT', 11.94, 13.3, 74773.0, 23975.0, 0.00, 125128.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (12, 23, 'INV-20240418-0012', '2024-04-18', 549707.77, 0.00, 0.00, 3.0, 16491.23, 566199.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (12, 12, 89, 1, 566199.0, '18KT', 72.36, 16.1, 66105.0, 10851.0, 0.00, 566199.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (13, 97, 'INV-20240516-0013', '2024-05-16', 395816.5, 0.00, 0.00, 3.0, 11874.5, 407691.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (13, 13, 28, 1, 407691.0, '18KT', 54.73, 4.4, 67368.0, 22763.0, 0.00, 407691.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (14, 2, 'INV-20240526-0014', '2024-05-26', 397685.44, 0.00, 0.00, 3.0, 11930.56, 409616.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (14, 14, 83, 1, 409616.0, '22KT', 52.57, 12.7, 68409.0, 4317.0, 0.00, 409616.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (15, 115, 'INV-20240531-0015', '2024-05-31', 428022.33, 0.00, 0.00, 3.0, 12840.67, 440863.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (15, 15, 24, 1, 440863.0, '22KT', 59.75, 11.9, 63449.0, 16641.0, 0.00, 440863.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (16, 12, 'INV-20240611-0016', '2024-06-11', 393741.75, 0.00, 0.00, 3.0, 11812.25, 405554.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (16, 16, 269, 1, 405554.0, '22KT', 53.27, 4.6, 71596.0, 6618.0, 0.00, 405554.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (17, 37, 'INV-20240731-0017', '2024-07-31', 80211.65, 0.00, 0.00, 3.0, 2406.35, 82618.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (17, 17, 6, 1, 82618.0, '18KT', 10.54, 5.9, 62529.0, 12824.0, 0.00, 82618.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (18, 6, 'INV-20240813-0018', '2024-08-13', 385028.16, 0.00, 0.00, 3.0, 11550.84, 396579.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (18, 18, 50, 1, 396579.0, '18KT', 50.97, 8.0, 67526.0, 24865.0, 0.00, 396579.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (19, 111, 'INV-20240820-0019', '2024-08-20', 49065.05, 0.00, 0.00, 3.0, 1471.95, 50537.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (19, 19, 8, 1, 50537.0, '18KT', 3.64, 7.9, 66754.0, 24319.0, 0.00, 50537.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (20, 123, 'INV-20240831-0020', '2024-08-31', 138947.57, 0.00, 0.00, 3.0, 4168.43, 143116.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (20, 20, 230, 1, 143116.0, '18KT', 18.52, 16.5, 64404.0, 4159.0, 0.00, 143116.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (21, 121, 'INV-20240911-0021', '2024-09-11', 310815.53, 0.00, 0.00, 3.0, 9324.47, 320140.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (21, 21, 91, 1, 320140.0, '22KT', 40.71, 8.9, 69906.0, 10224.0, 0.00, 320140.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (22, 79, 'INV-20240930-0022', '2024-09-30', 281792.23, 0.00, 0.00, 3.0, 8453.77, 290246.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (22, 22, 19, 1, 290246.0, '18KT', 38.88, 5.5, 68276.0, 10189.0, 0.00, 290246.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (23, 134, 'INV-20241005-0023', '2024-10-05', 426146.6, 0.00, 0.00, 3.0, 12784.4, 438931.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (23, 23, 22, 1, 438931.0, '18KT', 55.61, 7.9, 71406.0, 10472.0, 0.00, 438931.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (24, 53, 'INV-20241029-0024', '2024-10-29', 330190.29, 0.00, 0.00, 3.0, 9905.71, 340096.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (24, 24, 100, 1, 340096.0, '22KT', 38.83, 12.3, 74284.0, 16173.0, 0.00, 340096.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (25, 135, 'INV-20241030-0025', '2024-10-30', 363117.48, 0.00, 0.00, 3.0, 10893.52, 374011.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (25, 25, 111, 1, 374011.0, '22KT', 45.17, 10.0, 74843.0, 2139.0, 0.00, 374011.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (26, 81, 'INV-20241213-0026', '2024-12-13', 515361.17, 0.00, 0.00, 3.0, 15460.83, 530822.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (26, 26, 253, 1, 530822.0, '22KT', 69.92, 7.2, 67936.0, 21613.0, 0.00, 530822.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (27, 102, 'INV-20241216-0027', '2024-12-16', 500202.91, 0.00, 0.00, 3.0, 15006.09, 515209.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (27, 27, 179, 1, 515209.0, '18KT', 63.11, 3.3, 75302.0, 24295.0, 0.00, 515209.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (28, 112, 'INV-20241229-0028', '2024-12-29', 170375.73, 0.00, 0.00, 3.0, 5111.27, 175487.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (28, 28, 15, 1, 175487.0, '22KT', 22.58, 4.5, 68604.0, 13608.0, 0.00, 175487.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (29, 125, 'INV-20241230-0029', '2024-12-30', 311898.06, 0.00, 0.00, 3.0, 9356.94, 321255.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (29, 29, 59, 1, 321255.0, '18KT', 40.68, 13.0, 68556.0, 6114.0, 0.00, 321255.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (30, 108, 'INV-20250108-0030', '2025-01-08', 632439.81, 0.00, 0.00, 3.0, 18973.19, 651413.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (30, 30, 264, 1, 651413.0, '18KT', 72.53, 13.1, 78097.0, 10772.0, 0.00, 651413.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (31, 131, 'INV-20250113-0031', '2025-01-13', 552493.2, 0.00, 0.00, 3.0, 16574.8, 569068.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (31, 31, 231, 1, 569068.0, '22KT', 67.1, 14.1, 72331.0, 15294.0, 0.00, 569068.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (32, 47, 'INV-20250219-0032', '2025-02-19', 757033.01, 0.00, 0.00, 3.0, 22710.99, 779744.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (32, 32, 98, 1, 779744.0, '18KT', 78.99, 10.0, 87888.0, 16094.0, 0.00, 779744.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (33, 125, 'INV-20250224-0033', '2025-02-24', 239771.84, 0.00, 0.00, 3.0, 7193.16, 246965.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (33, 33, 136, 1, 246965.0, '18KT', 26.51, 10.0, 78930.0, 16797.0, 0.00, 246965.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (34, 44, 'INV-20250226-0034', '2025-02-26', 329852.43, 0.00, 0.00, 3.0, 9895.57, 339748.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (34, 34, 199, 1, 339748.0, '18KT', 36.06, 8.2, 82462.0, 18007.0, 0.00, 339748.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (35, 87, 'INV-20250228-0035', '2025-02-28', 517849.51, 0.00, 0.00, 3.0, 15535.49, 533385.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (35, 35, 281, 1, 533385.0, '18KT', 58.27, 8.7, 81967.0, 14210.0, 0.00, 533385.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (36, 101, 'INV-20250301-0036', '2025-03-01', 240608.74, 0.00, 0.00, 3.0, 7218.26, 247827.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (36, 36, 80, 1, 247827.0, '22KT', 28.67, 12.6, 72194.0, 14767.0, 0.00, 247827.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (37, 117, 'INV-20250303-0037', '2025-03-03', 233513.59, 0.00, 0.00, 3.0, 7005.41, 240519.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (37, 37, 2, 1, 240519.0, '22KT', 27.0, 4.0, 83623.0, 5706.0, 0.00, 240519.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (38, 147, 'INV-20250324-0038', '2025-03-24', 298014.56, 0.00, 0.00, 3.0, 8940.44, 306955.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (38, 38, 216, 1, 306955.0, '18KT', 30.42, 14.9, 84058.0, 13151.0, 0.00, 306955.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (39, 5, 'INV-20250325-0039', '2025-03-25', 264942.72, 0.00, 0.00, 3.0, 7948.28, 272891.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (39, 39, 221, 1, 272891.0, '22KT', 28.35, 8.6, 87980.0, 2017.0, 0.00, 272891.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (40, 23, 'INV-20250402-0040', '2025-04-02', 507768.93, 0.00, 0.00, 3.0, 15233.07, 523002.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (40, 40, 103, 1, 523002.0, '18KT', 60.71, 11.9, 75620.0, 9281.0, 0.00, 523002.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (41, 4, 'INV-20250423-0041', '2025-04-23', 655336.89, 0.00, 0.00, 3.0, 19660.11, 674997.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (41, 41, 125, 1, 674997.0, '18KT', 67.54, 17.3, 83502.0, 13457.0, 0.00, 674997.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (42, 59, 'INV-20250428-0042', '2025-04-28', 590948.54, 0.00, 0.00, 3.0, 17728.46, 608677.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (42, 42, 238, 1, 608677.0, '18KT', 68.37, 17.6, 73414.0, 18406.0, 0.00, 608677.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (43, 137, 'INV-20250611-0043', '2025-06-11', 659366.99, 0.00, 0.00, 3.0, 19781.01, 679148.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (43, 43, 277, 1, 679148.0, '22KT', 72.26, 12.8, 81844.0, 12043.0, 0.00, 679148.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (44, 16, 'INV-20250616-0044', '2025-06-16', 75784.47, 0.00, 0.00, 3.0, 2273.53, 78058.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (44, 44, 34, 1, 78058.0, '22KT', 8.07, 14.8, 76138.0, 7521.0, 0.00, 78058.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (45, 127, 'INV-20250622-0045', '2025-06-22', 297303.88, 0.00, 0.00, 3.0, 8919.12, 306223.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (45, 45, 101, 1, 306223.0, '18KT', 31.52, 7.8, 83623.0, 22084.0, 0.00, 306223.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (46, 140, 'INV-20250626-0046', '2025-06-26', 75477.67, 0.00, 0.00, 3.0, 2264.33, 77742.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (46, 46, 76, 1, 77742.0, '22KT', 6.32, 6.3, 89897.0, 17348.0, 0.00, 77742.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (47, 46, 'INV-20250701-0047', '2025-07-01', 399598.06, 0.00, 0.00, 3.0, 11987.94, 411586.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (47, 47, 135, 1, 411586.0, '22KT', 39.74, 11.5, 88222.0, 20673.0, 0.00, 411586.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (48, 138, 'INV-20250712-0048', '2025-07-12', 123983.5, 0.00, 0.00, 3.0, 3719.5, 127703.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (48, 48, 197, 1, 127703.0, '22KT', 15.52, 3.7, 73557.0, 9319.0, 0.00, 127703.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (49, 97, 'INV-20250718-0049', '2025-07-18', 338749.51, 0.00, 0.00, 3.0, 10162.49, 348912.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (49, 49, 266, 1, 348912.0, '18KT', 33.46, 16.2, 83570.0, 23987.0, 0.00, 348912.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (50, 12, 'INV-20250720-0050', '2025-07-20', 56089.32, 0.00, 0.00, 3.0, 1682.68, 57772.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (50, 50, 200, 1, 57772.0, '18KT', 5.23, 9.7, 76509.0, 13876.0, 0.00, 57772.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (51, 35, 'INV-20250811-0051', '2025-08-11', 201800.97, 0.00, 0.00, 3.0, 6054.03, 207855.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (51, 51, 223, 1, 207855.0, '22KT', 22.68, 9.3, 76879.0, 17278.0, 0.00, 207855.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (52, 50, 'INV-20250814-0052', '2025-08-14', 295844.66, 0.00, 0.00, 3.0, 8875.34, 304720.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (52, 52, 206, 1, 304720.0, '18KT', 34.82, 17.6, 73638.0, 3185.0, 0.00, 304720.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (53, 66, 'INV-20250815-0053', '2025-08-15', 54964.08, 0.00, 0.00, 3.0, 1648.92, 56613.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (53, 53, 42, 1, 56613.0, '22KT', 5.12, 17.6, 75715.0, 11024.0, 0.00, 56613.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (54, 70, 'INV-20250820-0054', '2025-08-20', 322564.08, 0.00, 0.00, 3.0, 9676.92, 332241.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (54, 54, 47, 1, 332241.0, '22KT', 34.13, 13.2, 80677.0, 20544.0, 0.00, 332241.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (55, 108, 'INV-20250821-0055', '2025-08-21', 493378.64, 0.00, 0.00, 3.0, 14801.36, 508180.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (55, 55, 69, 1, 508180.0, '22KT', 59.41, 14.4, 72057.0, 18444.0, 0.00, 508180.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (56, 28, 'INV-20250824-0056', '2025-08-24', 349358.25, 0.00, 0.00, 3.0, 10480.75, 359839.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (56, 56, 52, 1, 359839.0, '22KT', 34.08, 17.9, 83346.0, 24952.0, 0.00, 359839.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (57, 17, 'INV-20250902-0057', '2025-09-02', 540626.21, 0.00, 0.00, 3.0, 16218.79, 556845.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (57, 57, 119, 1, 556845.0, '18KT', 60.81, 4.9, 83937.0, 21413.0, 0.00, 556845.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (58, 91, 'INV-20250918-0058', '2025-09-18', 72951.46, 0.00, 0.00, 3.0, 2188.54, 75140.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (58, 58, 21, 1, 75140.0, '18KT', 6.51, 13.8, 87965.0, 9972.0, 0.00, 75140.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (59, 22, 'INV-20251004-0059', '2025-10-04', 330265.05, 0.00, 0.00, 3.0, 9907.95, 340173.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (59, 59, 36, 1, 340173.0, '18KT', 36.32, 14.0, 79135.0, 12516.0, 0.00, 340173.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (60, 3, 'INV-20251004-0060', '2025-10-04', 87581.55, 0.00, 0.00, 3.0, 2627.45, 90209.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (60, 60, 261, 1, 90209.0, '18KT', 9.28, 3.9, 90178.0, 3260.0, 0.00, 90209.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (61, 97, 'INV-20251012-0061', '2025-10-12', 641441.75, 0.00, 0.00, 3.0, 19243.25, 660685.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (61, 61, 3, 1, 660685.0, '18KT', 69.14, 17.4, 79720.0, 13595.0, 0.00, 660685.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (62, 140, 'INV-20251022-0062', '2025-10-22', 334291.26, 0.00, 0.00, 3.0, 10028.74, 344320.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (62, 62, 204, 1, 344320.0, '22KT', 35.63, 6.2, 87475.0, 13323.0, 0.00, 344320.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (63, 8, 'INV-20251029-0063', '2025-10-29', 538625.24, 0.00, 0.00, 3.0, 16158.76, 554784.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (63, 63, 56, 1, 554784.0, '18KT', 57.14, 16.9, 80285.0, 18507.0, 0.00, 554784.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (64, 68, 'INV-20251111-0064', '2025-11-11', 355068.93, 0.00, 0.00, 3.0, 10652.07, 365721.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (64, 64, 180, 1, 365721.0, '18KT', 42.02, 12.8, 76186.0, 4610.0, 0.00, 365721.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (65, 9, 'INV-20251128-0065', '2025-11-28', 101772.82, 0.00, 0.00, 3.0, 3053.18, 104826.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (65, 65, 214, 1, 104826.0, '18KT', 10.05, 13.1, 75107.0, 19455.0, 0.00, 104826.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (66, 86, 'INV-20251203-0066', '2025-12-03', 670874.76, 0.00, 0.00, 3.0, 20126.24, 691001.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (66, 66, 105, 1, 691001.0, '18KT', 64.19, 16.8, 90137.0, 15209.0, 0.00, 691001.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (67, 90, 'INV-20251204-0067', '2025-12-04', 585803.88, 0.00, 0.00, 3.0, 17574.12, 603378.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (67, 67, 17, 1, 603378.0, '22KT', 66.21, 14.7, 79183.0, 2040.0, 0.00, 603378.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (68, 42, 'INV-20251210-0068', '2025-12-10', 319148.54, 0.00, 0.00, 3.0, 9574.46, 328723.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (68, 68, 210, 1, 328723.0, '18KT', 30.81, 16.6, 84773.0, 24181.0, 0.00, 328723.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (69, 17, 'INV-20251230-0069', '2025-12-30', 605989.32, 0.00, 0.00, 3.0, 18179.68, 624169.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (69, 69, 184, 1, 624169.0, '22KT', 64.1, 14.1, 83233.0, 15419.0, 0.00, 624169.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (70, 96, 'INV-20260101-0070', '2026-01-01', 89986.41, 0.00, 0.00, 3.0, 2699.59, 92686.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (70, 70, 37, 1, 92686.0, '18KT', 7.58, 16.9, 88209.0, 14524.0, 0.00, 92686.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (71, 21, 'INV-20260101-0071', '2026-01-01', 387369.9, 0.00, 0.00, 3.0, 11621.1, 398991.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (71, 71, 78, 1, 398991.0, '22KT', 33.82, 11.4, 104507.0, 5256.0, 0.00, 398991.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (72, 133, 'INV-20260102-0072', '2026-01-02', 573068.93, 0.00, 0.00, 3.0, 17192.07, 590261.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (72, 72, 147, 1, 590261.0, '22KT', 51.03, 14.9, 100406.0, 1546.0, 0.00, 590261.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (73, 138, 'INV-20260109-0073', '2026-01-09', 215029.13, 0.00, 0.00, 3.0, 6450.87, 221480.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (73, 73, 127, 1, 221480.0, '22KT', 18.85, 9.3, 96500.0, 22661.0, 0.00, 221480.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (74, 38, 'INV-20260118-0074', '2026-01-18', 41811.65, 0.00, 0.00, 3.0, 1254.35, 43066.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (74, 74, 212, 1, 43066.0, '18KT', 4.1, 10.8, 90754.0, 1838.0, 0.00, 43066.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (75, 100, 'INV-20260127-0075', '2026-01-27', 676583.5, 0.00, 0.00, 3.0, 20297.5, 696881.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (75, 75, 13, 1, 696881.0, '22KT', 70.96, 10.4, 87123.0, 14361.0, 0.00, 696881.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (76, 33, 'INV-20260212-0076', '2026-02-12', 828725.24, 0.00, 0.00, 3.0, 24861.76, 853587.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (76, 76, 107, 1, 853587.0, '22KT', 72.77, 12.5, 101295.0, 24323.0, 0.00, 853587.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (77, 87, 'INV-20260213-0077', '2026-02-13', 756265.05, 0.00, 0.00, 3.0, 22687.95, 778953.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (77, 77, 143, 1, 778953.0, '22KT', 65.85, 12.3, 102549.0, 20608.0, 0.00, 778953.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (78, 31, 'INV-20260220-0078', '2026-02-20', 579022.33, 0.00, 0.00, 3.0, 17370.67, 596393.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (78, 78, 38, 1, 596393.0, '18KT', 63.08, 3.2, 90533.0, 7036.0, 0.00, 596393.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (79, 99, 'INV-20260303-0079', '2026-03-03', 405380.58, 0.00, 0.00, 3.0, 12161.42, 417542.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (79, 79, 20, 1, 417542.0, '22KT', 37.31, 17.4, 94115.0, 5300.0, 0.00, 417542.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (80, 16, 'INV-20260305-0080', '2026-03-05', 36666.02, 0.00, 0.00, 3.0, 1099.98, 37766.0, 'Card', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (80, 80, 94, 1, 37766.0, '22KT', 3.49, 10.5, 89379.0, 3297.0, 0.00, 37766.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (81, 117, 'INV-20260329-0081', '2026-03-29', 468801.94, 0.00, 0.00, 3.0, 14064.06, 482866.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (81, 81, 193, 1, 482866.0, '18KT', 50.49, 4.9, 86966.0, 22259.0, 0.00, 482866.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (82, 90, 'INV-20260410-0082', '2026-04-10', 355969.9, 0.00, 0.00, 3.0, 10679.1, 366649.0, 'Bank Transfer', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (82, 82, 30, 1, 366649.0, '22KT', 33.34, 8.3, 95760.0, 20886.0, 0.00, 366649.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (83, 116, 'INV-20260412-0083', '2026-04-12', 571038.83, 0.00, 0.00, 3.0, 17131.17, 588170.0, 'UPI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (83, 83, 233, 1, 588170.0, '22KT', 53.47, 5.2, 102398.0, 12177.0, 0.00, 588170.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (84, 110, 'INV-20260607-0084', '2026-06-07', 708381.55, 0.00, 0.00, 3.0, 21251.45, 729633.0, 'Cash', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (84, 84, 134, 1, 729633.0, '18KT', 67.87, 9.7, 96570.0, 10637.0, 0.00, 729633.0);

INSERT INTO sales (sale_id, customer_id, invoice_number, sale_date, subtotal, discount_percent, discount_amount, tax_percent, tax_amount, total_amount, payment_method, payment_status) VALUES
  (85, 41, 'INV-20260619-0085', '2026-06-19', 228036.89, 0.00, 0.00, 3.0, 6841.11, 234878.0, 'EMI', 'Paid');

INSERT INTO sale_items (sale_item_id, sale_id, product_id, quantity, unit_price, purity, net_weight, wastage_percent, gold_rate, making_charges, discount, total_price) VALUES
  (85, 85, 16, 1, 234878.0, '18KT', 20.02, 16.7, 94504.0, 14085.0, 0.00, 234878.0);

-- ============================================================
-- Seed complete: 6 categories, 283 products,
--   283 inventory records, 150 customers, 85 sales
-- ============================================================
SELECT 'Seed data imported successfully!' AS status;
