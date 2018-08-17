
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `new_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `new_db`;


CREATE TABLE `authornbooks` (
  `id` int(11) NOT NULL,
  `authors_id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `authornbooks` (`id`, `authors_id`, `books_id`) VALUES
(1, 4, 1),
(2, 4, 1),
(3, 5, 2),
(4, 6, 4),
(5, 5, 3),
(6, 5, 4);


CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `authors` (`id`, `name`) VALUES
(4, 'SASA'),
(5, 'DDDD'),
(6, 'RRRRR');


CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `ISBN` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `pages` int(100) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `books` (`id`, `ISBN`, `name`, `pages`, `date`) VALUES
(1, '1', 'Book1', 20, '2018-08-15'),
(2, '2', 'Book2', 30, '2018-08-18'),
(3, '3', 'Book3', 40, '2018-08-01'),
(4, '5', 'Book4', 60, '2018-08-02');


CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `genres` (`id`, `Name`) VALUES
(1, 'Fantasy'),
(2, 'Thrill');


CREATE TABLE `genresnbooks` (
  `id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `genresnbooks` (`id`, `books_id`, `genres_id`) VALUES
(2, 1, 1),
(3, 1, 2),
(4, 2, 1);


ALTER TABLE `authornbooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_authorNbooks_authors1_idx` (`authors_id`),
  ADD KEY `fk_authorNbooks_books1_idx` (`books_id`);


ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `genresnbooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_genresnbooks_books_idx` (`books_id`),
  ADD KEY `fk_genresnbooks_genres1_idx` (`genres_id`);


ALTER TABLE `authornbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `genresnbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `authornbooks`
  ADD CONSTRAINT `fk_authorNbooks_authors1` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_authorNbooks_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `genresnbooks`
  ADD CONSTRAINT `fk_genresnbooks_books` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_genresnbooks_genres1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

