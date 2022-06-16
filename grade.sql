-- -------------------------------------------------------------
-- TablePlus 4.6.8(424)
--
-- https://tableplus.com/
--
-- Database: grade
-- Generation Time: 2022-06-16 11:24:30.8060
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `enseignants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `etudiants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numeroEtudiant` bigint DEFAULT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `groupe` bigint DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `coefficient` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `examens` int DEFAULT NULL,
  `etudiant` int DEFAULT NULL,
  `note` bigint DEFAULT NULL,
  `appreciation` mediumblob,
  PRIMARY KEY (`id`),
  KEY `etudiant` (`etudiant`),
  KEY `examens` (`examens`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`etudiant`) REFERENCES `etudiants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`examens`) REFERENCES `examens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ressourcesUe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codeRessource` int DEFAULT NULL,
  `nom` int DEFAULT NULL,
  `descriptif` varchar(255) DEFAULT NULL,
  `coefficient` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nom` (`nom`),
  CONSTRAINT `ressourcesue_ibfk_1` FOREIGN KEY (`nom`) REFERENCES `ue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` int DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `semestre` int DEFAULT NULL,
  `ects` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add auth group', 13, 'add_authgroup'),
(26, 'Can change auth group', 13, 'change_authgroup'),
(27, 'Can delete auth group', 13, 'delete_authgroup'),
(28, 'Can view auth group', 13, 'view_authgroup'),
(29, 'Can add auth group permissions', 14, 'add_authgrouppermissions'),
(30, 'Can change auth group permissions', 14, 'change_authgrouppermissions'),
(31, 'Can delete auth group permissions', 14, 'delete_authgrouppermissions'),
(32, 'Can view auth group permissions', 14, 'view_authgrouppermissions'),
(33, 'Can add auth permission', 15, 'add_authpermission'),
(34, 'Can change auth permission', 15, 'change_authpermission'),
(35, 'Can delete auth permission', 15, 'delete_authpermission'),
(36, 'Can view auth permission', 15, 'view_authpermission'),
(37, 'Can add auth user', 16, 'add_authuser'),
(38, 'Can change auth user', 16, 'change_authuser'),
(39, 'Can delete auth user', 16, 'delete_authuser'),
(40, 'Can view auth user', 16, 'view_authuser'),
(41, 'Can add auth user groups', 17, 'add_authusergroups'),
(42, 'Can change auth user groups', 17, 'change_authusergroups'),
(43, 'Can delete auth user groups', 17, 'delete_authusergroups'),
(44, 'Can view auth user groups', 17, 'view_authusergroups'),
(45, 'Can add auth user user permissions', 18, 'add_authuseruserpermissions'),
(46, 'Can change auth user user permissions', 18, 'change_authuseruserpermissions'),
(47, 'Can delete auth user user permissions', 18, 'delete_authuseruserpermissions'),
(48, 'Can view auth user user permissions', 18, 'view_authuseruserpermissions'),
(49, 'Can add django admin log', 19, 'add_djangoadminlog'),
(50, 'Can change django admin log', 19, 'change_djangoadminlog'),
(51, 'Can delete django admin log', 19, 'delete_djangoadminlog'),
(52, 'Can view django admin log', 19, 'view_djangoadminlog'),
(53, 'Can add django content type', 20, 'add_djangocontenttype'),
(54, 'Can change django content type', 20, 'change_djangocontenttype'),
(55, 'Can delete django content type', 20, 'delete_djangocontenttype'),
(56, 'Can view django content type', 20, 'view_djangocontenttype'),
(57, 'Can add django migrations', 21, 'add_djangomigrations'),
(58, 'Can change django migrations', 21, 'change_djangomigrations'),
(59, 'Can delete django migrations', 21, 'delete_djangomigrations'),
(60, 'Can view django migrations', 21, 'view_djangomigrations'),
(61, 'Can add django session', 22, 'add_djangosession'),
(62, 'Can change django session', 22, 'change_djangosession'),
(63, 'Can delete django session', 22, 'delete_djangosession'),
(64, 'Can view django session', 22, 'view_djangosession'),
(65, 'Can add enseignants', 11, 'add_enseignants'),
(66, 'Can change enseignants', 11, 'change_enseignants'),
(67, 'Can delete enseignants', 11, 'delete_enseignants'),
(68, 'Can view enseignants', 11, 'view_enseignants'),
(69, 'Can add etudiants', 7, 'add_etudiants'),
(70, 'Can change etudiants', 7, 'change_etudiants'),
(71, 'Can delete etudiants', 7, 'delete_etudiants'),
(72, 'Can view etudiants', 7, 'view_etudiants'),
(73, 'Can add examens', 12, 'add_examens'),
(74, 'Can change examens', 12, 'change_examens'),
(75, 'Can delete examens', 12, 'delete_examens'),
(76, 'Can view examens', 12, 'view_examens'),
(77, 'Can add notes', 8, 'add_notes'),
(78, 'Can change notes', 8, 'change_notes'),
(79, 'Can delete notes', 8, 'delete_notes'),
(80, 'Can view notes', 8, 'view_notes'),
(81, 'Can add ressourcesue', 10, 'add_ressourcesue'),
(82, 'Can change ressourcesue', 10, 'change_ressourcesue'),
(83, 'Can delete ressourcesue', 10, 'delete_ressourcesue'),
(84, 'Can view ressourcesue', 10, 'view_ressourcesue'),
(85, 'Can add ue', 9, 'add_ue'),
(86, 'Can change ue', 9, 'change_ue'),
(87, 'Can delete ue', 9, 'delete_ue'),
(88, 'Can view ue', 9, 'view_ue');

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$LO1q9vwLItZ7$cEi7pgDGi2J9u8qpfVSMTt0yUo4/uFN42OP4y3Zgrj4=', '2022-06-02 17:18:23.407882', 1, 'martin', '', '', 'martin.bmgtnr@gmail.com', 1, 1, '2022-05-27 16:19:34.617442');

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-27 16:24:22.110182', '1', 'Arnaud Albert', 1, '[{\"added\": {}}]', 11, 1),
(2, '2022-05-27 16:24:43.531234', '1', 'Baumgaertner Martin', 1, '[{\"added\": {}}]', 7, 1),
(3, '2022-05-27 16:24:54.129569', '1', 'maths', 1, '[{\"added\": {}}]', 12, 1),
(4, '2022-05-27 16:25:10.501193', '1', 'Note de Baumgaertner Martin à l\'examen de maths', 1, '[{\"added\": {}}]', 8, 1),
(5, '2022-05-27 16:25:24.194023', '1', 'Ue object (1)', 1, '[{\"added\": {}}]', 9, 1),
(6, '2022-05-27 16:25:36.026309', '1', 'Ressourcesue object (1)', 1, '[{\"added\": {}}]', 10, 1),
(7, '2022-06-02 17:19:11.192503', '1', 'Baumgaertner Martin', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 7, 1),
(8, '2022-06-02 17:23:58.784693', '8', 'Bloul Fayçal', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 7, 1),
(9, '2022-06-02 17:25:13.896368', '9', 'martin martin', 3, '', 7, 1),
(10, '2022-06-02 17:25:44.860354', '1', 'Baumgaertner Martin', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 7, 1),
(11, '2022-06-02 17:26:16.667152', '8', 'Bloul Fayçal', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 7, 1),
(12, '2022-06-02 17:26:54.655144', '10', 'martin martin', 3, '', 7, 1),
(13, '2022-06-02 17:33:37.148312', '1', 'Baumgaertner Martin', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 7, 1),
(14, '2022-06-02 17:38:06.652672', '1', 'Baumgaertner Martin', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 7, 1),
(15, '2022-06-02 17:38:38.056896', '8', 'Bloul Fayçal', 3, '', 7, 1),
(16, '2022-06-02 17:38:38.058680', '7', 'Dubois Phillipe', 3, '', 7, 1),
(17, '2022-06-02 17:38:38.059439', '6', 'Mohareb Yassem', 3, '', 7, 1),
(18, '2022-06-02 17:38:38.060176', '5', 'Autre Etufiant5', 3, '', 7, 1),
(19, '2022-06-02 17:38:38.061233', '4', 'Egly Lucas', 3, '', 7, 1),
(20, '2022-06-02 17:38:38.062171', '3', 'Chevalier Hugo', 3, '', 7, 1),
(21, '2022-06-02 17:38:38.063409', '2', 'Mikhail Karapetyan', 3, '', 7, 1),
(22, '2022-06-02 17:42:03.491970', '11', 'Karapetyan Mikhail', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 7, 1),
(23, '2022-06-03 14:09:14.779547', '13', 'Mohareb Yassem', 3, '', 7, 1),
(24, '2022-06-03 14:09:59.364102', '14', 'Gacougnolle Titouan', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 7, 1),
(25, '2022-06-03 14:10:16.562862', '14', 'Gacougnolle Titouan', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 7, 1),
(26, '2022-06-03 14:10:27.019508', '14', 'Gacougnolle Titouan', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 7, 1),
(27, '2022-06-03 14:10:46.825995', '14', 'Gacougnolle Titouan', 2, '[]', 7, 1),
(28, '2022-06-05 11:09:20.123595', '15', 'Koehl Laura', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 7, 1),
(29, '2022-06-05 11:10:08.672844', '15', 'Koehl Laura', 3, '', 7, 1);

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'notes', 'etudiants'),
(8, 'notes', 'notes'),
(9, 'notes', 'ue'),
(10, 'notes', 'ressourcesue'),
(11, 'notes', 'enseignants'),
(12, 'notes', 'examens'),
(13, 'notes', 'authgroup'),
(14, 'notes', 'authgrouppermissions'),
(15, 'notes', 'authpermission'),
(16, 'notes', 'authuser'),
(17, 'notes', 'authusergroups'),
(18, 'notes', 'authuseruserpermissions'),
(19, 'notes', 'djangoadminlog'),
(20, 'notes', 'djangocontenttype'),
(21, 'notes', 'djangomigrations'),
(22, 'notes', 'djangosession');

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-27 16:18:17.552497'),
(2, 'auth', '0001_initial', '2022-05-27 16:18:17.641755'),
(3, 'admin', '0001_initial', '2022-05-27 16:18:17.663607'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-27 16:18:17.666817'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-27 16:18:17.669850'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-27 16:18:17.686958'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-27 16:18:17.697682'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-27 16:18:17.704533'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-27 16:18:17.707446'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-27 16:18:17.717310'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-27 16:18:17.718142'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-27 16:18:17.721019'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-27 16:18:17.732387'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-27 16:18:17.745095'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-27 16:18:17.751696'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-27 16:18:17.754820'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-27 16:18:17.766887'),
(18, 'notes', '0001_initial', '2022-05-27 16:18:17.829479'),
(19, 'notes', '0002_delete_eleve_delete_enseignants_delete_etudiant_and_more', '2022-05-27 16:18:17.843041'),
(20, 'notes', '0003_initial', '2022-05-27 16:18:17.849103'),
(21, 'notes', '0004_delete_authgroup_delete_authgrouppermissions_and_more', '2022-05-27 16:18:17.852076'),
(22, 'sessions', '0001_initial', '2022-05-27 16:18:17.857891'),
(23, 'notes', '0005_initial', '2022-05-30 07:17:13.789456');

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('aqoy5ldm0lypf8y6l736hg3rsb64cs5e', '.eJxVjDsOwjAQBe_iGln-bBybkp4zRLvrDQ4gR4qTCnF3iJQC2jcz76UG3NYybE2WYcrqrKw6_W6E_JC6g3zHeps1z3VdJtK7og_a9HXO8rwc7t9BwVa-dTJG2ANCsHH0owBn13dGMkVkgsjCIVHCjn0YLfeU-gDZdcZ6BHak3h_3Gzha:1nucgh:yV8FVVkLbN-iQeXp97JM5moa41CgQf4ntBZwiHQl_cw', '2022-06-10 16:19:43.456701'),
('xlwmxsruzy07eemyglh7qcehmcqh66h9', 'YWYyMWNkN2I5MjZjZWJjYjY0ZGQwNjE3YWUxZTM3YzU4MmQwNTcxYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MGQ0Njk3ZGY1MzllZjU2NmZhYzVmNGVjMjZjNTEzNTZjMTJjZjA4In0=', '2022-06-16 17:18:23.408901');

INSERT INTO `enseignants` (`id`, `nom`, `prenom`) VALUES
(1, 'Arnaud', 'Albert');

INSERT INTO `etudiants` (`id`, `numeroEtudiant`, `nom`, `prenom`, `groupe`, `photo`, `email`) VALUES
(21, 100, 'Antony', 'Baptiste', 12, 'images/pdp.png', 'antony.baptiste@uha.fr'),
(22, 100, 'Aureli', 'Massimo', 12, 'images/pdp_N7RT8Vx.png', 'massimo.aureli@uha.fr'),
(23, 100, 'Batjari', 'Elmir', 12, 'images/pdp_8dxyVHE.png', 'elmir.batajri@uha.fr'),
(24, 100, 'Baumgaertner', 'Martin', 11, 'images/pdp_CcwiEoY.png', 'martin.baum@uha.fr'),
(25, 100, 'Beavy', 'Elise', 11, 'images/pdp_lJ6RrBg.png', 'elise.beauvy@uha.fr'),
(26, 100, 'Bengah', 'Tareq', 11, 'images/pdp_yQOGYPN.png', 'tareq.bengah@uha.fr'),
(27, 100, 'Bilger', 'Thomas', 11, 'images/pdp_MFuUjrP.png', 'thomas.bilger@uha.fr'),
(28, 100, 'Bloub', 'Fayçal', 11, 'images/pdp_eOQt9lh.png', 'faycal.bloul@uha.fr'),
(29, 11, 'Boudama', 'Bahir', 13, 'images/pdp_vsyCbeM.png', 'bahir.boudama@uha.fr'),
(30, 100, 'Brutshy', 'Jules', 11, 'images/pdp_yUj79cX.png', 'jules.brutshy@uha.fr'),
(31, 100, 'Cazal', 'Réné', 12, 'images/pdp_pJwTZK6.png', 'rene.cazal@uha.fr'),
(32, 100, 'Chaboisseau', 'Enzo', 12, 'images/pdp_aLKePvI.png', 'enzo.chaboisseau@uha.fr'),
(33, 100, 'Chevalier', 'Hugo', 11, 'images/pdp_EryUdOj.png', 'hugo.chevalier@uha.fr'),
(34, 100, 'Claudel', 'Louis', 12, 'images/pdp_TCmyshw.png', 'louis.claudel@uha.fr'),
(35, 100, 'Cristel', 'Emeline', 11, 'images/pdp_4WewXww.png', 'emeline.cristel@uha.fr'),
(36, 100, 'Cuney', 'Matteo', 12, 'images/pdp_PhCq3go.png', 'matteo.cuney@uha.fr'),
(37, 100, 'Daoudi', 'Khalil', 12, 'images/pdp_zXaWYJm.png', 'khalil.daoudi@uha.fr'),
(38, 100, 'Demirbag', 'Daniel', 13, 'images/pdp_vttPREU.png', 'daniel.demirbag@uha.fr'),
(39, 100, 'Descamps', 'Nathan', 13, 'images/pdp_CPw6KV6.png', 'nathan.descamps@uha.fr'),
(40, 100, 'Descieux', 'Esteban', 11, 'images/pdp_FE6s9L4.png', 'esteban.descieux@uha.fr'),
(41, 100, 'Desvernois', 'Louis', 11, 'images/pdp_coddGol.png', 'louis.devernois@uha.fr'),
(42, 100, 'Dib', 'Rayane', 11, 'images/pdp_AzXFmML.png', 'rayane.dib@uha.fr'),
(43, 100, 'Doghmane', 'Saji', 11, 'images/pdp_JgnPEyM.png', 'saji.doghman@uha.fr'),
(44, 100, 'Dubois', 'Phillipe', 11, 'images/pdp_xrcZ3iB.png', 'phillipe.dubois@uha.fr'),
(45, 100, 'Edel-Viaux', 'Thomas', 12, 'images/pdp_dcN6j91.png', 'thomas.edel-viaux@uha.fr'),
(46, 100, 'Egly', 'Lucas', 11, 'images/pdp_6WyW00I.png', 'lucas.egly@uha.fr'),
(47, 100, 'Eraslan', 'Emir', 12, 'images/pdp_rWyfnRs.png', 'emir.eraslan@uha.fr'),
(48, 100, 'Firzan', 'Zava', 13, 'images/pdp_8lx2I3Q.png', 'zava.firzan@uha.fr'),
(49, 100, 'Gacougnolle', 'Titouan', 12, 'images/pdp_LS0znXq.png', 'titouan.gacoug@uha.fr'),
(50, 100, 'Gander', 'Nathan', 13, 'images/pdp_8Dj4oSA.png', 'nathan.descamps@uha.fr'),
(51, 100, 'Gasser', 'Stephane', 12, 'images/pdp_jYEBxq9.png', 'stephane.gaser@uha.fr'),
(52, 100, 'Grenot', 'Sarah', 11, 'images/pdp_DzTR8jf.png', 'sarah.grenot@uha.f'),
(53, 100, 'Guilhot', 'Emilie', 12, 'images/pdp_3TubYQJ.png', 'emilie.guilhot@uha.fr'),
(54, 100, 'Halbout', 'Ernest', 13, 'images/pdp_9IzKsp8.png', 'ernest.halbout@uha.fr'),
(55, 100, 'Hertrich', 'William', 12, 'images/pdp_dYamTBm.png', 'william.hertrich@uha.fr'),
(56, 100, 'Jacob', 'Louis', 12, 'images/pdp_b3MtjnD.png', 'louis.jacob@uha.fr'),
(57, 100, 'Karapetyan', 'Mikhail', 12, 'images/pdp_3RbwpBe.png', 'mikhail.karapetyan@uha.fr'),
(58, 100, 'Kayser', 'Nicolas', 13, 'images/pdp_NyQmEJc.png', 'nicolas.kayser@uha.fr'),
(59, 100, 'Lamine', 'Elias', 12, 'images/pdp_BOSIOSe.png', 'elias.lamine@uha.fr'),
(60, 100, 'Lamontagne', 'Olivier', 12, 'images/pdp_fsBdkBO.png', 'olivier.lamontagnz@uha?fr'),
(61, 100, 'Landeau', 'Charles', 12, 'images/pdp_HoPV5qU.png', 'charles.landeau@uha.fr'),
(62, 100, 'Long', 'Valentin', 12, 'images/pdp_RPVWirL.png', 'valentin.long@uha.fr'),
(63, 100, 'Losser', 'Julien', 12, 'images/pdp_AYJ0Q8Y.png', 'julien.losser@uha.fr'),
(64, 100, 'Magnan', 'Anthony', 12, 'images/pdp_3f1d5Cl.png', 'anthony.magnan@uha.fr'),
(65, 100, 'Maitre', 'Gregory', 13, 'images/pdp_uNaqnER.png', 'gregory.maitre@uha.fr'),
(66, 100, 'Mohareb', 'Yassem', 11, 'images/pdp_9iBSMxK.png', 'yassem.mohareb@uha.fr'),
(67, 100, 'Monchaux', 'Jade', 11, 'images/pdp_Ge1SMPB.png', 'jade.monchaux@uha.fr'),
(68, 100, 'Pacorel', 'Francesco', 13, 'images/pdp_C6v7aqj.png', 'francesco.pacorel@uha.fr'),
(69, 100, 'Pluviose', 'Louis', 13, 'images/pdp_OhM37pP.png', 'louis.pluviose@uha.fr'),
(70, 100, 'Prevost', 'Mathieu', 12, 'images/pdp_uvj5Svs.png', 'mathieu.prevost@uha.fr'),
(71, 100, 'Rashiti', 'Shpend', 12, 'images/pdp_g6pinSw.png', 'shpend.rashiti@uha.fr'),
(72, 100, 'Rehm', 'Mehdi', 12, 'images/pdp_Bqo0ZjD.png', 'mehdi.rehm@uha.fr'),
(73, 100, 'Romeo', 'Raphael', 13, 'images/pdp_BZrMJ2m.png', 'raphael.romeo@uha.fr'),
(74, 100, 'Scheider', 'Candice', 11, 'images/pdp_rmv5yq7.png', 'candice.shneider@uha.fr'),
(75, 100, 'Schoenn', 'Alexis', 13, 'images/pdp_Mjm9hj7.png', 'alexis.schoenn@uha.fr'),
(76, 100, 'Schrenck', 'Tiphaine', 11, 'images/pdp_9nJYBws.png', 'tiphaine.schrenk@uha.fr'),
(77, 100, 'Sembe', 'Jomath', 12, 'images/pdp_jvzrjcI.png', 'jomath.sembe@uha.fr'),
(78, 100, 'Strub', 'Thomas', 13, 'images/pdp_Aa1k0JP.png', 'thomas.strub@uha.fr'),
(79, 100, 'Tefang', 'Ivan', 13, 'images/pdp_MLdrtR1.png', 'ivan.tefang@uha.fr'),
(80, 100, 'Chollier', 'Liam', 11, 'images/pdp_Hi51xfE.png', 'liam.thomas@uha.fr'),
(81, 100, 'Uetwiller', 'Victor', 11, 'images/pdp_DUYSvYA.png', 'victor.uetwiller@uha.fr'),
(82, 100, 'Wagner', 'Nicolas', 11, 'images/pdp_CbTzB3n.png', 'nicolas.wagner@uha.fr'),
(83, 100, 'Weber', 'Julien', 12, 'images/pdp_2BglTGm.png', 'julien.weber@uha.fr'),
(84, 100, 'Zenner', 'Noe', 12, 'images/pdp_plVx6lE.png', 'noe.zenner@uha.fr');

INSERT INTO `examens` (`id`, `titre`, `date`, `coefficient`) VALUES
(3, 'R214 - Mathématiques des sytèmes numériques', '2022-05-12', 7),
(4, 'SAE 23 - Mettre en place une solution informatique pour l\'entreprise', '2022-06-17', 20);

INSERT INTO `notes` (`id`, `examens`, `etudiant`, `note`, `appreciation`) VALUES
(35, 4, 57, 20, 'Bravo');

INSERT INTO `ue` (`id`, `code`, `nom`, `semestre`, `ects`) VALUES
(2, 1, 'UE1', 1, 29);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;