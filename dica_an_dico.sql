-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2024 at 07:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dica_an_dico`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `about_us_id` int(11) NOT NULL,
  `about_us_heading` varchar(50) DEFAULT NULL,
  `about_us_description` text DEFAULT NULL,
  `about_us_btn_title` varchar(50) DEFAULT NULL,
  `about_us_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`about_us_id`, `about_us_heading`, `about_us_description`, `about_us_btn_title`, `about_us_image`) VALUES
(1, 'We take Garranty our work', 'Interior design is the art and science of enhancing the interior of a building to achieve a healthier and more aesthetically pleasing environment for the people using the space', 'Read More Info', '1729737355830best-home-interior-design.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `about_us_info`
--

CREATE TABLE `about_us_info` (
  `about_us_id` int(11) NOT NULL,
  `about_heading` varchar(500) DEFAULT NULL,
  `about_us_desc` text DEFAULT NULL,
  `button_name` varchar(200) DEFAULT NULL,
  `about_us_info_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_us_info`
--

INSERT INTO `about_us_info` (`about_us_id`, `about_heading`, `about_us_desc`, `button_name`, `about_us_info_image`) VALUES
(1, 'this is heading', 'this is a description', 'Read More', '1731470406760best-home-interior-design.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) DEFAULT NULL,
  `admin_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_password`) VALUES
(1, 'ganesh', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `admin_profile`
--

CREATE TABLE `admin_profile` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_img` varchar(100) DEFAULT NULL,
  `admin_pass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_profile`
--

INSERT INTO `admin_profile` (`id`, `admin_name`, `admin_img`, `admin_pass`) VALUES
(1, 'ganesh', '1731653845644admin 4.jpg', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `blog_img` varchar(100) DEFAULT NULL,
  `bloger_name` varchar(200) DEFAULT NULL,
  `blog_head` varchar(200) DEFAULT NULL,
  `blog_details` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `blog_img`, `bloger_name`, `blog_head`, `blog_details`) VALUES
(1, '1729830864371sofa2.jpg', 'Admin 22', 'Cras accumsan nulla nec lacus ultricies placerat.', 'defrdgtfyghj'),
(6, '1729830669388sofa2.jpg', 'Admin 22', 'Making Sofa by interior and achitecture', 'Making attractive sofa for hall .');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `cat_id` int(11) NOT NULL,
  `blog_cat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`cat_id`, `blog_cat`) VALUES
(1, 'Furniture'),
(2, 'Minimalist '),
(3, 'Eclectic style'),
(4, 'Modern interior design'),
(12, 'akash');

-- --------------------------------------------------------

--
-- Table structure for table `blog_details`
--

CREATE TABLE `blog_details` (
  `blog_id` int(11) NOT NULL,
  `blog_image` text DEFAULT NULL,
  `blog_head` varchar(200) DEFAULT NULL,
  `blog_post_by` varchar(200) DEFAULT NULL,
  `blog_desc` text DEFAULT NULL,
  `cat_id` varchar(20) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_details`
--

INSERT INTO `blog_details` (`blog_id`, `blog_image`, `blog_head`, `blog_post_by`, `blog_desc`, `cat_id`, `created_date`) VALUES
(33, '1731128110655Coastal.jpeg', 'Home Interior Design Ideas', 'sunil ithape', 'A Definitive Guide On How To Hire An Interior Designer For Your Home The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.	', '1', '2024-11-09 10:25:10'),
(34, '1731130207465furniture.png', 'Attractive interiors design', 'sunil ithape', 'A luxurious style that uses orderly elements to create beautifully proportioned spacesThe central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.	', '1', '2024-11-09 11:00:07'),
(35, '1731136486880image5.png', 'Minimalist ', 'ganesh Kangude', 'The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.', '2', '2024-11-09 12:44:46'),
(36, '1731136759733best-home-interior-design.jpg', 'modern interiors trending design ', 'Om Survase', 'The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.The central idea behind Minimalism is “less is more”, with minimalist designers promoting the reduction of clutter and the simplification of interiors in order to promote the richness that can be found in emptiness. With elements taken from Japanese Zen Philosophy, minimalist interior designers seek to create calm, pure, and harmonious spaces. This is achieved through the use of features such as white walls, neutral color palettes, natural flooring, and the reduction of visual distractions. An example of a Minimalist-style bedroom.	', '4', '2024-11-09 12:49:19'),
(37, '1731136931592image7.png', 'Scandinavian', 'Kangude Ganesh', 'The Scandinavian style of interior design represents a mixture of styles hailing from Norway, Sweden, Denmark, Finland, and Iceland and encapsulates simplicity, functionality, and a minimalist aesthetic. The style differs from Minimalism in that it creates a warm, relaxed, and inviting feeling through the use of natural light and neutral colors, while bare arrangements and clean detailing show the prioritization of affordability over basic necessity. Frequently seen in Scandinavian-style interiors are the use of tonal textural pieces, the use of natural wood for furniture and accessories, and more industrial pieces for lights and shelving. The Scandinavian style of interior design represents a mixture of styles hailing from Norway, Sweden, Denmark, Finland, and Iceland and encapsulates simplicity, functionality, and a minimalist aesthetic. The style differs from Minimalism in that it creates a warm, relaxed, and inviting feeling through the use of natural light and neutral colors, while bare arrangements and clean detailing show the prioritization of affordability over basic necessity. Frequently seen in Scandinavian-style interiors are the use of tonal textural pieces, the use of natural wood for furniture and accessories, and more industrial pieces for lights and shelving. The Scandinavian style of interior design represents a mixture of styles hailing from Norway, Sweden, Denmark, Finland, and Iceland and encapsulates simplicity, functionality, and a minimalist aesthetic. The style differs from Minimalism in that it creates a warm, relaxed, and inviting feeling through the use of natural light and neutral colors, while bare arrangements and clean detailing show the prioritization of affordability over basic necessity. Frequently seen in Scandinavian-style interiors are the use of tonal textural pieces, the use of natural wood for furniture and accessories, and more industrial pieces for lights and shelving. ', '1', '2024-11-09 12:52:11'),
(38, '1731404806880Eclectic style description.png', 'Eclectic style', 'Kiran Tupe', 'The Scandinavian style of interior design represents a mixture of styles hailing from Norway, Sweden, Denmark, Finland, and Iceland and encapsulates simplicity, functionality, and a minimalist aesthetic. The style differs from Minimalism in that it creates a warm, relaxed, and inviting feeling through the use of natural light and neutral colors, while bare arrangements and clean detailing show the prioritization of affordability over basic necessity. Frequently seen in Scandinavian-style interiors are the use of tonal textural pieces, the use of natural wood for furniture and accessories, and more industrial pieces for lights and shelving. The Scandinavian style of interior design represents a mixture of styles hailing from Norway, Sweden, Denmark, Finland, and Iceland and encapsulates simplicity, functionality, and a minimalist aesthetic. The style differs from Minimalism in that it creates a warm, relaxed, and inviting feeling through the use of natural light and neutral colors, while bare arrangements and clean detailing show the prioritization of affordability over basic necessity. Frequently seen in Scandinavian-style interiors are the use of tonal textural pieces, the use of natural wood for furniture and accessories, and more industrial pieces for lights and shelving. ', '3', '2024-11-12 15:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `contact_add` varchar(500) DEFAULT NULL,
  `contact_email` varchar(500) DEFAULT NULL,
  `contact_mobile` varchar(15) DEFAULT NULL,
  `contact_am` varchar(10) DEFAULT NULL,
  `contact_pm` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `contact_add`, `contact_email`, `contact_mobile`, `contact_am`, `contact_pm`) VALUES
(1, 'Balikashram road , Sukade mala ,pipe line road , Savedi , Maharashtra', 'hydrainterior123@gmail.com', '9987654101', '10:00', '05:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_enq`
--

CREATE TABLE `contact_enq` (
  `id` int(11) NOT NULL,
  `enq_fname` varchar(50) DEFAULT NULL,
  `enq_lname` varchar(50) DEFAULT NULL,
  `enq_about` varchar(100) DEFAULT NULL,
  `enq_email` varchar(100) DEFAULT NULL,
  `enq_msg` text DEFAULT NULL,
  `enq_mobile` varchar(15) DEFAULT NULL,
  `con_date` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_enq`
--

INSERT INTO `contact_enq` (`id`, `enq_fname`, `enq_lname`, `enq_about`, `enq_email`, `enq_msg`, `enq_mobile`, `con_date`, `status`) VALUES
(17, 'varad', 'jagtap', 'furniture', 'v@gmail.com', 'fghjkl', '9874563210', '', 'Approved'),
(18, 'ganesh', 'Kangude', 'furniture', 'g@gmail.com', 'wedfv', '987456210', '', 'Approved'),
(20, 'gfd', 'fdc', 'fd', 'r@gmail.com', 'fdff', '841', '', 'Rejected'),
(21, 'Akash', 'Sonule', 'furniture', 'r@gmail.com', 'rahu', '09689864518', '', 'Approved'),
(22, 'kiran', 'tupe', 'furniture', 'r@gmail.com', 'dfbnjiuytrfdcvbhgf', '9874563210', '', 'Approved'),
(37, 'Akash', 'Sonule', 'furniture', 'g@gmail.com', 'ghjk', '09689864518', '', 'Approved'),
(38, 'dfghjk', 'cdfvgbhnm', 'cvghjk', 'g@gmail.com', 'fghjk', '09689864518', '', 'Approved'),
(39, 'Varad', 'Jagtap', 'furniture', 'r@gmail.com', 'fghjkl;', '9876543210', '', 'Approved'),
(40, 'Akash', 'Sonule', 'fghjk', 'a@gmail.com', 'ghjkl', '09689864518', '', 'Approved'),
(41, 'Akash', 'Sonule', 'furniture', 'a@gmail.com', 'gnm,', '09689864518', '2024-11-14', 'Approved'),
(42, 'Ganesh', 'Dada', 'yz', 'g@gmail.com', 'fghjm,', '741852960', '2024-11-16', 'Approved'),
(43, 'Akash', 'Sonule', 'furniture', 'g@gmail.com', 'fghj', '09689864518', '2024-11-16', 'Approved'),
(44, 'Ganesh', 'Kangude', 'furniture', 'g@gmail.com', 'fsdgdfg', '965', '2024-11-17', 'Approved'),
(45, 'Akash', 'Sonule', 'furniture', 'v@gmail.com', 'dfghjk', '09689864518', '2024-11-18', 'Pending'),
(46, 'Ganesh', 'Kangude', 'wedfv', 'g@gmail.com', 'ghjkl;dsfg', '741852960', '2024-11-18', 'Pending'),
(47, 'Akash', 'Sonule', 'furniture', 'r@gmail.com', 'fdfghjk', '09689864518', '2024-11-18', 'Pending'),
(48, 'Akash', 'Sonule', 'fvfewd', 'v@gmail.com', 'fghjkl;', '09689864518', '2024-11-18', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id` int(11) NOT NULL,
  `counter_head` varchar(200) DEFAULT NULL,
  `int_count` varchar(100) DEFAULT NULL,
  `arc_count` varchar(100) DEFAULT NULL,
  `con_count` varchar(100) DEFAULT NULL,
  `pro_count` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `counter_head`, `int_count`, `arc_count`, `con_count`, `pro_count`) VALUES
(2, 'Our Project are done in aboard ', '99', '15', '125', '125');

-- --------------------------------------------------------

--
-- Table structure for table `emp_review`
--

CREATE TABLE `emp_review` (
  `id` int(11) NOT NULL,
  `emp_name` varchar(100) DEFAULT NULL,
  `emp_img` varchar(100) DEFAULT NULL,
  `emp_position` varchar(100) DEFAULT NULL,
  `emp_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_review`
--

INSERT INTO `emp_review` (`id`, `emp_name`, `emp_img`, `emp_position`, `emp_desc`) VALUES
(2, 'Ganesh', '1731568139266pexels-italo-melo-881954-2379005.jpg', 'Junior Developer', 'Your guys were great knowledgeable, well experienced, efficient and neat. A true to work with intexure');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `faq_que` text DEFAULT NULL,
  `faq_ans` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `faq_que`, `faq_ans`) VALUES
(1, ' What services does Varad Interiors offer?', 'Varad Interiors specializes in residential and commercial interior design, including space planning, custom furniture design, lighting solutions, and project management.'),
(2, 'How do I start a project with Varad Interiors?', 'Simply contact us to schedule an initial consultation. During this meeting, we’ll discuss your vision, budget, and design needs.\r\n'),
(4, 'Does Varad Interiors handle both residential and commercial projects?', 'Yes, we have expertise in designing both residential spaces (homes, apartments) and commercial spaces (offices, retail spaces, etc.)'),
(5, 'What is the typical timeline for a design project?', 'Project timelines vary based on the size and complexity. After an initial consultation, we can provide an estimated timeline tailored to your project.'),
(6, 'Can I see examples of previous work done by Varad Interiors?', 'Absolutely! Please visit our portfolio on our website to view a selection of our completed projects.\r\n\r\n'),
(7, 'What are your design fees?', 'Our fees depend on the project scope and specific services required. We offer a transparent pricing model and will provide a detailed quote after the initial consultation.'),
(8, 'Does Varad Interiors work with a specific design style?', 'We embrace various design styles to meet each client’s unique preferences, from modern and contemporary to traditional and minimalist.'),
(9, 'Will I be able to make changes during the design process?', 'Yes, we encourage client involvement and provide opportunities for feedback at various stages of the design process to ensure satisfaction.'),
(10, 'Do you handle renovations as well as new design projects?', 'Yes, Varad Interiors is experienced in both renovations and new design projects, managing everything from minor updates to full transformations.'),
(11, 'How does Varad Interiors select contractors and vendors?', 'We work with a trusted network of skilled contractors and suppliers, ensuring quality and reliability in every project.');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `gallery_img` varchar(100) DEFAULT NULL,
  `gallery_head` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `gallery_img`, `gallery_head`) VALUES
(6, '1731132418727ourblog_2.jpg', 'blog design'),
(7, '1731132879053ourpro_img1.jpg', 'About design');

-- --------------------------------------------------------

--
-- Table structure for table `instagram_images`
--

CREATE TABLE `instagram_images` (
  `insta_img_id` int(11) NOT NULL,
  `insta_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instagram_images`
--

INSERT INTO `instagram_images` (`insta_img_id`, `insta_image`) VALUES
(10, '1731146264650furniture.png'),
(11, '1731146462869best-home-interior-design.jpg'),
(12, '1731146473157best-home-interior-design.jpg'),
(13, '1731146486907image5.png'),
(14, '1731146498183image7.png'),
(15, '1731146510859image7.png'),
(16, '1731147053355image5.png');

-- --------------------------------------------------------

--
-- Table structure for table `mvimage`
--

CREATE TABLE `mvimage` (
  `mvid` int(11) NOT NULL,
  `mvimage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mvimage`
--

INSERT INTO `mvimage` (`mvid`, `mvimage`) VALUES
(1, '1731474309159Eclectic style description.png');

-- --------------------------------------------------------

--
-- Table structure for table `mvinfo`
--

CREATE TABLE `mvinfo` (
  `mvinfo_id` int(11) NOT NULL,
  `our_company_history` text DEFAULT NULL,
  `our_success_mission` text DEFAULT NULL,
  `our_future_plan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mvinfo`
--

INSERT INTO `mvinfo` (`mvinfo_id`, `our_company_history`, `our_success_mission`, `our_future_plan`) VALUES
(1, 'big description', '11our success mission', '11our future plan');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_date` varchar(50) DEFAULT NULL,
  `news_desc` text DEFAULT NULL,
  `news_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_date`, `news_desc`, `news_image`) VALUES
(1, '2024-11-07', 'News is sometimes called \"hard news\" to differentiate it from soft media ', '1730972538067Eclectic style description.png'),
(4, '2024-11-08', 'News is sometimes called \"hard news\" to differentiate it from soft media', '1731055675005Minimalism.jpg'),
(5, '2024-11-08', 'News is sometimes called \"hard news\" to differentiate it from soft media', '1731055692305furniture.png'),
(6, '2024-11-08', 'News is sometimes called \"hard news\" to differentiate it from soft media', '1731055712309furniture.png');

-- --------------------------------------------------------

--
-- Table structure for table `our_project_information`
--

CREATE TABLE `our_project_information` (
  `our_project_id` int(11) NOT NULL,
  `our_project_title` varchar(50) DEFAULT NULL,
  `our_project_description` text DEFAULT NULL,
  `our_project_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `our_project_information`
--

INSERT INTO `our_project_information` (`our_project_id`, `our_project_title`, `our_project_description`, `our_project_image`) VALUES
(7, 'last project', '1', '1729575661458best-home-interior-design.jpg'),
(11, 'no project', '2', '1729759003536best-home-interior-design.jpg'),
(12, 'My third  Project', 'this is third desc3', '1729737243218best-home-interior-design.jpg'),
(14, 'My fifth  Project', 'this is fifth desc', '1729737273929best-home-interior-design.jpg'),
(15, 'My six  Project', 'this is six desc', '1729737293901best-home-interior-design.jpg'),
(18, 'my new project', 'this is the my best project in my life 6', '1729835536064best-home-interior-design.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `project_type` varchar(100) DEFAULT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `project_img` varchar(100) DEFAULT NULL,
  `project_date` varchar(100) DEFAULT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `project_budget` varchar(100) DEFAULT NULL,
  `project_basic_info` text DEFAULT NULL,
  `project_challenge` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `project_type`, `project_name`, `project_img`, `project_date`, `client_name`, `project_budget`, `project_basic_info`, `project_challenge`) VALUES
(5, 'Interior', 'Kitchen', '1731300288172project_img_3.jpg', NULL, NULL, NULL, NULL, NULL),
(6, 'Interior1', 'Hall Design', '1731300320685project_img_4.jpg', NULL, NULL, NULL, NULL, NULL),
(7, 'Decorative', 'Bed', '17313003640541729737355830best-home-interior-design.jpg', NULL, NULL, NULL, NULL, NULL),
(8, 'Interior', 'Kitchen7', '1731300384030about_us_img.jpg', NULL, NULL, NULL, NULL, NULL),
(9, 'Interior', 'Bed 2', '17313004089541729675837001images (1).jpeg', NULL, NULL, NULL, NULL, NULL),
(10, 'Interior', 'Hall Design', '1731300437107project_img_2.jpg', NULL, NULL, NULL, NULL, NULL),
(11, 'Interior', 'Hall Design', '1731300451641about_us_img.jpg', NULL, NULL, NULL, NULL, NULL),
(12, 'Interior3', 'Kitchen', '17313004824801729507984390best-home-interior-design.jpg', NULL, NULL, NULL, NULL, NULL),
(13, 'Ganesh', 'Kangude', '17313088916341729504302965natureimg.jpg', NULL, NULL, NULL, NULL, NULL),
(14, 'Ganesh1', 'Bed2', '17313092814601729675449712images (1).jpeg', NULL, NULL, NULL, NULL, NULL),
(15, 'Ganesh111', 'Bed2', '17313094159801729675449712images (1).jpeg', '2024-11-13', 'Varad 22', '15000', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Delectus, natus numquam unde qui pariatur porro necessitatibus harum libero commodi rem veritatis in nisi vero odit tenetur esse quidem inventore ex.  ', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Delectus, natus numquam unde qui pariatur porro necessitatibus harum libero commodi rem veritatis in nisi vero odit tenetur esse quidem inventore exLorem ipsum dolor sit amet, consectetur adipiscing elit. Delectus, natus numquam unde qui pariatur porro necessitatibus harum libero commodi rem veritatis in nisi vero odit tenetur esse quidem inventore exconsectetur adipiscing elit. Delectus, natus numquam unde qui pariatur porro necessitatibus harum libero commodi rem veritatis in nisi vero odit tenetur esse quidem inventore exLorem ipsum dolor sit amet, consectetur adipiscing elit. Delectus, natus numquam unde qui pariatur porro necessitatibus harum libero commodi rem veritatis in nisi vero odit tenetur esse quidem inventore ex. ');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `service_plan` varchar(100) DEFAULT NULL,
  `service_rate` varchar(100) DEFAULT NULL,
  `service_feature` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `service_plan`, `service_rate`, `service_feature`) VALUES
(28, 'Basic Plan', '100', '<p>Your initial content here.</p>'),
(29, 'Limited Plan', '200', '<p>Your initial content here.</p>'),
(30, 'Unlimited Plan', '2500', '<p>Your initial content here.</p>'),
(31, 'Featured Plan', '500', '<p>Your initial content here.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `service_enq`
--

CREATE TABLE `service_enq` (
  `id` int(11) NOT NULL,
  `plan_id` varchar(100) NOT NULL,
  `enq_name` varchar(100) DEFAULT NULL,
  `enq_mobile` varchar(15) DEFAULT NULL,
  `enq_email` varchar(100) DEFAULT NULL,
  `enq_address` text DEFAULT NULL,
  `service_plan` text NOT NULL,
  `enq_date` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_enq`
--

INSERT INTO `service_enq` (`id`, `plan_id`, `enq_name`, `enq_mobile`, `enq_email`, `enq_address`, `service_plan`, `enq_date`, `status`) VALUES
(11, '32', 'Akash Sonule', '09689864518', 'r@gmail.com', 'Bhenda', 'Limited ', '2024-11-15', ''),
(12, '29', 'Akash Sonule', '09689864518', 'r@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-15', 'Approved'),
(13, '30', 'Akash Sonule', '09689864518', 'r@gmail.com', 'Bhenda', 'Unlimited Plan', '2024-11-17', 'Rejected'),
(14, '29', 'Akash Sonule', '09689864518', 'v@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-18', 'Pending'),
(15, '28', 'Varad', '96385240', 'v@gmail.com', 'nagar', 'Basic Plan', '2024-11-18', 'Pending'),
(16, '29', 'dfvdfcv', '852', 'r@gmail.com', 'swdfv', 'Limited Plan', '2024-11-18', 'Pending'),
(17, '30', 'Om', '741850', 'o@gmail.com', 'fghjkl', 'Unlimited Plan', '2024-11-18', 'Pending'),
(18, '29', 'Akash Sonule', '09689864518', 'r@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-18', 'Pending'),
(19, '29', 'Akash Sonule', '09689864518', 'r@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-18', 'Pending'),
(20, '29', 'Akash Sonule', '09689864518', 'v@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-18', 'Pending'),
(21, '31', 'Akash Sonule', '09689864518', 'a@gmail.com', 'Bhenda', 'Featured Plan', '2024-11-18', 'Pending'),
(22, '31', 'Akash Sonule', '09689864518', 's@gmail.com', 'Bhenda', 'Featured Plan', '2024-11-18', 'Pending'),
(23, '31', 'Akash Sonule', '09689864518', 'g@gmail.com', 'Bhenda', 'Featured Plan', '2024-11-18', 'Pending'),
(24, '30', 'Akash Sonule', '09689864518', 'a@gmail.com', 'Bhenda', 'Unlimited Plan', '2024-11-18', 'Pending'),
(25, '30', 'Akash Sonule', '09689864518', 'r@gmail.com', 'Bhenda', 'Unlimited Plan', '2024-11-18', 'Pending'),
(26, '29', 'Akash Sonule', '09689864518', 'r@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-18', 'Pending'),
(27, '29', 'Akash Sonule', '09689864518', 'a@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-18', 'Pending'),
(28, '29', 'Akash Sonule', '09689864518', 'g@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-18', 'Pending'),
(29, '29', 'Akash Sonule', '09689864518', 'g@gmail.com', 'Bhenda', 'Limited Plan', '2024-11-18', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `fname`, `mobile`, `email`, `password`) VALUES
(1, 'Ganesh ', '9876543210', 'g@gmail.com', '123456'),
(2, '', '', '', ''),
(3, 'Akash Sonule', '09689864518', 'a@gmail.com', '123456'),
(4, 'sushant', '7894561230', 's@gmail.com', '456123');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `slider_img` varchar(100) DEFAULT NULL,
  `slider_head` varchar(300) DEFAULT NULL,
  `slider_subhead` varchar(500) DEFAULT NULL,
  `slider_btn_name` varchar(100) DEFAULT NULL,
  `slider_btn_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_img`, `slider_head`, `slider_subhead`, `slider_btn_name`, `slider_btn_url`) VALUES
(1, '1729536542665slider3.jpg', 'Discover Our Vision', 'Welcome to Where Every Space Tells a Story', 'Explore', 'https://www.google.com'),
(2, '1729536552004slider4.jpg', 'View Our Services', 'We Transform Your Vision into Reality\r\n', 'Explore', 'https://www.google.com'),
(8, '1729570642098slider5.jpg', 'Learn About Our Process', 'Our Process Creative Collaborative Custom-Tailored', 'Explore', 'https://www.google.com');

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `id` int(11) NOT NULL,
  `team_name` varchar(100) DEFAULT NULL,
  `team_img` varchar(100) DEFAULT NULL,
  `team_position` varchar(100) DEFAULT NULL,
  `team_facebook` text DEFAULT NULL,
  `team_instagram` text DEFAULT NULL,
  `team_twitter` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_member`
--

INSERT INTO `team_member` (`id`, `team_name`, `team_img`, `team_position`, `team_facebook`, `team_instagram`, `team_twitter`) VALUES
(1, 'Varad', '1731494634192pexels-david-garrison-1128051-2128807.jpg', 'Junior', 'https://www.facebook.com/myride2020/', 'https://www.instagram.com/myride_au/', 'https://x.com/i/flow/login?redirect_after_login=%2Fmyride_ke'),
(2, 'Varad', '1731503725367pexels-buro-millennial-636760-1438081.jpg', 'Senior Developer', 'https://www.facebook.com/myride2020/', 'https://www.instagram.com/myride_au/', 'https://x.com/i/flow/login?redirect_after_login=%2Fmyride_ke');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_client`
--

CREATE TABLE `testimonial_client` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `client_image` text DEFAULT NULL,
  `client_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonial_client`
--

INSERT INTO `testimonial_client` (`client_id`, `client_name`, `client_image`, `client_description`) VALUES
(1, 'Akash Sonule', '1729834741611professional-boy.png', 'Good client reviews are a pivotal marketing asset that can be the reason a client prospect takes the next step with you or chooses a competitor. Both the quantity and quality of your reviews are important if you want to stand out and elevate your business.'),
(2, 'Ganesh Kangude', '1729834756719professional-boy.png', 'Good client reviews are a pivotal marketing asset that can be the reason a client prospect takes the next step with you or chooses a competitor. Both the quantity and quality of your reviews are important if you want to stand out and elevate your business.'),
(3, 'Varad Jagtap', '1729834771645professional-boy.png', 'Good client reviews are a pivotal marketing asset that can be the reason a client prospect takes the next step with you or chooses a competitor. Both the quantity and quality of your reviews are important if you want to stand out and elevate your business.');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_information`
--

CREATE TABLE `testimonial_information` (
  `testimonial_info_id` int(11) NOT NULL,
  `testimonial_heading` varchar(50) DEFAULT NULL,
  `testimonial_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonial_information`
--

INSERT INTO `testimonial_information` (`testimonial_info_id`, `testimonial_heading`, `testimonial_description`) VALUES
(1, 'What is client review', 'this is more important for us client');

-- --------------------------------------------------------

--
-- Table structure for table `work_section_heading`
--

CREATE TABLE `work_section_heading` (
  `work_sec_id` int(11) NOT NULL,
  `sec_heading` text DEFAULT NULL,
  `main_heading` text DEFAULT NULL,
  `sub_heading` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `work_section_heading`
--

INSERT INTO `work_section_heading` (`work_sec_id`, `sec_heading`, `main_heading`, `sub_heading`) VALUES
(1, 'how we work', 'How We Work 5 easy steps', 'Highlight the most relevant aspects of your experience so that the hiring manager can easily see that you have the right skills. If you have a long work history, you may need to remove or minimize positions that dont align with the job');

-- --------------------------------------------------------

--
-- Table structure for table `work_sec_heading`
--

CREATE TABLE `work_sec_heading` (
  `work_sec_id` int(11) NOT NULL,
  `working_step_heading` varchar(100) DEFAULT NULL,
  `working_step_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `work_sec_heading`
--

INSERT INTO `work_sec_heading` (`work_sec_id`, `working_step_heading`, `working_step_description`) VALUES
(2, 'My Name', 'we work for create design'),
(4, 'My Name', 'we work for create design'),
(15, 'My heading', 'The following SQL statement lists the number of customers in each country, sorted high to low:'),
(18, 'make attractive home', 'we work for make attractive design of us home we work for make attractive design of us home we work for make attractive design of us home'),
(19, 'make attractive home ok', 's home'),
(20, 'make attractive home', 'we work for make attractive design of us home we work for make attractive design of us home we work for make attractive design of us home'),
(21, 'make attractive home', 'we work for make attractive design of us home we work for make attractive design of us home we work for make attractive design of us home'),
(22, 'make attractive home', 'we work for make attractive design of us home we work for make attractive design of us home we work for make attractive design of us home'),
(23, 'kkl', '-7p');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`about_us_id`);

--
-- Indexes for table `about_us_info`
--
ALTER TABLE `about_us_info`
  ADD PRIMARY KEY (`about_us_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_profile`
--
ALTER TABLE `admin_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `blog_details`
--
ALTER TABLE `blog_details`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_enq`
--
ALTER TABLE `contact_enq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_review`
--
ALTER TABLE `emp_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instagram_images`
--
ALTER TABLE `instagram_images`
  ADD PRIMARY KEY (`insta_img_id`);

--
-- Indexes for table `mvimage`
--
ALTER TABLE `mvimage`
  ADD PRIMARY KEY (`mvid`);

--
-- Indexes for table `mvinfo`
--
ALTER TABLE `mvinfo`
  ADD PRIMARY KEY (`mvinfo_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `our_project_information`
--
ALTER TABLE `our_project_information`
  ADD PRIMARY KEY (`our_project_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_enq`
--
ALTER TABLE `service_enq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_client`
--
ALTER TABLE `testimonial_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `testimonial_information`
--
ALTER TABLE `testimonial_information`
  ADD PRIMARY KEY (`testimonial_info_id`);

--
-- Indexes for table `work_section_heading`
--
ALTER TABLE `work_section_heading`
  ADD PRIMARY KEY (`work_sec_id`);

--
-- Indexes for table `work_sec_heading`
--
ALTER TABLE `work_sec_heading`
  ADD PRIMARY KEY (`work_sec_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `about_us_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_profile`
--
ALTER TABLE `admin_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_enq`
--
ALTER TABLE `contact_enq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emp_review`
--
ALTER TABLE `emp_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `our_project_information`
--
ALTER TABLE `our_project_information`
  MODIFY `our_project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `service_enq`
--
ALTER TABLE `service_enq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `team_member`
--
ALTER TABLE `team_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonial_client`
--
ALTER TABLE `testimonial_client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimonial_information`
--
ALTER TABLE `testimonial_information`
  MODIFY `testimonial_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `work_section_heading`
--
ALTER TABLE `work_section_heading`
  MODIFY `work_sec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `work_sec_heading`
--
ALTER TABLE `work_sec_heading`
  MODIFY `work_sec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
