-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2018 at 04:07 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim_radius`
--

-- --------------------------------------------------------

--
-- Table structure for table `nas`
--

CREATE TABLE `nas` (
  `id` int(10) NOT NULL,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `server` varchar(64) DEFAULT NULL,
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radacct`
--

CREATE TABLE `radacct` (
  `radacctid` bigint(21) NOT NULL,
  `acctsessionid` varchar(64) NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) DEFAULT '',
  `nasipaddress` varchar(15) NOT NULL DEFAULT '',
  `nasportid` varchar(15) DEFAULT NULL,
  `nasporttype` varchar(32) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctupdatetime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctinterval` int(12) DEFAULT NULL,
  `acctsessiontime` int(12) UNSIGNED DEFAULT NULL,
  `acctauthentic` varchar(32) DEFAULT NULL,
  `connectinfo_start` varchar(50) DEFAULT NULL,
  `connectinfo_stop` varchar(50) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL DEFAULT '',
  `callingstationid` varchar(50) NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) NOT NULL DEFAULT '',
  `servicetype` varchar(32) DEFAULT NULL,
  `framedprotocol` varchar(32) DEFAULT NULL,
  `framedipaddress` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `radacct`
--
DELIMITER $$
CREATE TRIGGER `trig_update_userstats` AFTER UPDATE ON `radacct` FOR EACH ROW INSERT INTO 
user_status
SET 
radacct_id = OLD.radacctid,
username   = OLD.username,
nasipaddress = OLD.nasipaddress,
framedipaddress = OLD.framedipaddress,
callingstationid = OLD.callingstationid,
acctinputoctets = (NEW.acctinputoctets - OLD.acctinputoctets),
acctoutputoctets  = (NEW.acctoutputoctets - OLD.acctoutputoctets)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `radcheck`
--

CREATE TABLE `radcheck` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  `id_userinet` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radcheck`
--

INSERT INTO `radcheck` (`id`, `username`, `attribute`, `op`, `value`, `id_userinet`) VALUES
(285, '3042015001', 'User-Pasword', '==', '3042015001', '156'),
(286, '3042015001', 'User-Profile', ':=', 'Mahasiswa', '156'),
(287, '3042015002', 'User-Pasword', '==', '3042015002', '157'),
(288, '3042015002', 'User-Profile', ':=', 'Mahasiswa', '157'),
(289, '3042015003', 'User-Pasword', '==', '3042015003', '158'),
(290, '3042015003', 'User-Profile', ':=', 'Mahasiswa', '158'),
(291, '3042015004', 'User-Pasword', '==', '3042015004', '159'),
(292, '3042015004', 'User-Profile', ':=', 'Mahasiswa', '159'),
(293, '3042015005', 'User-Pasword', '==', '3042015005', '160'),
(294, '3042015005', 'User-Profile', ':=', 'Mahasiswa', '160'),
(295, '3042015006', 'User-Pasword', '==', '3042015006', '161'),
(296, '3042015006', 'User-Profile', ':=', 'Mahasiswa', '161'),
(297, '3042015007', 'User-Pasword', '==', '3042015007', '162'),
(298, '3042015007', 'User-Profile', ':=', 'Mahasiswa', '162'),
(299, '3042015008', 'User-Pasword', '==', '3042015008', '163'),
(300, '3042015008', 'User-Profile', ':=', 'Mahasiswa', '163'),
(301, '3042015009', 'User-Pasword', '==', '3042015009', '164'),
(302, '3042015009', 'User-Profile', ':=', 'Mahasiswa', '164'),
(303, '3042015010', 'User-Pasword', '==', '3042015010', '165'),
(304, '3042015010', 'User-Profile', ':=', 'Mahasiswa', '165'),
(305, '3042015011', 'User-Pasword', '==', '3042015011', '166'),
(306, '3042015011', 'User-Profile', ':=', 'Mahasiswa', '166'),
(307, '3042015012', 'User-Pasword', '==', '3042015012', '167'),
(308, '3042015012', 'User-Profile', ':=', 'Mahasiswa', '167'),
(309, '3042015013', 'User-Pasword', '==', '3042015013', '168'),
(310, '3042015013', 'User-Profile', ':=', 'Mahasiswa', '168'),
(311, '3042015014', 'User-Pasword', '==', '3042015014', '169'),
(312, '3042015014', 'User-Profile', ':=', 'Mahasiswa', '169'),
(313, '3042015015', 'User-Pasword', '==', '3042015015', '170'),
(314, '3042015015', 'User-Profile', ':=', 'Mahasiswa', '170'),
(315, '3042015016', 'User-Pasword', '==', '3042015016', '171'),
(316, '3042015016', 'User-Profile', ':=', 'Mahasiswa', '171'),
(317, '3042015017', 'User-Pasword', '==', '3042015017', '172'),
(318, '3042015017', 'User-Profile', ':=', 'Mahasiswa', '172'),
(319, '3042015018', 'User-Pasword', '==', '3042015018', '173'),
(320, '3042015018', 'User-Profile', ':=', 'Mahasiswa', '173'),
(321, '3042015019', 'User-Pasword', '==', '3042015019', '174'),
(322, '3042015019', 'User-Profile', ':=', 'Mahasiswa', '174'),
(323, '3042015020', 'User-Pasword', '==', '3042015020', '175'),
(324, '3042015020', 'User-Profile', ':=', 'Mahasiswa', '175'),
(325, '3042015021', 'User-Pasword', '==', '3042015021', '176'),
(326, '3042015021', 'User-Profile', ':=', 'Mahasiswa', '176'),
(327, '3042015022', 'User-Pasword', '==', '3042015022', '177'),
(328, '3042015022', 'User-Profile', ':=', 'Mahasiswa', '177'),
(329, '3042015023', 'User-Pasword', '==', '3042015023', '178'),
(330, '3042015023', 'User-Profile', ':=', 'Mahasiswa', '178'),
(331, '3042015024', 'User-Pasword', '==', '3042015024', '179'),
(332, '3042015024', 'User-Profile', ':=', 'Mahasiswa', '179'),
(333, '3042015025', 'User-Pasword', '==', '3042015025', '180'),
(334, '3042015025', 'User-Profile', ':=', 'Mahasiswa', '180'),
(335, '3042015026', 'User-Pasword', '==', '3042015026', '181'),
(336, '3042015026', 'User-Profile', ':=', 'Mahasiswa', '181'),
(337, '3042015027', 'User-Pasword', '==', '3042015027', '182'),
(338, '3042015027', 'User-Profile', ':=', 'Mahasiswa', '182'),
(339, '3042015028', 'User-Pasword', '==', '3042015028', '183'),
(340, '3042015028', 'User-Profile', ':=', 'Mahasiswa', '183'),
(341, '3042015029', 'User-Pasword', '==', '3042015029', '184'),
(342, '3042015029', 'User-Profile', ':=', 'Mahasiswa', '184'),
(343, '3042015030', 'User-Pasword', '==', '3042015030', '185'),
(344, '3042015030', 'User-Profile', ':=', 'Mahasiswa', '185'),
(345, '3042015031', 'User-Pasword', '==', '3042015031', '186'),
(346, '3042015031', 'User-Profile', ':=', 'Mahasiswa', '186'),
(347, '3042015032', 'User-Pasword', '==', '3042015032', '187'),
(348, '3042015032', 'User-Profile', ':=', 'Mahasiswa', '187'),
(349, '3042015033', 'User-Pasword', '==', '3042015033', '188'),
(350, '3042015033', 'User-Profile', ':=', 'Mahasiswa', '188'),
(351, '3042015034', 'User-Pasword', '==', '3042015034', '189'),
(352, '3042015034', 'User-Profile', ':=', 'Mahasiswa', '189'),
(353, '3042015035', 'User-Pasword', '==', '3042015035', '190'),
(354, '3042015035', 'User-Profile', ':=', 'Mahasiswa', '190'),
(355, '3042015036', 'User-Pasword', '==', '3042015036', '191'),
(356, '3042015036', 'User-Profile', ':=', 'Mahasiswa', '191'),
(357, '3042015037', 'User-Pasword', '==', '3042015037', '192'),
(358, '3042015037', 'User-Profile', ':=', 'Mahasiswa', '192'),
(359, '3042015038', 'User-Pasword', '==', '3042015038', '193'),
(360, '3042015038', 'User-Profile', ':=', 'Mahasiswa', '193'),
(361, '3042015039', 'User-Pasword', '==', '3042015039', '194'),
(362, '3042015039', 'User-Profile', ':=', 'Mahasiswa', '194'),
(363, '3042015040', 'User-Pasword', '==', '3042015040', '195'),
(364, '3042015040', 'User-Profile', ':=', 'Mahasiswa', '195'),
(365, '3042015041', 'User-Pasword', '==', '3042015041', '196'),
(366, '3042015041', 'User-Profile', ':=', 'Mahasiswa', '196'),
(367, '3042015042', 'User-Pasword', '==', '3042015042', '197'),
(368, '3042015042', 'User-Profile', ':=', 'Mahasiswa', '197'),
(369, '3042015043', 'User-Pasword', '==', '3042015043', '198'),
(370, '3042015043', 'User-Profile', ':=', 'Mahasiswa', '198'),
(371, '3042015044', 'User-Pasword', '==', '3042015044', '199'),
(372, '3042015044', 'User-Profile', ':=', 'Mahasiswa', '199'),
(373, '3042015045', 'User-Pasword', '==', '3042015045', '200'),
(374, '3042015045', 'User-Profile', ':=', 'Mahasiswa', '200'),
(375, '3042015046', 'User-Pasword', '==', '3042015046', '201'),
(376, '3042015046', 'User-Profile', ':=', 'Mahasiswa', '201'),
(377, '3042015047', 'User-Pasword', '==', '3042015047', '202'),
(378, '3042015047', 'User-Profile', ':=', 'Mahasiswa', '202'),
(379, '3042015048', 'User-Pasword', '==', '3042015048', '203'),
(380, '3042015048', 'User-Profile', ':=', 'Mahasiswa', '203'),
(381, '3042015049', 'User-Pasword', '==', '3042015049', '204'),
(382, '3042015049', 'User-Profile', ':=', 'Mahasiswa', '204'),
(383, '3042015050', 'User-Pasword', '==', '3042015050', '205'),
(384, '3042015050', 'User-Profile', ':=', 'Mahasiswa', '205'),
(385, '3042015051', 'User-Pasword', '==', '3042015051', '206'),
(386, '3042015051', 'User-Profile', ':=', 'Mahasiswa', '206'),
(387, '3042015052', 'User-Pasword', '==', '3042015052', '207'),
(388, '3042015052', 'User-Profile', ':=', 'Mahasiswa', '207'),
(389, '3042015053', 'User-Pasword', '==', '3042015053', '208'),
(390, '3042015053', 'User-Profile', ':=', 'Mahasiswa', '208'),
(391, '3042015054', 'User-Pasword', '==', '3042015054', '209'),
(392, '3042015054', 'User-Profile', ':=', 'Mahasiswa', '209'),
(393, '3042015055', 'User-Pasword', '==', '3042015055', '210'),
(394, '3042015055', 'User-Profile', ':=', 'Mahasiswa', '210'),
(395, '3042015056', 'User-Pasword', '==', '3042015056', '211'),
(396, '3042015056', 'User-Profile', ':=', 'Mahasiswa', '211'),
(397, '3042015057', 'User-Pasword', '==', '3042015057', '212'),
(398, '3042015057', 'User-Profile', ':=', 'Mahasiswa', '212'),
(399, '3042015058', 'User-Pasword', '==', '3042015058', '213'),
(400, '3042015058', 'User-Profile', ':=', 'Mahasiswa', '213'),
(401, '3042015059', 'User-Pasword', '==', '3042015059', '214'),
(402, '3042015059', 'User-Profile', ':=', 'Mahasiswa', '214'),
(403, '161180915169', 'User-Profile', ':=', 'Dosen', '215'),
(404, '161180915169', 'User-Password', '==', '161180915169', '215');

-- --------------------------------------------------------

--
-- Table structure for table `radgroupcheck`
--

CREATE TABLE `radgroupcheck` (
  `id` int(11) UNSIGNED NOT NULL,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radgroupreply`
--

CREATE TABLE `radgroupreply` (
  `id` int(11) UNSIGNED NOT NULL,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radgroupreply`
--

INSERT INTO `radgroupreply` (`id`, `groupname`, `attribute`, `op`, `value`) VALUES
(1, 'Limit-Mahasiswa', 'Mikrotik-Rate-Limit', ':=', '3M/512k'),
(2, 'Limit-Staf', 'Mikrotik-Rate-Limit', ':=', '2M/512k'),
(3, 'Limit-Dosen', 'Mikrotik-Rate-Limit', ':=', '5M/1M'),
(4, 'Disable-User', 'Auth-Type', ':=', 'Reject');

-- --------------------------------------------------------

--
-- Table structure for table `radpostauth`
--

CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL DEFAULT '',
  `reply` varchar(32) NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radreply`
--

CREATE TABLE `radreply` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radusergroup`
--

CREATE TABLE `radusergroup` (
  `id_group` int(11) NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radusergroup`
--

INSERT INTO `radusergroup` (`id_group`, `username`, `groupname`, `priority`) VALUES
(1, 'Mahasiswa', 'Limit-Mahasiswa', 3),
(2, 'Staf', 'Limit-Staf', 2),
(3, 'Dosen', 'Limit-Dosen', 1),
(4, 'DISABLE', 'Disable-User', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hak_akses`
--

CREATE TABLE `tbl_hak_akses` (
  `id` int(11) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hak_akses`
--

INSERT INTO `tbl_hak_akses` (`id`, `id_user_level`, `id_menu`) VALUES
(15, 1, 1),
(19, 1, 3),
(21, 2, 1),
(24, 1, 9),
(28, 2, 3),
(29, 2, 2),
(30, 1, 2),
(31, 1, 10),
(32, 1, 11),
(33, 1, 12),
(35, 1, 14),
(36, 1, 15),
(37, 1, 16),
(38, 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_main_menu` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL COMMENT 'y=yes,n=no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `title`, `url`, `icon`, `is_main_menu`, `is_aktif`) VALUES
(1, 'KELOLA MENU', 'kelolamenu', 'fa fa-server', 0, 'y'),
(2, 'KELOLA PENGGUNA', 'user', 'fa fa-user-o', 0, 'y'),
(3, 'level PENGGUNA', 'userlevel', 'fa fa-users', 0, 'y'),
(9, 'Contoh Form', 'welcome/form', 'fa fa-id-card', 0, 'n'),
(10, 'Data User', 'Data_User', 'fa fa-address-book', 0, 'y'),
(11, 'Setting', 'radgroupcheck', 'fa fa-bars', 0, 'y'),
(12, 'User', 'User_Inet', 'fa fa-graduation-cap', 10, 'y'),
(13, 'Import User', 'Import_Excel', 'fa fa-check', 10, 'y'),
(14, 'Profil', 'Profil_Radusergroup', 'fa fa-check', 11, 'y'),
(15, 'Limit Profil', 'Limit_Radgroupreply', 'fa fa-check', 11, 'y'),
(16, 'User Active', 'User_status', 'fa fa-wifi', 0, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id_setting` int(11) NOT NULL,
  `nama_setting` varchar(50) NOT NULL,
  `value` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id_setting`, `nama_setting`, `value`) VALUES
(1, 'Tampil Menu', 'ya');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_users` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_users`, `full_name`, `email`, `password`, `images`, `id_user_level`, `is_aktif`) VALUES
(1, 'Nuris Akbar M.Kom', 'nuris.akbar@gmail.com', '$2y$04$Wbyfv4xwihb..POfhxY5Y.jHOJqEFIG3dLfBYwAmnOACpH0EWCCdq', 'atomix_user31.png', 1, 'y'),
(3, 'Muhammad hafidz Muzaki', 'hafid@gmail.com', '$2y$04$Wbyfv4xwihb..POfhxY5Y.jHOJqEFIG3dLfBYwAmnOACpH0EWCCdq', '7.png', 2, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_inet`
--

CREATE TABLE `tbl_user_inet` (
  `id_userinet` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `ni_username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `profil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_inet`
--

INSERT INTO `tbl_user_inet` (`id_userinet`, `nama`, `ni_username`, `password`, `profil`) VALUES
(156, 'Susanti', '3042015001', '3042015001', 'Mahasiswa'),
(157, 'Devi Riani Nuradmi', '3042015002', '3042015002', 'Mahasiswa'),
(158, 'Satrio Akbar Kayung', '3042015003', '3042015003', 'Mahasiswa'),
(159, 'Ayu Prihatin', '3042015004', '3042015004', 'Mahasiswa'),
(160, 'Hidayat', '3042015005', '3042015005', 'Mahasiswa'),
(161, 'Achmad Zakiyul Wafa', '3042015006', '3042015006', 'Mahasiswa'),
(162, 'Winda Safitri', '3042015007', '3042015007', 'Mahasiswa'),
(163, 'Novi Nisa Atussalehah', '3042015008', '3042015008', 'Mahasiswa'),
(164, 'Ullan Pramasari', '3042015009', '3042015009', 'Mahasiswa'),
(165, 'Nanda Nugraha', '3042015010', '3042015010', 'Mahasiswa'),
(166, 'Nendya Putri Susanto', '3042015011', '3042015011', 'Mahasiswa'),
(167, 'Feby Sundari', '3042015012', '3042015012', 'Mahasiswa'),
(168, 'Ahmad Hafidz', '3042015013', '3042015013', 'Mahasiswa'),
(169, 'Eko Hardianto', '3042015014', '3042015014', 'Mahasiswa'),
(170, 'Winda Martasari', '3042015015', '3042015015', 'Mahasiswa'),
(171, 'Muhammad Wahyudin', '3042015016', '3042015016', 'Mahasiswa'),
(172, 'Pebri Hariansyah', '3042015017', '3042015017', 'Mahasiswa'),
(173, 'Dedi Mohtar', '3042015018', '3042015018', 'Mahasiswa'),
(174, 'M.Juni Rian Efendi', '3042015019', '3042015019', 'Mahasiswa'),
(175, 'Budi Santoso', '3042015020', '3042015020', 'Mahasiswa'),
(176, 'Utin Ana Zakiyatul Faudah', '3042015021', '3042015021', 'Mahasiswa'),
(177, 'Nada Kristina', '3042015022', '3042015022', 'Mahasiswa'),
(178, 'Suriani', '3042015023', '3042015023', 'Mahasiswa'),
(179, 'Edi Gunawan', '3042015024', '3042015024', 'Mahasiswa'),
(180, 'Muhardi', '3042015025', '3042015025', 'Mahasiswa'),
(181, 'Adriya Pratama', '3042015026', '3042015026', 'Mahasiswa'),
(182, 'Miftah Lana', '3042015027', '3042015027', 'Mahasiswa'),
(183, 'Ahmad Asuardi', '3042015028', '3042015028', 'Mahasiswa'),
(184, 'Ranimasari', '3042015029', '3042015029', 'Mahasiswa'),
(185, 'Titi Purwanti', '3042015030', '3042015030', 'Mahasiswa'),
(186, 'Frengki Firdaus', '3042015031', '3042015031', 'Mahasiswa'),
(187, 'Agung Setiawan', '3042015032', '3042015032', 'Mahasiswa'),
(188, 'June Irma Dhinita', '3042015033', '3042015033', 'Mahasiswa'),
(189, 'Satria Agung Kurnia', '3042015034', '3042015034', 'Mahasiswa'),
(190, 'Novi Tri Astuti', '3042015035', '3042015035', 'Mahasiswa'),
(191, 'Yudha Sugara Pradhana', '3042015036', '3042015036', 'Mahasiswa'),
(192, 'Nurlaila', '3042015037', '3042015037', 'Mahasiswa'),
(193, 'Syarifa Yunida', '3042015038', '3042015038', 'Mahasiswa'),
(194, 'M. Abdul Aziz', '3042015039', '3042015039', 'Mahasiswa'),
(195, 'M. Rizky', '3042015040', '3042015040', 'Mahasiswa'),
(196, 'Hamim Rizki Fadhilah', '3042015041', '3042015041', 'Mahasiswa'),
(197, 'Dimas Gilang Gumelar', '3042015042', '3042015042', 'Mahasiswa'),
(198, 'Jumiarti', '3042015043', '3042015043', 'Mahasiswa'),
(199, 'Robi Tri Wardana', '3042015044', '3042015044', 'Mahasiswa'),
(200, 'Azi Dwi Wahyudi', '3042015045', '3042015045', 'Mahasiswa'),
(201, 'Yolanda', '3042015046', '3042015046', 'Mahasiswa'),
(202, 'Wiwit', '3042015047', '3042015047', 'Mahasiswa'),
(203, 'Hadi Prianto', '3042015048', '3042015048', 'Mahasiswa'),
(204, 'Azmi Maulana', '3042015049', '3042015049', 'Mahasiswa'),
(205, 'Indah Pratiwi', '3042015050', '3042015050', 'Mahasiswa'),
(206, 'Desi Yunita', '3042015051', '3042015051', 'Mahasiswa'),
(207, 'Maria Fivanti Aso', '3042015052', '3042015052', 'Mahasiswa'),
(208, 'Jemi Saputra', '3042015053', '3042015053', 'Mahasiswa'),
(209, 'Waluyo Sejati', '3042015054', '3042015054', 'Mahasiswa'),
(210, 'Nufiah', '3042015055', '3042015055', 'Mahasiswa'),
(211, 'Ricky Pratama', '3042015056', '3042015056', 'Mahasiswa'),
(212, 'Rakhmad Riandi Nur', '3042015057', '3042015057', 'Mahasiswa'),
(213, 'Aimi Rahayu', '3042015058', '3042015058', 'Mahasiswa'),
(214, 'Erma Melianty', '3042015059', '3042015059', 'Mahasiswa'),
(215, 'Saifudin Usman, ST', '161180915169', '161180915169', 'Dosen');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_level`
--

CREATE TABLE `tbl_user_level` (
  `id_user_level` int(11) NOT NULL,
  `nama_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_level`
--

INSERT INTO `tbl_user_level` (`id_user_level`, `nama_level`) VALUES
(1, 'Super Admin'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `radacct_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `nasipaddress` varchar(64) NOT NULL,
  `framedipaddress` varchar(15) NOT NULL,
  `callingstationid` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `acctinputoctets` bigint(20) NOT NULL,
  `acctoutputoctets` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nas`
--
ALTER TABLE `nas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nasname` (`nasname`);

--
-- Indexes for table `radacct`
--
ALTER TABLE `radacct`
  ADD PRIMARY KEY (`radacctid`),
  ADD UNIQUE KEY `acctuniqueid` (`acctuniqueid`),
  ADD KEY `username` (`username`),
  ADD KEY `framedipaddress` (`framedipaddress`),
  ADD KEY `acctsessionid` (`acctsessionid`),
  ADD KEY `acctsessiontime` (`acctsessiontime`),
  ADD KEY `acctstarttime` (`acctstarttime`),
  ADD KEY `acctinterval` (`acctinterval`),
  ADD KEY `acctstoptime` (`acctstoptime`),
  ADD KEY `nasipaddress` (`nasipaddress`);

--
-- Indexes for table `radcheck`
--
ALTER TABLE `radcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `radgroupcheck`
--
ALTER TABLE `radgroupcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupname` (`groupname`(32));

--
-- Indexes for table `radgroupreply`
--
ALTER TABLE `radgroupreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupname` (`groupname`(32));

--
-- Indexes for table `radpostauth`
--
ALTER TABLE `radpostauth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radreply`
--
ALTER TABLE `radreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `radusergroup`
--
ALTER TABLE `radusergroup`
  ADD PRIMARY KEY (`id_group`);

--
-- Indexes for table `tbl_hak_akses`
--
ALTER TABLE `tbl_hak_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `tbl_user_inet`
--
ALTER TABLE `tbl_user_inet`
  ADD PRIMARY KEY (`id_userinet`);

--
-- Indexes for table `tbl_user_level`
--
ALTER TABLE `tbl_user_level`
  ADD PRIMARY KEY (`id_user_level`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `radacct_id` (`radacct_id`),
  ADD KEY `username` (`username`),
  ADD KEY `nasipaddress` (`nasipaddress`),
  ADD KEY `callingstationid` (`callingstationid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nas`
--
ALTER TABLE `nas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radacct`
--
ALTER TABLE `radacct`
  MODIFY `radacctid` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radcheck`
--
ALTER TABLE `radcheck`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT for table `radgroupcheck`
--
ALTER TABLE `radgroupcheck`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radgroupreply`
--
ALTER TABLE `radgroupreply`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `radpostauth`
--
ALTER TABLE `radpostauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radreply`
--
ALTER TABLE `radreply`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radusergroup`
--
ALTER TABLE `radusergroup`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_hak_akses`
--
ALTER TABLE `tbl_hak_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user_inet`
--
ALTER TABLE `tbl_user_inet`
  MODIFY `id_userinet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `tbl_user_level`
--
ALTER TABLE `tbl_user_level`
  MODIFY `id_user_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
