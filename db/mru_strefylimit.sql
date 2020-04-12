
CREATE TABLE IF NOT EXISTS `mru_strefylimit` (
  `gang` int(11) NOT NULL,
  `data` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

ALTER TABLE `mru_strefylimit`
 ADD KEY `gang` (`gang`);

INSERT INTO `mru_strefylimit` (`gang`, `data`) VALUES
(7, 1408545872),
(9, 1411307396),
(8, 1413654275),
(6, 1414607334),
(107, 1417378910),
(123, 1418940064),
(116, 1429619663),
(104, 1430760156),
(4, 1439466942),
(43, 1439654727),
(10, 1439994432),
(5, 1440434757),
(42, 1440497728),
(109, 1441633997),
(144, 1442060976),
(110, 1442080383),
(106, 1442140985),
(125, 1487338848),
(126, 1494266148),
(108, 1498560323),
(133, 1500293999),
(134, 1502290406),
(14, 1503943676),
(111, 1507393483),
(136, 1509904852),
(114, 1512901020),
(142, 1518899661),
(143, 1521658401),
(131, 1533206350),
(105, 1570368653),
(12, 1573419856),
(102, 1576008284),
(16, 1582387164),
(103, 1585520252),
(13, 1586080801);