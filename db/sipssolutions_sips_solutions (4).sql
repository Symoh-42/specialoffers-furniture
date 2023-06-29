-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 31, 2022 at 10:24 AM
-- Server version: 5.7.40-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sipssolutions_sips_solutions`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_account`
--

CREATE TABLE `accounts_account` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_account`
--

INSERT INTO `accounts_account` (`id`, `password`, `first_name`, `last_name`, `username`, `email`, `phone_number`, `date_joined`, `last_login`, `is_admin`, `is_staff`, `is_active`, `is_superadmin`) VALUES
(1, 'pbkdf2_sha256$260000$NTR7HEoXOvycY1I1boDG6v$yB4JLmHNvJEPlBqR+N8yeRyqLJwoIbkQ6MoBb1BIS8c=', 'Simeon', 'Mwangi', 'msimeon937', 'msimeon937@gmail.com', '+254704662432', '2022-11-10 11:24:38.465009', '2022-12-31 09:09:37.055921', 1, 1, 1, 1),
(2, 'pbkdf2_sha256$260000$7MGHC2s3ILkn6AEfdWKZ2U$wDgV+cAk3YibkAAT/8tGAA8Nt5OSi0PLLhDZIH4nxhw=', 'Ranja', 'Calvin', 'ranjacalvin', 'ranjacalvin@gmail.com', '0726646600', '2022-11-17 20:28:40.900183', '2022-12-20 07:55:36.719200', 1, 1, 1, 1),
(3, 'pbkdf2_sha256$260000$3Rht5FvpQ2TEE9d8PPYNFx$/AuPiif2CM9YyiRAGnSvrEWhb7QIdK2XcnD7bVsbnKY=', 'James', 'Kibe', 'James Kibe', 'kibsfor2030@gmail.com', '0720650146', '2022-12-31 09:41:55.622972', '2022-12-31 09:43:40.842820', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_userprofile`
--

CREATE TABLE `accounts_userprofile` (
  `id` int(11) NOT NULL,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(100) NOT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `county` varchar(20) NOT NULL,
  `subcounty` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add account', 6, 'add_account'),
(22, 'Can change account', 6, 'change_account'),
(23, 'Can delete account', 6, 'delete_account'),
(24, 'Can view account', 6, 'view_account'),
(25, 'Can add user profile', 7, 'add_userprofile'),
(26, 'Can change user profile', 7, 'change_userprofile'),
(27, 'Can delete user profile', 7, 'delete_userprofile'),
(28, 'Can view user profile', 7, 'view_userprofile'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add variation', 10, 'add_variation'),
(38, 'Can change variation', 10, 'change_variation'),
(39, 'Can delete variation', 10, 'delete_variation'),
(40, 'Can view variation', 10, 'view_variation'),
(41, 'Can add review rating', 11, 'add_reviewrating'),
(42, 'Can change review rating', 11, 'change_reviewrating'),
(43, 'Can delete review rating', 11, 'delete_reviewrating'),
(44, 'Can view review rating', 11, 'view_reviewrating'),
(45, 'Can add Product Gallery', 12, 'add_productgallery'),
(46, 'Can change Product Gallery', 12, 'change_productgallery'),
(47, 'Can delete Product Gallery', 12, 'delete_productgallery'),
(48, 'Can view Product Gallery', 12, 'view_productgallery'),
(49, 'Can add Marketing Image', 13, 'add_marketingimages'),
(50, 'Can change Marketing Image', 13, 'change_marketingimages'),
(51, 'Can delete Marketing Image', 13, 'delete_marketingimages'),
(52, 'Can view Marketing Image', 13, 'view_marketingimages'),
(53, 'Can add sub_ category', 14, 'add_sub_category'),
(54, 'Can change sub_ category', 14, 'change_sub_category'),
(55, 'Can delete sub_ category', 14, 'delete_sub_category'),
(56, 'Can view sub_ category', 14, 'view_sub_category'),
(57, 'Can add cart', 15, 'add_cart'),
(58, 'Can change cart', 15, 'change_cart'),
(59, 'Can delete cart', 15, 'delete_cart'),
(60, 'Can view cart', 15, 'view_cart'),
(61, 'Can add cart item', 16, 'add_cartitem'),
(62, 'Can change cart item', 16, 'change_cartitem'),
(63, 'Can delete cart item', 16, 'delete_cartitem'),
(64, 'Can view cart item', 16, 'view_cartitem'),
(65, 'Can add order', 17, 'add_order'),
(66, 'Can change order', 17, 'change_order'),
(67, 'Can delete order', 17, 'delete_order'),
(68, 'Can view order', 17, 'view_order'),
(69, 'Can add payment', 18, 'add_payment'),
(70, 'Can change payment', 18, 'change_payment'),
(71, 'Can delete payment', 18, 'delete_payment'),
(72, 'Can view payment', 18, 'view_payment'),
(73, 'Can add Order Product', 19, 'add_orderproduct'),
(74, 'Can change Order Product', 19, 'change_orderproduct'),
(75, 'Can delete Order Product', 19, 'delete_orderproduct'),
(76, 'Can view Order Product', 19, 'view_orderproduct'),
(77, 'Can add Wish List', 20, 'add_wishlist'),
(78, 'Can change Wish List', 20, 'change_wishlist'),
(79, 'Can delete Wish List', 20, 'delete_wishlist'),
(80, 'Can view Wish List', 20, 'view_wishlist'),
(81, 'Can add Mpesa Payment', 21, 'add_mpesapayment'),
(82, 'Can change Mpesa Payment', 21, 'change_mpesapayment'),
(83, 'Can delete Mpesa Payment', 21, 'delete_mpesapayment'),
(84, 'Can view Mpesa Payment', 21, 'view_mpesapayment'),
(85, 'Can add Mpesa Payment CallBack', 22, 'add_mpesapaymentcallback'),
(86, 'Can change Mpesa Payment CallBack', 22, 'change_mpesapaymentcallback'),
(87, 'Can delete Mpesa Payment CallBack', 22, 'delete_mpesapaymentcallback'),
(88, 'Can view Mpesa Payment CallBack', 22, 'view_mpesapaymentcallback'),
(89, 'Can add Contact', 23, 'add_contactus'),
(90, 'Can change Contact', 23, 'change_contactus'),
(91, 'Can delete Contact', 23, 'delete_contactus'),
(92, 'Can view Contact', 23, 'view_contactus'),
(93, 'Can add help center', 24, 'add_helpcenter'),
(94, 'Can change help center', 24, 'change_helpcenter'),
(95, 'Can delete help center', 24, 'delete_helpcenter'),
(96, 'Can view help center', 24, 'view_helpcenter'),
(97, 'Can add blog post', 25, 'add_blogpost'),
(98, 'Can change blog post', 25, 'change_blogpost'),
(99, 'Can delete blog post', 25, 'delete_blogpost'),
(100, 'Can view blog post', 25, 'view_blogpost'),
(101, 'Can add blog author', 26, 'add_blogauthor'),
(102, 'Can change blog author', 26, 'change_blogauthor'),
(103, 'Can delete blog author', 26, 'delete_blogauthor'),
(104, 'Can view blog author', 26, 'view_blogauthor'),
(105, 'Can add newsletter', 27, 'add_newsletter'),
(106, 'Can change newsletter', 27, 'change_newsletter'),
(107, 'Can delete newsletter', 27, 'delete_newsletter'),
(108, 'Can view newsletter', 27, 'view_newsletter'),
(109, 'Can add youtube video', 28, 'add_youtubevideo'),
(110, 'Can change youtube video', 28, 'change_youtubevideo'),
(111, 'Can delete youtube video', 28, 'delete_youtubevideo'),
(112, 'Can view youtube video', 28, 'view_youtubevideo'),
(113, 'Can add comments', 29, 'add_comments'),
(114, 'Can change comments', 29, 'change_comments'),
(115, 'Can delete comments', 29, 'delete_comments'),
(116, 'Can view comments', 29, 'view_comments'),
(117, 'Can add social urls', 30, 'add_socialurls'),
(118, 'Can change social urls', 30, 'change_socialurls'),
(119, 'Can delete social urls', 30, 'delete_socialurls'),
(120, 'Can view social urls', 30, 'view_socialurls'),
(121, 'Can add Social Url', 31, 'add_socialmedia'),
(122, 'Can change Social Url', 31, 'change_socialmedia'),
(123, 'Can delete Social Url', 31, 'delete_socialmedia'),
(124, 'Can view Social Url', 31, 'view_socialmedia'),
(125, 'Can add Social Media', 32, 'add_socials'),
(126, 'Can change Social Media', 32, 'change_socials'),
(127, 'Can delete Social Media', 32, 'delete_socials'),
(128, 'Can view Social Media', 32, 'view_socials');

-- --------------------------------------------------------

--
-- Table structure for table `blog_blogauthor`
--

CREATE TABLE `blog_blogauthor` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_name` varchar(200) NOT NULL,
  `author_image` varchar(100) NOT NULL,
  `about_author` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_blogpost`
--

CREATE TABLE `blog_blogpost` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `blog_intro` longtext NOT NULL,
  `blog_description` longtext NOT NULL,
  `cover_image` varchar(100) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `content` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `blog_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_helpcenter`
--

CREATE TABLE `blog_helpcenter` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `question` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_newsletter`
--

CREATE TABLE `blog_newsletter` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `email` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_youtubevideo`
--

CREATE TABLE `blog_youtubevideo` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `youtube_url` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carts_cart`
--

CREATE TABLE `carts_cart` (
  `id` int(11) NOT NULL,
  `cart_id` varchar(250) NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts_cart`
--

INSERT INTO `carts_cart` (`id`, `cart_id`, `date_added`) VALUES
(1, 'c3x9bz99fzpxfatr70k6yx5su69nz664', '2022-11-14'),
(2, 'i5vgth6k1ib4gt6xplcpmeit11oyiife', '2022-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `carts_cartitem`
--

CREATE TABLE `carts_cartitem` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carts_cartitem_variations`
--

CREATE TABLE `carts_cartitem_variations` (
  `id` int(11) NOT NULL,
  `cartitem_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_category`
--

CREATE TABLE `category_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `category_image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_category`
--

INSERT INTO `category_category` (`id`, `category_name`, `slug`, `category_image`, `created_at`) VALUES
(1, 'Office', 'office', 'photos/categories/1.png', '2022-11-10 12:54:47.335866'),
(2, 'Outdoor', 'outdoor', 'photos/categories/2.png', '2022-11-10 12:55:04.041220'),
(3, 'Home Decor', 'home-decor', 'photos/categories/3.png', '2022-11-10 13:00:12.736805'),
(4, 'Interior', 'interior', 'photos/categories/4.png', '2022-11-11 07:25:08.858113'),
(5, 'sofa', 'sofa', '', '2022-12-30 16:59:08.625811');

-- --------------------------------------------------------

--
-- Table structure for table `contact_contactus`
--

CREATE TABLE `contact_contactus` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contact_socials`
--

CREATE TABLE `contact_socials` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_socials`
--

INSERT INTO `contact_socials` (`id`, `created_at`, `updated_at`, `name`, `url`) VALUES
(1, '2022-11-11 09:35:24.606479', '2022-11-11 09:35:24.606479', 'facebook', 'https://www.facebook.com/sipssolutions'),
(2, '2022-11-11 09:35:33.592798', '2022-11-11 09:35:33.592798', 'twitter', ''),
(3, '2022-11-11 09:36:02.843105', '2022-11-11 09:36:02.843105', 'linkedin', ''),
(4, '2022-11-11 09:36:11.514711', '2022-11-11 09:36:11.514711', 'instagram', ''),
(5, '2022-11-11 09:36:24.185415', '2022-11-11 09:36:24.185415', 'youtube', ''),
(6, '2022-11-11 09:36:39.075372', '2022-11-11 09:36:39.075372', 'tiktok', '');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-11-10 12:54:47.716242', '1', 'Office', 1, '[{\"added\": {}}]', 8, 1),
(2, '2022-11-10 12:55:04.070291', '2', 'Outdoor', 1, '[{\"added\": {}}]', 8, 1),
(3, '2022-11-10 13:00:12.755833', '3', 'Home Decor', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-11-10 13:05:40.545064', '1', 'Waiting Chairs', 1, '[{\"added\": {}}]', 14, 1),
(5, '2022-11-10 13:06:04.761116', '2', 'Executive Desks', 1, '[{\"added\": {}}]', 14, 1),
(6, '2022-11-10 13:06:33.381536', '3', 'Executive Chairs', 1, '[{\"added\": {}}]', 14, 1),
(7, '2022-11-10 13:07:28.086572', '4', 'Workstation', 1, '[{\"added\": {}}]', 14, 1),
(8, '2022-11-10 13:08:14.244871', '5', 'Visitor\'s Seats', 1, '[{\"added\": {}}]', 14, 1),
(9, '2022-11-10 13:09:15.074441', '6', 'Boardroom Set', 1, '[{\"added\": {}}]', 14, 1),
(10, '2022-11-10 13:19:10.730412', '1', 'Product 001', 1, '[{\"added\": {}}]', 9, 1),
(11, '2022-11-10 13:21:59.213427', '2', 'Product-002', 1, '[{\"added\": {}}]', 9, 1),
(12, '2022-11-10 13:23:57.457052', '3', 'Product-003', 1, '[{\"added\": {}}]', 9, 1),
(13, '2022-11-10 13:25:19.090448', '4', 'Product-004', 1, '[{\"added\": {}}]', 9, 1),
(14, '2022-11-10 13:27:30.839124', '5', 'Product 005', 1, '[{\"added\": {}}]', 9, 1),
(15, '2022-11-10 13:28:04.250869', '5', 'Product 005', 2, '[{\"changed\": {\"fields\": [\"Sub category\"]}}]', 9, 1),
(16, '2022-11-10 13:29:54.876669', '6', 'Product 006', 1, '[{\"added\": {}}]', 9, 1),
(17, '2022-11-10 13:31:45.537629', '7', 'Product 007', 1, '[{\"added\": {}}]', 9, 1),
(18, '2022-11-10 13:33:21.269793', '8', 'Product 008', 1, '[{\"added\": {}}]', 9, 1),
(19, '2022-11-10 13:34:36.967369', '9', 'Product 009', 1, '[{\"added\": {}}]', 9, 1),
(20, '2022-11-10 13:35:37.538525', '10', 'Product 010', 1, '[{\"added\": {}}]', 9, 1),
(21, '2022-11-10 13:37:39.342466', '11', 'Product 011', 1, '[{\"added\": {}}]', 9, 1),
(22, '2022-11-10 13:38:45.655804', '12', 'Product 012', 1, '[{\"added\": {}}]', 9, 1),
(23, '2022-11-10 13:40:01.158283', '13', 'Product 013', 1, '[{\"added\": {}}]', 9, 1),
(24, '2022-11-10 13:41:13.830475', '14', 'Product 014', 1, '[{\"added\": {}}]', 9, 1),
(25, '2022-11-10 13:45:44.941759', '15', 'Product 015', 1, '[{\"added\": {}}]', 9, 1),
(26, '2022-11-10 13:47:39.733205', '16', 'Product 016', 1, '[{\"added\": {}}]', 9, 1),
(27, '2022-11-10 13:47:55.631041', '15', 'Product 015', 2, '[{\"changed\": {\"fields\": [\"Photo main\"]}}]', 9, 1),
(28, '2022-11-10 13:50:20.503600', '5', 'Visitor\'s Seats', 3, '', 14, 1),
(29, '2022-11-10 13:52:47.012326', '17', 'Product 017', 1, '[{\"added\": {}}]', 9, 1),
(30, '2022-11-10 13:54:15.817823', '18', 'Product 018', 1, '[{\"added\": {}}]', 9, 1),
(31, '2022-11-11 06:54:36.726401', '19', 'Product 019', 1, '[{\"added\": {}}]', 9, 1),
(32, '2022-11-11 06:54:54.912502', '7', 'Swings', 1, '[{\"added\": {}}]', 14, 1),
(33, '2022-11-11 06:55:33.816021', '20', 'Product 020', 1, '[{\"added\": {}}]', 9, 1),
(34, '2022-11-11 06:56:13.974086', '8', 'Dining Set', 1, '[{\"added\": {}}]', 14, 1),
(35, '2022-11-11 06:57:06.458301', '21', 'Product 021', 1, '[{\"added\": {}}]', 9, 1),
(36, '2022-11-11 06:57:58.913188', '9', 'Cabinet', 1, '[{\"added\": {}}]', 14, 1),
(37, '2022-11-11 06:58:45.980876', '9', 'Files Cabinet', 2, '[{\"changed\": {\"fields\": [\"Sub category name\", \"Slug\"]}}]', 14, 1),
(38, '2022-11-11 06:59:36.458657', '22', 'Product 022', 1, '[{\"added\": {}}]', 9, 1),
(39, '2022-11-11 07:01:01.126517', '23', 'Product 024', 1, '[{\"added\": {}}]', 9, 1),
(40, '2022-11-11 07:02:27.682335', '10', 'Coffee Table', 1, '[{\"added\": {}}]', 14, 1),
(41, '2022-11-11 07:03:29.956523', '24', 'Product 025', 1, '[{\"added\": {}}]', 9, 1),
(42, '2022-11-11 07:04:13.853415', '11', 'Outdoor Table', 1, '[{\"added\": {}}]', 14, 1),
(43, '2022-11-11 07:05:16.701329', '25', 'Product 026', 1, '[{\"added\": {}}]', 9, 1),
(44, '2022-11-11 07:06:22.405496', '26', 'Product 027', 1, '[{\"added\": {}}]', 9, 1),
(45, '2022-11-11 07:09:46.903837', '12', 'Stool', 1, '[{\"added\": {}}]', 14, 1),
(46, '2022-11-11 07:10:37.613729', '27', 'Product 028', 1, '[{\"added\": {}}]', 9, 1),
(47, '2022-11-11 07:11:07.376046', '13', 'Tv Stands', 1, '[{\"added\": {}}]', 14, 1),
(48, '2022-11-11 07:12:35.406939', '28', 'Product 029', 1, '[{\"added\": {}}]', 9, 1),
(49, '2022-11-11 07:14:46.145658', '14', 'Outdoor Sofa', 1, '[{\"added\": {}}]', 14, 1),
(50, '2022-11-11 07:16:39.623141', '29', 'Product 030', 1, '[{\"added\": {}}]', 9, 1),
(51, '2022-11-11 07:19:13.224290', '15', 'Dressing Table', 1, '[{\"added\": {}}]', 14, 1),
(52, '2022-11-11 07:21:38.483772', '30', 'Product 031', 1, '[{\"added\": {}}]', 9, 1),
(53, '2022-11-11 07:23:13.257851', '16', 'Beach Bed', 1, '[{\"added\": {}}]', 14, 1),
(54, '2022-11-11 07:24:43.827584', '31', 'Product 032', 1, '[{\"added\": {}}]', 9, 1),
(55, '2022-11-11 07:25:08.907895', '4', 'Games', 1, '[{\"added\": {}}]', 8, 1),
(56, '2022-11-11 07:25:27.361302', '17', 'Pool Table', 1, '[{\"added\": {}}]', 14, 1),
(57, '2022-11-11 07:27:23.069969', '32', 'Product 033', 1, '[{\"added\": {}}]', 9, 1),
(58, '2022-11-11 07:29:43.536409', '18', 'Counter Seats', 1, '[{\"added\": {}}]', 14, 1),
(59, '2022-11-11 07:30:35.844040', '33', 'Product 034', 1, '[{\"added\": {}}]', 9, 1),
(60, '2022-11-11 07:31:03.312538', '19', 'Outdoor Shade', 1, '[{\"added\": {}}]', 14, 1),
(61, '2022-11-11 07:31:51.414972', '34', 'Product 035', 1, '[{\"added\": {}}]', 9, 1),
(62, '2022-11-11 08:23:58.368310', '1', 'SocialUrls object (1)', 1, '[{\"added\": {}}]', 30, 1),
(63, '2022-11-11 08:47:49.271054', '1', 'SocialUrls object (1)', 3, '', 30, 1),
(64, '2022-11-11 08:47:55.805556', '2', 'SocialUrls object (2)', 1, '[{\"added\": {}}]', 30, 1),
(65, '2022-11-11 09:29:39.017597', '1', 'SocialMedia object (1)', 1, '[{\"added\": {}}]', 31, 1),
(66, '2022-11-11 09:32:26.603523', '1', 'SocialMedia object (1)', 3, '', 31, 1),
(67, '2022-11-11 09:35:24.649013', '1', 'Socials object (1)', 1, '[{\"added\": {}}]', 32, 1),
(68, '2022-11-11 09:35:33.624718', '2', 'Socials object (2)', 1, '[{\"added\": {}}]', 32, 1),
(69, '2022-11-11 09:36:02.894978', '3', 'Socials object (3)', 1, '[{\"added\": {}}]', 32, 1),
(70, '2022-11-11 09:36:11.554709', '4', 'Socials object (4)', 1, '[{\"added\": {}}]', 32, 1),
(71, '2022-11-11 09:36:24.204867', '5', 'Socials object (5)', 1, '[{\"added\": {}}]', 32, 1),
(72, '2022-11-11 09:36:39.434548', '6', 'Socials object (6)', 1, '[{\"added\": {}}]', 32, 1),
(73, '2022-11-11 10:57:28.781138', '4', 'Games', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(74, '2022-11-11 10:57:42.081287', '3', 'Home Decor', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(75, '2022-11-11 10:57:52.861496', '2', 'Outdoor', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(76, '2022-11-11 10:58:02.403809', '1', 'Office', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(77, '2022-11-11 11:34:56.053030', '1', 'msimeon937@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Phone number\"]}}]', 6, 1),
(78, '2022-11-12 07:21:36.771183', '1', 'MarketingImages object (1)', 1, '[{\"added\": {}}]', 13, 1),
(79, '2022-11-12 07:58:45.065462', '2', 'MarketingImages object (2)', 1, '[{\"added\": {}}]', 13, 1),
(80, '2022-11-12 07:58:58.185892', '3', 'MarketingImages object (3)', 1, '[{\"added\": {}}]', 13, 1),
(81, '2022-11-12 07:59:10.463739', '4', 'MarketingImages object (4)', 1, '[{\"added\": {}}]', 13, 1),
(82, '2022-11-14 06:43:00.602508', '20', 'Product 020', 2, '[{\"added\": {\"name\": \"variation\", \"object\": \"Black\"}}, {\"added\": {\"name\": \"variation\", \"object\": \"White\"}}, {\"added\": {\"name\": \"variation\", \"object\": \"lg\"}}, {\"added\": {\"name\": \"variation\", \"object\": \"xlg\"}}]', 9, 1),
(83, '2022-12-20 07:57:05.172771', '2', 'ranjacalvin@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Is admin\", \"Is staff\", \"Is superadmin\"]}}]', 6, 1),
(84, '2022-12-30 16:58:46.957567', '4', 'Interior', 2, '[{\"changed\": {\"fields\": [\"Category name\", \"Slug\"]}}]', 8, 1),
(85, '2022-12-30 16:59:08.689770', '5', 'sofa', 1, '[{\"added\": {}}]', 8, 1),
(86, '2022-12-30 17:28:21.796337', '34', 'Product 035', 2, '[{\"changed\": {\"fields\": [\"Flash sales\", \"Most viewed\"]}}]', 9, 1),
(87, '2022-12-30 17:28:45.890637', '32', 'Product 033', 2, '[{\"changed\": {\"fields\": [\"Flash sales\", \"Most viewed\", \"Color your world\"]}}]', 9, 1),
(88, '2022-12-30 17:29:10.778422', '25', 'Product 026', 2, '[{\"changed\": {\"fields\": [\"In store offers\", \"Most viewed\"]}}]', 9, 1),
(89, '2022-12-30 17:29:39.442932', '27', 'Product 028', 2, '[{\"changed\": {\"fields\": [\"In store offers\", \"Most viewed\"]}}]', 9, 1),
(90, '2022-12-30 17:30:04.786448', '23', 'Product 024', 2, '[{\"changed\": {\"fields\": [\"Most viewed\", \"New arrival\", \"Color your world\"]}}]', 9, 1),
(91, '2022-12-30 17:30:32.240126', '21', 'Product 021', 2, '[{\"changed\": {\"fields\": [\"Flash sales\", \"Most viewed\", \"Color your world\"]}}]', 9, 1),
(92, '2022-12-30 17:31:04.359764', '20', 'Product 020', 2, '[{\"changed\": {\"fields\": [\"In store offers\", \"New arrival\", \"Color your world\"]}}]', 9, 1),
(93, '2022-12-30 17:31:28.998965', '19', 'Product 019', 2, '[{\"changed\": {\"fields\": [\"Flash sales\", \"Most viewed\", \"New arrival\"]}}]', 9, 1),
(94, '2022-12-30 17:31:56.151623', '26', 'Product 027', 2, '[{\"changed\": {\"fields\": [\"Most viewed\", \"New arrival\", \"Color your world\"]}}]', 9, 1),
(95, '2022-12-30 17:32:19.760432', '13', 'Product 013', 2, '[{\"changed\": {\"fields\": [\"Flash sales\", \"New arrival\", \"Color your world\"]}}]', 9, 1),
(96, '2022-12-30 17:32:58.815740', '1', 'Product 001', 2, '[{\"changed\": {\"fields\": [\"In store offers\", \"New arrival\", \"Color your world\"]}}]', 9, 1),
(97, '2022-12-30 17:33:21.391920', '3', 'Product-003', 2, '[{\"changed\": {\"fields\": [\"In store offers\", \"New arrival\"]}}]', 9, 1),
(98, '2022-12-30 17:33:58.333917', '4', 'Product-004', 2, '[{\"changed\": {\"fields\": [\"In store offers\", \"Most viewed\"]}}]', 9, 1),
(99, '2022-12-30 17:34:57.217766', '11', 'Product 011', 2, '[{\"changed\": {\"fields\": [\"Most viewed\", \"New arrival\"]}}]', 9, 1),
(100, '2022-12-30 17:35:24.548973', '16', 'Product 016', 2, '[{\"changed\": {\"fields\": [\"In store offers\", \"Color your world\"]}}]', 9, 1),
(101, '2022-12-31 09:19:03.258999', '34', 'Product 035', 3, '', 9, 1),
(102, '2022-12-31 09:19:03.265732', '33', 'Product 034', 3, '', 9, 1),
(103, '2022-12-31 09:19:03.268156', '32', 'Product 033', 3, '', 9, 1),
(104, '2022-12-31 09:20:59.625427', '31', 'Product 032', 3, '', 9, 1),
(105, '2022-12-31 09:20:59.628399', '30', 'Product 031', 3, '', 9, 1),
(106, '2022-12-31 09:20:59.631100', '29', 'Product 030', 3, '', 9, 1),
(107, '2022-12-31 09:20:59.633638', '28', 'Product 029', 3, '', 9, 1),
(108, '2022-12-31 09:20:59.635961', '27', 'Product 028', 3, '', 9, 1),
(109, '2022-12-31 09:20:59.638119', '26', 'Product 027', 3, '', 9, 1),
(110, '2022-12-31 09:20:59.640136', '25', 'Product 026', 3, '', 9, 1),
(111, '2022-12-31 09:20:59.641858', '24', 'Product 025', 3, '', 9, 1),
(112, '2022-12-31 09:20:59.643550', '23', 'Product 024', 3, '', 9, 1),
(113, '2022-12-31 09:20:59.645603', '22', 'Product 022', 3, '', 9, 1),
(114, '2022-12-31 09:20:59.677911', '21', 'Product 021', 3, '', 9, 1),
(115, '2022-12-31 09:20:59.682910', '20', 'Product 020', 3, '', 9, 1),
(116, '2022-12-31 09:20:59.690545', '19', 'Product 019', 3, '', 9, 1),
(117, '2022-12-31 09:20:59.692959', '18', 'Product 018', 3, '', 9, 1),
(118, '2022-12-31 09:20:59.702633', '17', 'Product 017', 3, '', 9, 1),
(119, '2022-12-31 09:20:59.715433', '16', 'Product 016', 3, '', 9, 1),
(120, '2022-12-31 09:20:59.719207', '15', 'Product 015', 3, '', 9, 1),
(121, '2022-12-31 09:20:59.722030', '14', 'Product 014', 3, '', 9, 1),
(122, '2022-12-31 09:20:59.726331', '13', 'Product 013', 3, '', 9, 1),
(123, '2022-12-31 09:20:59.728873', '12', 'Product 012', 3, '', 9, 1),
(124, '2022-12-31 09:20:59.735057', '11', 'Product 011', 3, '', 9, 1),
(125, '2022-12-31 09:20:59.737587', '10', 'Product 010', 3, '', 9, 1),
(126, '2022-12-31 09:20:59.739589', '9', 'Product 009', 3, '', 9, 1),
(127, '2022-12-31 09:20:59.775008', '8', 'Product 008', 3, '', 9, 1),
(128, '2022-12-31 09:20:59.779244', '7', 'Product 007', 3, '', 9, 1),
(129, '2022-12-31 09:20:59.789939', '6', 'Product 006', 3, '', 9, 1),
(130, '2022-12-31 09:20:59.794565', '5', 'Product 005', 3, '', 9, 1),
(131, '2022-12-31 09:20:59.829417', '4', 'Product-004', 3, '', 9, 1),
(132, '2022-12-31 09:20:59.834254', '3', 'Product-003', 3, '', 9, 1),
(133, '2022-12-31 09:20:59.837126', '2', 'Product-002', 3, '', 9, 1),
(134, '2022-12-31 09:21:38.265663', '1', 'Product 001', 3, '', 9, 1),
(135, '2022-12-31 09:41:55.627812', '3', '', 1, '[{\"added\": {}}]', 6, 1),
(136, '2022-12-31 09:42:50.226255', '3', 'kibsfor2030@gmail.com', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Phone number\", \"Is admin\", \"Is staff\", \"Is active\", \"Is superadmin\"]}}]', 6, 1),
(137, '2022-12-31 09:47:41.176290', '35', 'Executive Office Desk 1.8m', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Product Gallery\", \"object\": \"Executive Office Desk 1.8m\"}}, {\"added\": {\"name\": \"variation\", \"object\": \"1.4\"}}]', 9, 3),
(138, '2022-12-31 09:49:10.693295', '35', 'Executive Office Desk 1.8m', 3, '', 9, 1),
(139, '2022-12-31 09:50:16.839711', '19', 'Outdoor Shade', 3, '', 14, 1),
(140, '2022-12-31 09:50:16.843936', '18', 'Counter Seats', 3, '', 14, 1),
(141, '2022-12-31 09:50:16.846711', '17', 'Pool Table', 3, '', 14, 1),
(142, '2022-12-31 09:50:16.849114', '16', 'Beach Bed', 3, '', 14, 1),
(143, '2022-12-31 09:50:16.851474', '15', 'Dressing Table', 3, '', 14, 1),
(144, '2022-12-31 09:50:16.853748', '14', 'Outdoor Sofa', 3, '', 14, 1),
(145, '2022-12-31 09:50:16.855913', '13', 'Tv Stands', 3, '', 14, 1),
(146, '2022-12-31 09:50:16.858107', '12', 'Stool', 3, '', 14, 1),
(147, '2022-12-31 09:50:16.860524', '11', 'Outdoor Table', 3, '', 14, 1),
(148, '2022-12-31 09:50:16.862662', '10', 'Coffee Table', 3, '', 14, 1),
(149, '2022-12-31 09:50:16.864902', '9', 'Files Cabinet', 3, '', 14, 1),
(150, '2022-12-31 09:50:16.867167', '8', 'Dining Set', 3, '', 14, 1),
(151, '2022-12-31 09:50:16.870153', '7', 'Swings', 3, '', 14, 1),
(152, '2022-12-31 09:50:16.872121', '6', 'Boardroom Set', 3, '', 14, 1),
(153, '2022-12-31 09:50:16.874099', '4', 'Workstation', 3, '', 14, 1),
(154, '2022-12-31 09:50:16.876430', '3', 'Executive Chairs', 3, '', 14, 1),
(155, '2022-12-31 09:50:16.878978', '2', 'Executive Desks', 3, '', 14, 1),
(156, '2022-12-31 09:50:16.883438', '1', 'Waiting Chairs', 3, '', 14, 1),
(157, '2022-12-31 09:51:31.342769', '20', 'Executive Desks', 1, '[{\"added\": {}}]', 14, 3),
(158, '2022-12-31 09:52:48.061844', '21', 'Office Chairs', 1, '[{\"added\": {}}]', 14, 3),
(159, '2022-12-31 09:53:10.206660', '22', 'Office Cabinets', 1, '[{\"added\": {}}]', 14, 3),
(160, '2022-12-31 09:53:31.385234', '23', 'Waiting Area Seats', 1, '[{\"added\": {}}]', 14, 3),
(161, '2022-12-31 09:53:49.474184', '24', 'Office Desks', 1, '[{\"added\": {}}]', 14, 3),
(162, '2022-12-31 09:54:16.832296', '25', 'Office Carpets', 1, '[{\"added\": {}}]', 14, 3),
(163, '2022-12-31 09:55:28.496208', '26', 'Reception Desks', 1, '[{\"added\": {}}]', 14, 3),
(164, '2022-12-31 09:56:33.121606', '27', 'Office Coffee Table', 1, '[{\"added\": {}}]', 14, 3),
(165, '2022-12-31 09:58:50.790090', '28', 'Swings', 1, '[{\"added\": {}}]', 14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'accounts', 'account'),
(7, 'accounts', 'userprofile'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(26, 'blog', 'blogauthor'),
(25, 'blog', 'blogpost'),
(29, 'blog', 'comments'),
(24, 'blog', 'helpcenter'),
(27, 'blog', 'newsletter'),
(28, 'blog', 'youtubevideo'),
(15, 'carts', 'cart'),
(16, 'carts', 'cartitem'),
(8, 'category', 'category'),
(23, 'contact', 'contactus'),
(31, 'contact', 'socialmedia'),
(32, 'contact', 'socials'),
(30, 'contact', 'socialurls'),
(4, 'contenttypes', 'contenttype'),
(21, 'mpesa_api', 'mpesapayment'),
(22, 'mpesa_api', 'mpesapaymentcallback'),
(17, 'order', 'order'),
(19, 'order', 'orderproduct'),
(18, 'order', 'payment'),
(20, 'order', 'wishlist'),
(5, 'sessions', 'session'),
(13, 'store', 'marketingimages'),
(9, 'store', 'product'),
(12, 'store', 'productgallery'),
(11, 'store', 'reviewrating'),
(10, 'store', 'variation'),
(14, 'subcategory', 'sub_category');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2022-11-10 11:14:37.355411'),
(2, 'accounts', '0002_userprofile', '2022-11-10 11:14:37.653086'),
(3, 'accounts', '0003_auto_20221026_1003', '2022-11-10 11:14:43.299145'),
(4, 'contenttypes', '0001_initial', '2022-11-10 11:14:43.876460'),
(5, 'admin', '0001_initial', '2022-11-10 11:14:44.394309'),
(6, 'admin', '0002_logentry_remove_auto_add', '2022-11-10 11:14:46.194918'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-10 11:14:46.228164'),
(8, 'contenttypes', '0002_remove_content_type_name', '2022-11-10 11:14:47.085384'),
(9, 'auth', '0001_initial', '2022-11-10 11:14:48.233231'),
(10, 'auth', '0002_alter_permission_name_max_length', '2022-11-10 11:14:53.240659'),
(11, 'auth', '0003_alter_user_email_max_length', '2022-11-10 11:14:53.308393'),
(12, 'auth', '0004_alter_user_username_opts', '2022-11-10 11:14:53.340720'),
(13, 'auth', '0005_alter_user_last_login_null', '2022-11-10 11:14:53.373095'),
(14, 'auth', '0006_require_contenttypes_0002', '2022-11-10 11:14:53.402017'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2022-11-10 11:14:53.427905'),
(16, 'auth', '0008_alter_user_username_max_length', '2022-11-10 11:14:53.451580'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2022-11-10 11:14:53.485199'),
(18, 'auth', '0010_alter_group_name_max_length', '2022-11-10 11:14:53.591473'),
(19, 'auth', '0011_update_proxy_permissions', '2022-11-10 11:14:53.622494'),
(20, 'blog', '0001_initial', '2022-11-10 11:14:53.861154'),
(21, 'blog', '0002_alter_helpcenter_description', '2022-11-10 11:14:54.510006'),
(22, 'blog', '0003_auto_20221021_1350', '2022-11-10 11:14:54.735395'),
(23, 'blog', '0004_blogpost_author', '2022-11-10 11:14:55.163178'),
(24, 'blog', '0005_alter_blogpost_blog_intro', '2022-11-10 11:14:55.223312'),
(25, 'blog', '0006_blogpost_latest', '2022-11-10 11:14:55.356761'),
(26, 'blog', '0007_remove_blogpost_latest', '2022-11-10 11:14:55.544387'),
(27, 'blog', '0008_blogpost_blog_picture', '2022-11-10 11:14:56.057440'),
(28, 'blog', '0009_auto_20221026_1003', '2022-11-10 11:14:57.912349'),
(29, 'blog', '0010_blogpost_cover_image', '2022-11-10 11:14:58.127578'),
(30, 'blog', '0011_blogpost_youtube_url', '2022-11-10 11:14:58.296771'),
(31, 'blog', '0012_blogpost_featured', '2022-11-10 11:14:58.458166'),
(32, 'blog', '0013_auto_20221107_1141', '2022-11-10 11:14:58.732001'),
(33, 'blog', '0014_blogauthor', '2022-11-10 11:14:59.011700'),
(34, 'blog', '0015_auto_20221107_1233', '2022-11-10 11:15:01.300336'),
(35, 'blog', '0016_auto_20221107_1236', '2022-11-10 11:15:01.633061'),
(36, 'blog', '0017_auto_20221107_1238', '2022-11-10 11:15:01.750443'),
(37, 'blog', '0018_newsletter', '2022-11-10 11:15:01.940604'),
(38, 'blog', '0019_auto_20221108_0858', '2022-11-10 11:15:02.297380'),
(39, 'blog', '0020_auto_20221108_1241', '2022-11-10 11:15:02.901332'),
(40, 'blog', '0021_auto_20221108_1244', '2022-11-10 11:15:03.587568'),
(41, 'blog', '0022_auto_20221108_1339', '2022-11-10 11:15:05.368668'),
(42, 'blog', '0023_blogpost_published', '2022-11-10 11:15:05.678267'),
(43, 'category', '0001_initial', '2022-11-10 11:15:05.956667'),
(44, 'subcategory', '0001_initial', '2022-11-10 11:15:06.389802'),
(45, 'subcategory', '0002_alter_sub_category_cat_image', '2022-11-10 11:15:07.486360'),
(46, 'store', '0001_initial', '2022-11-10 11:15:07.842911'),
(47, 'store', '0002_product_on_offer', '2022-11-10 11:15:10.454187'),
(48, 'store', '0003_variation', '2022-11-10 11:15:10.695227'),
(49, 'carts', '0001_initial', '2022-11-10 11:15:12.536831'),
(50, 'carts', '0002_cartitem_variations', '2022-11-10 11:15:14.678741'),
(51, 'carts', '0003_auto_20220915_2345', '2022-11-10 11:15:21.927318'),
(52, 'carts', '0004_auto_20221026_1003', '2022-11-10 11:15:29.376062'),
(53, 'category', '0002_rename_cat_image_category_category_image', '2022-11-10 11:15:29.576272'),
(54, 'category', '0003_auto_20221026_1003', '2022-11-10 11:15:35.178730'),
(55, 'contact', '0001_initial', '2022-11-10 11:15:35.776820'),
(56, 'contact', '0002_alter_contactus_message', '2022-11-10 11:15:36.734605'),
(57, 'contact', '0003_contactus_phone', '2022-11-10 11:15:36.859756'),
(58, 'contact', '0004_auto_20221026_1003', '2022-11-10 11:15:37.922427'),
(59, 'mpesa_api', '0001_initial', '2022-11-10 11:15:38.247655'),
(60, 'mpesa_api', '0002_auto_20221007_1004', '2022-11-10 11:15:39.285633'),
(61, 'mpesa_api', '0003_delete_mpesapaymentcallback', '2022-11-10 11:15:39.662562'),
(62, 'mpesa_api', '0004_mpesapaymentcallback', '2022-11-10 11:15:39.963164'),
(63, 'mpesa_api', '0005_delete_mpesapaymentcallback', '2022-11-10 11:15:40.426318'),
(64, 'mpesa_api', '0006_mpesapaymentcallback', '2022-11-10 11:15:40.850226'),
(65, 'mpesa_api', '0007_delete_mpesapaymentcallback', '2022-11-10 11:15:42.246472'),
(66, 'mpesa_api', '0008_mpesapaymentcallback', '2022-11-10 11:15:42.465783'),
(67, 'mpesa_api', '0009_alter_mpesapayment_options', '2022-11-10 11:15:43.200195'),
(68, 'mpesa_api', '0010_auto_20221026_1003', '2022-11-10 11:15:45.406636'),
(69, 'mpesa_api', '0011_mpesapayment_order_number', '2022-11-10 11:15:45.586987'),
(70, 'mpesa_api', '0012_remove_mpesapayment_order_number', '2022-11-10 11:15:45.734730'),
(71, 'mpesa_api', '0013_mpesapayment_order_number', '2022-11-10 11:15:45.899005'),
(72, 'store', '0004_reviewrating', '2022-11-10 11:15:46.368229'),
(73, 'store', '0005_product_boosted', '2022-11-10 11:15:48.463525'),
(74, 'store', '0006_productgallery', '2022-11-10 11:15:48.962616'),
(75, 'store', '0007_alter_product_description', '2022-11-10 11:15:49.744273'),
(76, 'store', '0008_alter_product_description', '2022-11-10 11:15:49.906886'),
(77, 'store', '0009_alter_product_description', '2022-11-10 11:15:49.948930'),
(78, 'store', '0010_alter_product_description', '2022-11-10 11:15:49.983723'),
(79, 'store', '0011_alter_product_discount_price', '2022-11-10 11:15:50.052843'),
(80, 'store', '0012_alter_product_discount_price', '2022-11-10 11:15:50.128057'),
(81, 'order', '0001_initial', '2022-11-10 11:15:54.521912'),
(82, 'order', '0002_auto_20220916_2123', '2022-11-10 11:16:01.070924'),
(83, 'order', '0003_auto_20220916_2127', '2022-11-10 11:16:01.731334'),
(84, 'order', '0004_wishlist', '2022-11-10 11:16:04.657329'),
(85, 'order', '0005_rename_productvariations_wishlist_product', '2022-11-10 11:16:10.961481'),
(86, 'order', '0006_auto_20221019_1455', '2022-11-10 11:16:14.205327'),
(87, 'order', '0007_auto_20221019_2053', '2022-11-10 11:16:20.105289'),
(88, 'order', '0008_auto_20221026_1003', '2022-11-10 11:16:33.886687'),
(89, 'order', '0009_auto_20221031_1209', '2022-11-10 11:16:33.977524'),
(90, 'sessions', '0001_initial', '2022-11-10 11:16:34.250292'),
(91, 'store', '0013_alter_product_description', '2022-11-10 11:16:35.191966'),
(92, 'store', '0014_auto_20221026_1003', '2022-11-10 11:17:07.110010'),
(93, 'store', '0015_auto_20221031_1209', '2022-11-10 11:17:07.684794'),
(94, 'store', '0016_auto_20221031_1405', '2022-11-10 11:17:08.457352'),
(95, 'store', '0017_auto_20221109_1525', '2022-11-10 11:17:08.661949'),
(96, 'subcategory', '0003_rename_cat_image_sub_category_category_image', '2022-11-10 11:17:08.842191'),
(97, 'subcategory', '0004_rename_category_image_sub_category_sub_category_image', '2022-11-10 11:17:08.960693'),
(98, 'subcategory', '0005_auto_20221026_1003', '2022-11-10 11:17:12.607205'),
(99, 'contact', '0005_socialurls', '2022-11-11 08:18:50.559629'),
(100, 'contact', '0006_auto_20221111_1123', '2022-11-11 08:23:49.535119'),
(101, 'contact', '0007_auto_20221111_1144', '2022-11-11 08:44:42.890878'),
(102, 'contact', '0008_auto_20221111_1226', '2022-11-11 09:26:44.012775'),
(103, 'contact', '0009_auto_20221111_1230', '2022-11-11 09:30:18.826718'),
(104, 'contact', '0010_auto_20221111_1233', '2022-11-11 09:33:57.377216'),
(105, 'blog', '0002_auto_20221124_1421', '2022-12-27 10:19:26.789744'),
(106, 'blog', '0003_auto_20221124_1428', '2022-12-27 10:19:29.743356'),
(107, 'blog', '0004_auto_20221227_1319', '2022-12-27 10:19:29.844317'),
(108, 'store', '0018_auto_20221230_1947', '2022-12-30 16:47:42.895145'),
(109, 'store', '0019_remove_product_color_your_world', '2022-12-30 17:22:28.512823'),
(110, 'store', '0020_product_color_your_world', '2022-12-30 17:22:51.790347'),
(111, 'store', '0021_auto_20221230_2023', '2022-12-30 17:23:17.739481'),
(112, 'store', '0022_auto_20221230_2023', '2022-12-30 17:23:43.753222');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('052250gqo7uznaq667fta897upaxiyyk', 'e30:1otnN8:nyms2G7xiqu7E1Frd2LRKLBmvEeMnlj9X_fQOTjFp8U', '2022-11-26 10:04:22.167655'),
('0c1pvlo6dzl8jmwhlxopv6arfgyp0r7w', '.eJxtjEEOwiAQAP_C2RBkgbYevfsGsrCLVA0kpZyMfzckvZh4nZnMW_SVxEVocRIe-559b7z5fyxgfHIZgh5Y7lXGWvZtDXIk8rBN3irx63q0P4OMLY-tA4sRgNClaBObtFACcgpmq9NsjSGYWLMBCqwcKGMSTmeLDBpxQfH5ApdoOo0:1owNgv:NWSMDFxB9mwZpuwYntHaRWct2V18G7g2-zYhYjPUiYg', '2022-12-03 13:15:29.407174'),
('0kak3aberhwb2l8mablugng1kstjl7yr', 'e30:1otwbG:d0kHu9WBjOv6Sx88vbaY54Qq5e9I7fiuETLL82eX6TU', '2022-11-26 19:55:34.799601'),
('1e6ds2xv01xt20ztgwshh82yb0fva603', 'e30:1otwaW:tdQMcrFLPzl9-PkQbJ3utAiugnehXrP9i1e2uW--wlU', '2022-11-26 19:54:48.248657'),
('1ueoyd3bcr1umnnp5t5s3e6dw8gqb56u', 'e30:1ovyB9:CRdOQRB5Hktsl7iQCR7D72tWuG0bOFz5oAhL5RhvKeQ', '2022-12-02 10:00:59.318266'),
('1y93c2g22k1smzvu16cyw0770a2kvau9', 'e30:1pBKnt:5rdNFT0otLN0HOAXCJ4cXHM5LFZidi0k5dma8aoLVzs', '2023-01-13 19:12:29.677251'),
('29rwvib49uf892i637qlqs8q9ndgp3lz', 'e30:1otxmr:WpDLUVW38HWSHbUn0uzig_s6ArcHaHDUT76rSkEry4I', '2022-11-26 21:11:37.892090'),
('2e2a6aaxotnrz1ge5ybzoikkzhjnc0zr', 'e30:1oz0WI:Dsk4XuZikYmwkeVOrfp1TgT9CKQni3rWgjrmtkDPpyw', '2022-12-10 19:07:22.417443'),
('39z99pz4jz67j2y52l08vjqk7z7mcot8', 'e30:1p5dwx:OSnhaO6YuR4NfU6T1K591xBpraXY83_KAAVJWgJZx2Q', '2022-12-29 02:26:19.995358'),
('3eyj4txugumcn58fjs8p19sd8dio0b3r', 'e30:1otude:D8gCdQ5WYMe5cnwIR7Phzx5D1pYKOlInemPKNjo2r3g', '2022-11-26 17:49:54.696760'),
('3lf8bzpfm2g2ccq42stad6kfk99sro5d', 'e30:1ouUmS:Xmjzzs8NRwvPhO3t87c8U7yKBly0D9FWPBb-Rp1kWOg', '2022-11-28 08:25:24.059111'),
('3to104u0rowzwknu5v0m0vzyhkmek3rk', 'e30:1oz2eJ:k5bShqfpRkSALytHmZcPIqs1OClyaUufXlpKRqtfSi0', '2022-12-10 21:23:47.475001'),
('5hx4evqs00ye24ph03l73340ery09cdj', 'e30:1p6x6Z:PHZTpakpZQtVDWbW2Lxpx-TjVh5W61REChFJ79UC_7I', '2023-01-01 17:05:39.767027'),
('5wwpbp09kgzomwb8a0cr7bcycc6eq60l', 'e30:1owP0F:O_uYOZUPMj91v7qPoTkgwoag_JCpAM4rYibVTlu1Hn8', '2022-12-03 14:39:31.991138'),
('63q1qji4ukgr52zwmj0ig0rxdrllv0k3', 'e30:1otwM4:lh9k6UBpDlPfNaVTZ67SPDTH2s_mymNW-KJJ-Flb87w', '2022-11-26 19:39:52.522886'),
('6cy0h0jkxbhaywb0nxhr2iy4gqf2fmok', 'e30:1ouUgT:53ilWjO72IAZnlgMYnqjONSS-QWq9Br-PiaobSsGpAo', '2022-11-28 08:19:13.076757'),
('6iov89qw8rrnesb06gvrjwzkg7mms1j0', 'e30:1p1d20:8dJsBUbDJZ0OWj9uyKmecowUw02bKtQfSguBOyNiwAs', '2022-12-18 00:38:56.352013'),
('71sb7zibzizdwoxc8g59914sh0jplcc9', 'e30:1oygQC:ptGo7hUVZYz7DfjhNnI4EdptVZ5LNdse-lcKtmlAtu4', '2022-12-09 21:39:44.010127'),
('7r2d7peyy58f16ynnfzejpk5esmm59a9', 'e30:1ourF3:DiJZH4qyxljXp0-gY14t5JIbizohyDTD0Fj_Jui21tY', '2022-11-29 08:24:25.874081'),
('8gtgdr82eyg7484fkl0tu427fy6nodhn', 'e30:1ovfX0:tOwXE0fKa4C3Vk5QeY2PJKvRT6p1Kpf2a08ub4gM_CI', '2022-12-01 14:06:18.337431'),
('905grswxfs3kee99rj3uvycui57gtm8w', 'e30:1p55dT:xrzpKiepjM5V_MycLalzSrAaD3k81YbfnZTi510sBv4', '2022-12-27 13:47:55.609309'),
('9asni7rvrna17c59ohg1qm18n48m77se', '.eJxVjEEOwiAQAP_C2RBkF9p69O4byMIuUjU0Ke3J-HdD0oNeZybzVoH2rYS9yRpmVhdl1emXRUpPqV3wg-p90Wmp2zpH3RN92KZvC8vrerR_g0Kt9K0HRwmAyefksmCeOAN7A6OzeXSIDINYQeAoxoNBzDScHQlYoonU5wvubTgr:1p7XTM:5Y61ff8m6aNt_M7ONjT-AMmHDE02Xokp9I-mIxV6AJ4', '2023-01-03 07:55:36.726532'),
('9tfn3fn8tgwfttk7tmqa83jx6s7l24km', 'e30:1pBSE0:82fNDbTj6uKp7NQP6vl_tPuHSIFq3i_TWaLmD_LKSYM', '2023-01-14 03:07:56.689283'),
('9us1syl1eql2t7berhftq5t3czfegj04', 'e30:1p2A87:I-haA19N7ntWrKh68LKkjXYxmbbFSCpDjko-Csvbsn8', '2022-12-19 11:59:27.647843'),
('a8nvld4x0ukr5b85kq25gq3svutnxbld', 'e30:1owVEB:d23u35EaQlEsMnRukFkKePNEQVKcaBEksz-mte7pkh4', '2022-12-03 21:18:19.658756'),
('abwpjgjq27j4dtfixrui1a9qlxoo1fq7', 'e30:1p0ELA:GatgA1G-ykk5B6MzhyiVX0S0WLIV-pK2qmzIZQ-9Nvw', '2022-12-14 04:04:56.574958'),
('acgx4tai3pqhxusmofvgi6g3men7ojjd', 'e30:1otwaN:b5H7HgIkzT2d5gcBPA8jUHELrnUsMCE-fGpkWj1OWWg', '2022-11-26 19:54:39.917180'),
('ahdxtpyfq0ica6ouwrdgdcmw4wxmg0ij', 'e30:1ovrMn:VoSENM3S3dk2eaW9KeFfHi79LTpmr8wID0FE-JlpuvA', '2022-12-02 02:44:33.884995'),
('aiwxr555i76v70orre4i5hu85zsitsf2', 'e30:1p0EL1:p50sD0_U1tkyGKuZn81qVgk1K2ijT4H6sLbLjgIMSbo', '2022-12-14 04:04:47.576698'),
('aq0hwg1zn2azopstbe2a5224w118n6yf', 'e30:1ozZyx:kkaJkHvS0-r38Wk1EAkIW_ikx6LaKbIJ1YOSMObC-aE', '2022-12-12 08:59:19.726985'),
('b323cu4yrmfjx6tto6z8pudq1djmm2xc', 'e30:1otvNc:Axle5eAyBFcO5tyovYZgq1IvwiARvOwLOwMUKowvcDE', '2022-11-26 18:37:24.945121'),
('buze90887gv4wat4qe5pc4reyzgv7dbk', 'e30:1ox2WO:TKQXOpMO6NUEY5rzrlptFDAVKMWcKrgrNU-iiDK-ETQ', '2022-12-05 08:51:20.054136'),
('cepbfwcptcl12llfylad76yeuanovpp3', 'e30:1p1960:jwJeflzqKjg77nNVQfnWn6bPuusr8Z-6lBOkhISmxUw', '2022-12-16 16:41:04.082801'),
('cgpc9dt814lunhfnl4ad3bypzkdc3vkj', 'YjMyODg0NWEwNzlmNmEwMmY5ZjBhMzNmNTk2NDk3NjFhY2E3ODYzMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTQ3NzE2ZTM2MjE4ZGE2ZmUzYmI3MGE1YWQ4MmY5YWZmZDQ1NmY2In0=', '2022-11-25 10:57:11.364342'),
('chh8a85t1vl5dp59n87u2n0xfxy9d4v3', '.eJxVjDsOAiEUAO9CbQiPP5b2e4YN7wGyaiDZT2W8uyHZQtuZybzZHI-9zseW13lJ7MqAXX4ZRnrmNkR6xHbvnHrb1wX5SPhpNz71lF-3s_0b1LjVsfUxgLZRo0cnbUlIKEALi2AyYKFicnCojEQZgILAkIC0d1oVAuXZ5wvknDfI:1pBXs1:hM7LtBEZPDVsAM6VXyAtZkJnnCHtBKL69jVEc85IRX0', '2023-01-14 09:09:37.060240'),
('cvqvrxyjzy2u1swr97mdbsd8gy8wjw2k', '.eJxVjDsOwyAQBe9CHSFYfiZlep8BLbAOTiKQjF1FuXtsyUXSvpl5bxZwW0vYOi1hzuzKJLv8bhHTk-oB8gPrvfHU6rrMkR8KP2nnY8v0up3u30HBXvYawEQyKVvth2QJDTgvhdZRymyFQ6mUFbuE6J3FSE7gJAbUExBAtop9vsW6Nyg:1ouT9c:_MPBHOuPz_pZjZhgthmGyMLKPY9wW6gdQhhK9xVMpmA', '2022-11-28 06:41:12.882537'),
('esfsibl1x9crvrniprb0pf91frokf96d', 'e30:1oynNc:LEOYslAB8i5dkCaOQQODRAL3Wnp3-b-dTTNjjBfAygk', '2022-12-10 05:05:32.578285'),
('ey9attr0tgsnmp9x04k9n4mdaihv7eku', 'e30:1p55dT:xrzpKiepjM5V_MycLalzSrAaD3k81YbfnZTi510sBv4', '2022-12-27 13:47:55.552133'),
('fvif2os7g68ectn0l5t6ukyfpc4unhyy', 'e30:1pA53n:72NMoQAHC-F2Tp2RmoO18AZhulKO0S6BwnU0bbGQ_N8', '2023-01-10 08:11:43.707100'),
('fx2j6hbc59v69mpmv5e83dkf3qmix8ks', 'e30:1oyz0D:mi1MrkuZKDZSjvPPp0rUHNXamklAkB_4EoQLZSK9K4A', '2022-12-10 17:30:09.367001'),
('ghqyj7zko6cevvqgnbam3ofmmn1hqdeo', 'e30:1p1d5j:nizcIEbuGEBBRQfHL1S-79npPk4yq5E-LpXRq02iQKQ', '2022-12-18 00:42:47.415156'),
('h2z7cmqvi787cq1sjoecjzk5ku8se199', 'e30:1ow28C:L938jhlGTt_E57LALT9KRtRQyz8IwLVH040UhcBL8b8', '2022-12-02 14:14:12.529044'),
('h4lg4156i42yepp11fc3ig5qpkaez6fe', 'e30:1pBPyq:OFZZ4EVVfU6zfLmHtSjXx08mXdCLBk0aLohraQtzfuc', '2023-01-14 00:44:08.185984'),
('i0tzen78odzovy895x44ugv292edocw4', 'e30:1ow7YR:QucWWS5Fhk59BEqcI-SULsLjhBhhLtNrbtFxwvme3ow', '2022-12-02 20:01:39.808207'),
('ie2d0wkel1qrg62wd8o9vpy695wtp7no', '.eJxVjDsOAiEUAO9CbQiPP5b2e4YN7wGyaiDZT2W8uyHZQtuZybzZHI-9zseW13lJ7MqAXX4ZRnrmNkR6xHbvnHrb1wX5SPhpNz71lF-3s_0b1LjVsfUxgLZRo0cnbUlIKEALi2AyYKFicnCojEQZgILAkIC0d1oVAuXZ5wvknDfI:1pBJAV:rKqpcdbHkKXE4nXU-l_ourrhQnQl8eu1EigT_rnrf54', '2023-01-13 17:27:43.291332'),
('in31xkkk9gziq07jupkp4rk9qz9so715', 'e30:1p1960:jwJeflzqKjg77nNVQfnWn6bPuusr8Z-6lBOkhISmxUw', '2022-12-16 16:41:04.085295'),
('izp20h9er0ub83tak5kv9ili9w52tri1', 'e30:1oyypJ:RrnhTIq-7tSXpsM8Zxa8XxtFRcL3eFoHngZldlSURJ0', '2022-12-10 17:18:53.941209'),
('j5218nys2cggjkyi46m8yil24dwf7adh', 'e30:1otwM4:lh9k6UBpDlPfNaVTZ67SPDTH2s_mymNW-KJJ-Flb87w', '2022-11-26 19:39:52.537537'),
('j9i9md3lsii87vi2tv9mkx9fmabr82x4', 'e30:1p2bNC:NfYcPshGMZG7ADfnZGB4GL7AUj0l7aCam-lPE9GCJiU', '2022-12-20 17:04:50.054319'),
('jb1b80oz8b77lvltuxs7l0d7hcqoo2xe', '.eJxVjDsOwyAQBe9CHSFYfiZlep8BLbAOTiKQjF1FuXtsyUXSvpl5bxZwW0vYOi1hzuzKJLv8bhHTk-oB8gPrvfHU6rrMkR8KP2nnY8v0up3u30HBXvYawEQyKVvth2QJDTgvhdZRymyFQ6mUFbuE6J3FSE7gJAbUExBAtop9vsW6Nyg:1p7XUN:ZOOjp6hUUhPuAjtfjUzeDJGurrzsFdqBrQgnbaRdUY8', '2023-01-03 07:56:39.876073'),
('jevx52ks5cajpc30h02e0et6g2omxnnp', 'e30:1oz0Sl:vPfWADyy7caiKOIZnLHeYL2cByBSSztDm0LzbQvCaeo', '2022-12-10 19:03:43.005767'),
('kbltl95zwv4wwyyatuwd4gabyzjx6h1n', 'e30:1ow28C:L938jhlGTt_E57LALT9KRtRQyz8IwLVH040UhcBL8b8', '2022-12-02 14:14:12.744921'),
('kybrbr4p3ltsvy30xirrdpgkzpx55o3t', 'e30:1p2gSZ:TjRvGIKBPjFu4LQ1nbvw_jp3UIXIcMXju7KP6kMiWcs', '2022-12-20 22:30:43.286155'),
('l2ekxxki9qtna5bbi79eqp9wigb563yq', 'e30:1ouqMA:1kWkk-o6I3BgTFZDQTdeCr-G1kvgiXVq2GGlNaL9WWw', '2022-11-29 07:27:42.833195'),
('lcgplfuc9glh93q2a2295fdkib26r6jc', 'YjMyODg0NWEwNzlmNmEwMmY5ZjBhMzNmNTk2NDk3NjFhY2E3ODYzMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTQ3NzE2ZTM2MjE4ZGE2ZmUzYmI3MGE1YWQ4MmY5YWZmZDQ1NmY2In0=', '2022-11-26 07:16:56.831944'),
('ld1opewjm84qfgqha06t3paxpwjzpsuj', 'e30:1otwaN:b5H7HgIkzT2d5gcBPA8jUHELrnUsMCE-fGpkWj1OWWg', '2022-11-26 19:54:39.943197'),
('lf9kgtixny24dz550qkzxp7ooqsgh0g1', 'e30:1oyoRC:Si3Vng2BB76TORdCtJMpkA4Bn6hz2FfUw1IGzDDmNZs', '2022-12-10 06:13:18.945814'),
('lnw4p0i9pg6oeosttdzjv5pxm7msas35', 'e30:1ow28H:iFeEdVuWDttrqS28En9slsAcGxBq5tQUhIEyq2bngzU', '2022-12-02 14:14:17.621497'),
('lv4td7hv3x1kjtmzzoieuotgm2vdexll', 'e30:1ouUmR:KyWO71wwmg8rHc64gCwr6WpPotg49AyduXerBcyFycU', '2022-11-28 08:25:23.097604'),
('lwte95w8amknk8cd0o1uodfu3dxrv493', 'e30:1p2bNC:NfYcPshGMZG7ADfnZGB4GL7AUj0l7aCam-lPE9GCJiU', '2022-12-20 17:04:50.050370'),
('m4qbnqj6qsh1rdrk8wgd4zfssnd81v71', 'YjMyODg0NWEwNzlmNmEwMmY5ZjBhMzNmNTk2NDk3NjFhY2E3ODYzMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTQ3NzE2ZTM2MjE4ZGE2ZmUzYmI3MGE1YWQ4MmY5YWZmZDQ1NmY2In0=', '2022-11-24 11:25:10.211572'),
('mlf7lobe8p7uabn0cukkh93cj8zbr7j0', 'e30:1p0BsX:HyzUA6xgftF_ofsUH4GXA5RDKUv8UP_Bn38Vu6oIQ3M', '2022-12-14 01:27:13.503769'),
('mq8c6sacxbep82v6btu41sknmj0sxsbt', 'e30:1p0EKy:JA4OM8810yhxpZiX2xMvTkvtAQQ-e9NT9s_lsAnEvQA', '2022-12-14 04:04:44.469318'),
('o5lpgyaz7bhclvrcywkbhw82u1kl4979', 'e30:1p0EKv:lWEh8MHmfi6G3y2YxXcaCCENVVs948acEX8iehiSyaU', '2022-12-14 04:04:41.663496'),
('okgwxmri2q8inqbnpyonc0vf4h9uwvqz', 'e30:1owSxS:HWXsMvoKWxY4Vs__f2zNXy8d9CMvO4AG1Wlzb8hMBSg', '2022-12-03 18:52:54.018124'),
('p08ygmwig1a9mcvs2twrs75z76o7kaa9', 'e30:1otwaV:bcxtqJfUH2gsWRbgMLVYNTqLRVMsPpcZO1cX02NHzYc', '2022-11-26 19:54:47.661102'),
('p5u8zndi2vr3okh1zffo76cnzzg3jpsc', 'e30:1pBKQj:AL0g1QUqNF-yerSBmlK9Sx96DxxlocTRoAaBIqA-WMo', '2023-01-13 18:48:33.866143'),
('padwwspxdcykckvov37whmqwswcp7tfz', 'e30:1p6hCP:035940urdGwr-bn0T0DL17pruUibt0AKM98xfXMSrQE', '2023-01-01 00:06:37.887754'),
('qjc2s3c0pajof4n20vzrq40fmero3ii8', 'e30:1owCLY:5fuZTDtm7Nhp0WMN9HIZZG7uMNut8gE5Auu0cNhO2jI', '2022-12-03 01:08:40.007341'),
('qwqwzhy9dczko1qykhwjfpirbfjhingg', 'e30:1p6x6Z:PHZTpakpZQtVDWbW2Lxpx-TjVh5W61REChFJ79UC_7I', '2023-01-01 17:05:39.765301'),
('r3jstdhwqn7hedcwexiyf5eguhslx3g8', 'e30:1otwNS:RzQr5rV8FdPAzDV9gqVWVvKJuwyfbBNDf8b90_IiX9I', '2022-11-26 19:41:18.596739'),
('rqcmiorg37pruiiej91rkc2ig2b76f6i', 'e30:1p0EKo:9_e56hHEQqPAuLSeJbifFBPElb23StiKaFsSHw61nAs', '2022-12-14 04:04:34.380180'),
('sxceaeqjdhnf088ncx1x52ev2cjpj9th', 'e30:1ozZyx:kkaJkHvS0-r38Wk1EAkIW_ikx6LaKbIJ1YOSMObC-aE', '2022-12-12 08:59:19.724050'),
('tl3ldcingr0jdlhkpqmz3uzcr7yfvg5i', 'e30:1ow28I:iTkTyOBsWN_cqVLxTg9rLvBrhWPtVQqsNRCL1xBM6uM', '2022-12-02 14:14:18.060586'),
('tqmm2ynqvud4jsxxddufurfx99x5t0u4', 'e30:1p5gZJ:Wi7V_mZaMeV_YuGm-bXglKMo0BOlKu9HrOyamkt5JRE', '2022-12-29 05:14:05.246642'),
('ukofqogl7megmjxvkkqkre7kv5fgcmrw', 'YjMyODg0NWEwNzlmNmEwMmY5ZjBhMzNmNTk2NDk3NjFhY2E3ODYzMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTQ3NzE2ZTM2MjE4ZGE2ZmUzYmI3MGE1YWQ4MmY5YWZmZDQ1NmY2In0=', '2022-11-25 06:32:36.869887'),
('v1ffs60gbdbhizoey3zkv2ahtnjc5ukj', 'e30:1pBKUg:-VYsIk2be7FR-5z1ghUguiiGimohX5Hm06jeUW2hIZs', '2023-01-13 18:52:38.971517'),
('v7lfdfwfkb1zhwvv9x9jnqf0wqtql8dn', 'ODUyZGNjYzhmOWNkMmNkZmNhMDA2NDkzZWQzNDZmOGRhZWM4NzI3NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NzhkYTdmZTdkNDAxOThhMWY1YTQ2NDQ4ZGQ0MTVkMGRlNWUzYTAwIn0=', '2023-01-13 16:58:01.598713'),
('v85dm80n8sqnj76g713jr8ijxhxbas53', 'e30:1otwbM:NP9LV9_hi5UqD8_W5pywHQ0Y4c9mAVeEWdL0rbQ6TVA', '2022-11-26 19:55:40.619206'),
('xujok0fj0grwso0facdbmr31t57y81n2', '.eJxVjMsOwiAQRf-FtSEQHgMu3fsNZIYBqRqalHZl_Hdt0oVu7znnvkTCbW1pG2VJE4uzMOL0uxHmR-k74Dv22yzz3NdlIrkr8qBDXmcuz8vh_h00HO1bVxuKgVrJWh00Wherz7oCG0McIqEiFVkxGQfVKxUjoPNAzoCPmpx4fwDphTeI:1pBYOy:6IqATx5tXp-u4i-2ZAYKqbYJYw9PwM1Y1RzNvoXlnik', '2023-01-14 09:43:40.846321'),
('yk6pdd7fl81psdac5x5p86mabp7e14yr', 'e30:1p1OHW:a2miryMUF3FYBuyzCyqWRF9chvmxozbn1_uuMCZJp6M', '2022-12-17 08:53:58.866577'),
('ysz1l7waw07rbp6za4m97h7ryi0v8hdh', 'e30:1otzEj:VKx7Mvt_Ps4OphbEOzB7iXy-yj1FcjP4NDPMViOAb8k', '2022-11-26 22:44:29.775180');

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_api_mpesapayment`
--

CREATE TABLE `mpesa_api_mpesapayment` (
  `id` int(11) NOT NULL,
  `merchant_id` varchar(100) NOT NULL,
  `checkout_id` varchar(100) NOT NULL,
  `response` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mpesa_api_mpesapayment`
--

INSERT INTO `mpesa_api_mpesapayment` (`id`, `merchant_id`, `checkout_id`, `response`, `created_at`, `user_id`, `updated_at`, `order_number`) VALUES
(1, '32584-4829621-2', 'ws_CO_19112022161639465726646600', 'Success. Request accepted for processing', '2022-11-19 13:16:41.426313', 2, '2022-11-19 13:16:41.426355', '202211191'),
(2, '32273-7025375-1', 'ws_CO_20112022104545339726646600', 'Success. Request accepted for processing', '2022-11-20 07:45:46.381729', 2, '2022-11-20 07:45:46.381771', '202211202'),
(3, '32503-50277413-1', 'ws_CO_20122022110053433720650146', 'Success. Request accepted for processing', '2022-12-20 08:00:57.564960', 2, '2022-12-20 08:00:57.565002', '202212203');

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_api_mpesapaymentcallback`
--

CREATE TABLE `mpesa_api_mpesapaymentcallback` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `merchant_id` varchar(300) NOT NULL,
  `checkout_id` varchar(300) NOT NULL,
  `result_code` longtext NOT NULL,
  `result_desc` longtext NOT NULL,
  `amount` varchar(300) NOT NULL,
  `receipt_number` longtext NOT NULL,
  `phone_number` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_order`
--

CREATE TABLE `order_order` (
  `id` int(11) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `subcounty` varchar(50) NOT NULL,
  `order_note` varchar(100) NOT NULL,
  `order_total` double NOT NULL,
  `shipping` double NOT NULL,
  `status` varchar(10) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `is_ordered` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_order`
--

INSERT INTO `order_order` (`id`, `order_number`, `first_name`, `last_name`, `phone`, `email`, `county`, `subcounty`, `order_note`, `order_total`, `shipping`, `status`, `ip`, `is_ordered`, `created_at`, `updated_at`, `payment_id`, `user_id`) VALUES
(1, '202211191', 'Ranja', 'Calvin', '0726646600', 'ranjacalvin@gmail.com', 'Nairobi', 'Kasarani', '', 103734, 2034, 'New', '197.237.6.54', 0, '2022-11-19 13:16:19.072082', '2022-11-19 13:16:19.084347', NULL, 2),
(2, '202211202', 'Ranja', 'Calvin', '0726646600', 'ranjacalvin@gmail.com', 'Nairobi', 'Kasarani', '', 128214, 2514, 'New', '196.216.71.162', 0, '2022-11-20 07:45:33.154343', '2022-11-20 07:45:33.160919', NULL, 2),
(3, '202212203', 'Ranja', 'Calvin', '0726646600', 'ranjacalvin@gmail.com', 'Nairobi', 'Kasarani', '', 151674, 2974, 'New', '154.158.144.239', 0, '2022-12-20 08:00:11.435836', '2022-12-20 08:00:11.439871', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_orderproduct`
--

CREATE TABLE `order_orderproduct` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_orderproduct_variations`
--

CREATE TABLE `order_orderproduct_variations` (
  `id` int(11) NOT NULL,
  `orderproduct_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_payment`
--

CREATE TABLE `order_payment` (
  `id` int(11) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount_paid` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_wishlist`
--

CREATE TABLE `order_wishlist` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_wishlist_variations`
--

CREATE TABLE `order_wishlist_variations` (
  `id` int(11) NOT NULL,
  `wishlist_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store_marketingimages`
--

CREATE TABLE `store_marketingimages` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `on_offer` tinyint(1) NOT NULL,
  `new_product` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `large` tinyint(1) NOT NULL,
  `by_category` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_marketingimages`
--

INSERT INTO `store_marketingimages` (`id`, `image`, `on_offer`, `new_product`, `created_at`, `updated_at`, `large`, `by_category`) VALUES
(1, 'marketing/Sip.png', 0, 0, '2022-11-12 07:21:36.750196', '2022-11-12 07:21:36.750196', 1, 0),
(2, 'marketing/1.png', 1, 0, '2022-11-12 07:58:45.058467', '2022-11-12 07:58:45.058467', 0, 0),
(3, 'marketing/2.png', 1, 0, '2022-11-12 07:58:58.165850', '2022-11-12 07:58:58.165850', 0, 0),
(4, 'marketing/3.png', 1, 0, '2022-11-12 07:59:10.359756', '2022-11-12 07:59:10.359756', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `store_product`
--

CREATE TABLE `store_product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `discount_price` int(11) NOT NULL,
  `photo_main` varchar(100) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `color_your_world` tinyint(1) NOT NULL,
  `flash_sales` tinyint(1) NOT NULL,
  `in_store_offers` tinyint(1) NOT NULL,
  `most_viewed` tinyint(1) NOT NULL,
  `new_arrival` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store_productgallery`
--

CREATE TABLE `store_productgallery` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store_reviewrating`
--

CREATE TABLE `store_reviewrating` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `review` longtext NOT NULL,
  `rating` double NOT NULL,
  `ip` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store_variation`
--

CREATE TABLE `store_variation` (
  `id` int(11) NOT NULL,
  `variation_category` varchar(100) NOT NULL,
  `variation_value` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory_sub_category`
--

CREATE TABLE `subcategory_sub_category` (
  `id` int(11) NOT NULL,
  `sub_category_name` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `sub_category_image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategory_sub_category`
--

INSERT INTO `subcategory_sub_category` (`id`, `sub_category_name`, `slug`, `sub_category_image`, `created_at`, `category_id`) VALUES
(20, 'Executive Desks', 'executive-desks', '', '2022-12-31 09:51:31.338974', 1),
(21, 'Office Chairs', 'office-chairs', '', '2022-12-31 09:52:48.056884', 1),
(22, 'Office Cabinets', 'office-cabinets', '', '2022-12-31 09:53:10.205097', 1),
(23, 'Waiting Area Seats', 'waiting-area-seats', '', '2022-12-31 09:53:31.379705', 1),
(24, 'Office Desks', 'office-desks', '', '2022-12-31 09:53:49.471202', 1),
(25, 'Office Carpets', 'office-carpets', '', '2022-12-31 09:54:16.830815', 1),
(26, 'Reception Desks', 'reception-desks', '', '2022-12-31 09:55:28.494795', 1),
(27, 'Office Coffee Table', 'office-coffee-table', '', '2022-12-31 09:56:33.120320', 1),
(28, 'Swings', 'swings', '', '2022-12-31 09:58:50.785589', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_account`
--
ALTER TABLE `accounts_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `blog_blogauthor`
--
ALTER TABLE `blog_blogauthor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_blogpost`
--
ALTER TABLE `blog_blogpost`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `blog_blogpost_slug_9e84ade1` (`slug`),
  ADD KEY `blog_blogpost_author_id_ffcc150f_fk_blog_blogauthor_id` (`author_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_blog_id_1f77eacd_fk_blog_blogpost_id` (`blog_id`);

--
-- Indexes for table `blog_helpcenter`
--
ALTER TABLE `blog_helpcenter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_helpcenter_user_id_ee3729a7_fk_accounts_account_id` (`user_id`);

--
-- Indexes for table `blog_newsletter`
--
ALTER TABLE `blog_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_youtubevideo`
--
ALTER TABLE `blog_youtubevideo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts_cart`
--
ALTER TABLE `carts_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts_cartitem`
--
ALTER TABLE `carts_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_cartitem_user_id_4d21e0d9_fk_accounts_account_id` (`user_id`),
  ADD KEY `carts_cartitem_cart_id_9cb0a756_fk` (`cart_id`),
  ADD KEY `carts_cartitem_product_id_acd010e4_fk` (`product_id`);

--
-- Indexes for table `carts_cartitem_variations`
--
ALTER TABLE `carts_cartitem_variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_cartitem_variations_cartitem_id_variation_id_5f8efaf5_uniq` (`cartitem_id`,`variation_id`),
  ADD KEY `carts_cartitem_varia_variation_id_ef9f9ee3_fk_store_var` (`variation_id`);

--
-- Indexes for table `category_category`
--
ALTER TABLE `category_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `contact_contactus`
--
ALTER TABLE `contact_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_socials`
--
ALTER TABLE `contact_socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_account_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mpesa_api_mpesapayment`
--
ALTER TABLE `mpesa_api_mpesapayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpesa_api_mpesapayment_user_id_3b7062fa_fk_accounts_account_id` (`user_id`);

--
-- Indexes for table `mpesa_api_mpesapaymentcallback`
--
ALTER TABLE `mpesa_api_mpesapaymentcallback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpesa_api_mpesapayme_user_id_f760499f_fk_accounts_` (`user_id`);

--
-- Indexes for table `order_order`
--
ALTER TABLE `order_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_order_user_id_7cf9bc2b_fk_accounts_account_id` (`user_id`),
  ADD KEY `order_order_payment_id_d8fb3a38_fk` (`payment_id`);

--
-- Indexes for table `order_orderproduct`
--
ALTER TABLE `order_orderproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_orderproduct_user_id_d5f4875a_fk_accounts_account_id` (`user_id`),
  ADD KEY `order_orderproduct_order_id_18dae3b0_fk` (`order_id`),
  ADD KEY `order_orderproduct_payment_id_13b3c50a_fk` (`payment_id`),
  ADD KEY `order_orderproduct_product_id_54ab3eb7_fk` (`product_id`);

--
-- Indexes for table `order_orderproduct_variations`
--
ALTER TABLE `order_orderproduct_variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_orderproduct_varia_orderproduct_id_variatio_f085dd17_uniq` (`orderproduct_id`,`variation_id`),
  ADD KEY `order_orderproduct_v_variation_id_f6f1a99d_fk_store_var` (`variation_id`);

--
-- Indexes for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payment_user_id_51d05b30_fk_accounts_account_id` (`user_id`);

--
-- Indexes for table `order_wishlist`
--
ALTER TABLE `order_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_wishlist_user_id_100c3c26_fk_accounts_account_id` (`user_id`),
  ADD KEY `order_wishlist_product_id_5e316806_fk` (`product_id`);

--
-- Indexes for table `order_wishlist_variations`
--
ALTER TABLE `order_wishlist_variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_wishlist_variations_wishlist_id_variation_id_d2167472_uniq` (`wishlist_id`,`variation_id`),
  ADD KEY `order_wishlist_varia_variation_id_cf54b083_fk_store_var` (`variation_id`);

--
-- Indexes for table `store_marketingimages`
--
ALTER TABLE `store_marketingimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_product`
--
ALTER TABLE `store_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD KEY `store_product_slug_6de8ee4b` (`slug`),
  ADD KEY `store_product_category_id_574bae65_fk` (`category_id`),
  ADD KEY `store_product_sub_category_id_0afd4673_fk` (`sub_category_id`);

--
-- Indexes for table `store_productgallery`
--
ALTER TABLE `store_productgallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_productgallery_product_id_f2821a49_fk` (`product_id`);

--
-- Indexes for table `store_reviewrating`
--
ALTER TABLE `store_reviewrating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_reviewrating_user_id_da0ed849_fk_accounts_account_id` (`user_id`),
  ADD KEY `store_reviewrating_product_id_2e1974d6_fk` (`product_id`);

--
-- Indexes for table `store_variation`
--
ALTER TABLE `store_variation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_variation_product_id_e4f08cbc_fk` (`product_id`);

--
-- Indexes for table `subcategory_sub_category`
--
ALTER TABLE `subcategory_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `subcategory_sub_category_category_id_1852cb27_fk` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_account`
--
ALTER TABLE `accounts_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `blog_blogauthor`
--
ALTER TABLE `blog_blogauthor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_blogpost`
--
ALTER TABLE `blog_blogpost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_helpcenter`
--
ALTER TABLE `blog_helpcenter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_newsletter`
--
ALTER TABLE `blog_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_youtubevideo`
--
ALTER TABLE `blog_youtubevideo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts_cart`
--
ALTER TABLE `carts_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts_cartitem`
--
ALTER TABLE `carts_cartitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `carts_cartitem_variations`
--
ALTER TABLE `carts_cartitem_variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_category`
--
ALTER TABLE `category_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_contactus`
--
ALTER TABLE `contact_contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_socials`
--
ALTER TABLE `contact_socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `mpesa_api_mpesapayment`
--
ALTER TABLE `mpesa_api_mpesapayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mpesa_api_mpesapaymentcallback`
--
ALTER TABLE `mpesa_api_mpesapaymentcallback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_order`
--
ALTER TABLE `order_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_orderproduct`
--
ALTER TABLE `order_orderproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_orderproduct_variations`
--
ALTER TABLE `order_orderproduct_variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_payment`
--
ALTER TABLE `order_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_wishlist`
--
ALTER TABLE `order_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_wishlist_variations`
--
ALTER TABLE `order_wishlist_variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_marketingimages`
--
ALTER TABLE `store_marketingimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `store_product`
--
ALTER TABLE `store_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `store_productgallery`
--
ALTER TABLE `store_productgallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_reviewrating`
--
ALTER TABLE `store_reviewrating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_variation`
--
ALTER TABLE `store_variation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategory_sub_category`
--
ALTER TABLE `subcategory_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  ADD CONSTRAINT `accounts_userprofile_user_id_92240672_fk` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `blog_blogpost`
--
ALTER TABLE `blog_blogpost`
  ADD CONSTRAINT `blog_blogpost_author_id_ffcc150f_fk_blog_blogauthor_id` FOREIGN KEY (`author_id`) REFERENCES `blog_blogauthor` (`id`);

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_blog_id_1f77eacd_fk_blog_blogpost_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blogpost` (`id`);

--
-- Constraints for table `blog_helpcenter`
--
ALTER TABLE `blog_helpcenter`
  ADD CONSTRAINT `blog_helpcenter_user_id_ee3729a7_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `carts_cartitem`
--
ALTER TABLE `carts_cartitem`
  ADD CONSTRAINT `carts_cartitem_cart_id_9cb0a756_fk` FOREIGN KEY (`cart_id`) REFERENCES `carts_cart` (`id`),
  ADD CONSTRAINT `carts_cartitem_product_id_acd010e4_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `carts_cartitem_user_id_4d21e0d9_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `mpesa_api_mpesapayment`
--
ALTER TABLE `mpesa_api_mpesapayment`
  ADD CONSTRAINT `mpesa_api_mpesapayment_user_id_3b7062fa_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `mpesa_api_mpesapaymentcallback`
--
ALTER TABLE `mpesa_api_mpesapaymentcallback`
  ADD CONSTRAINT `mpesa_api_mpesapayme_user_id_f760499f_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `order_order`
--
ALTER TABLE `order_order`
  ADD CONSTRAINT `order_order_payment_id_d8fb3a38_fk` FOREIGN KEY (`payment_id`) REFERENCES `order_payment` (`id`),
  ADD CONSTRAINT `order_order_user_id_7cf9bc2b_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `order_orderproduct`
--
ALTER TABLE `order_orderproduct`
  ADD CONSTRAINT `order_orderproduct_order_id_18dae3b0_fk` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  ADD CONSTRAINT `order_orderproduct_payment_id_13b3c50a_fk` FOREIGN KEY (`payment_id`) REFERENCES `order_payment` (`id`),
  ADD CONSTRAINT `order_orderproduct_product_id_54ab3eb7_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `order_orderproduct_user_id_d5f4875a_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD CONSTRAINT `order_payment_user_id_51d05b30_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `order_wishlist`
--
ALTER TABLE `order_wishlist`
  ADD CONSTRAINT `order_wishlist_product_id_5e316806_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `order_wishlist_user_id_100c3c26_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `store_product`
--
ALTER TABLE `store_product`
  ADD CONSTRAINT `store_product_category_id_574bae65_fk` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`),
  ADD CONSTRAINT `store_product_sub_category_id_0afd4673_fk` FOREIGN KEY (`sub_category_id`) REFERENCES `subcategory_sub_category` (`id`);

--
-- Constraints for table `store_productgallery`
--
ALTER TABLE `store_productgallery`
  ADD CONSTRAINT `store_productgallery_product_id_f2821a49_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`);

--
-- Constraints for table `store_reviewrating`
--
ALTER TABLE `store_reviewrating`
  ADD CONSTRAINT `store_reviewrating_product_id_2e1974d6_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_reviewrating_user_id_da0ed849_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Constraints for table `store_variation`
--
ALTER TABLE `store_variation`
  ADD CONSTRAINT `store_variation_product_id_e4f08cbc_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`);

--
-- Constraints for table `subcategory_sub_category`
--
ALTER TABLE `subcategory_sub_category`
  ADD CONSTRAINT `subcategory_sub_category_category_id_1852cb27_fk` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
