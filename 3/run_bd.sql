-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 22 2018 г., 13:10
-- Версия сервера: 10.1.21-MariaDB
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `new_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authornbooks`
--

CREATE TABLE `authornbooks` (
  `id` int(11) NOT NULL,
  `authors_id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `authornbooks`
--

INSERT INTO `authornbooks` (`id`, `authors_id`, `books_id`) VALUES
(1, 4, 1),
(3, 5, 2),
(4, 6, 4),
(5, 5, 3),
(6, 5, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(4, 'SASA'),
(5, 'DDDD'),
(6, 'RRRRR');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `ISBN` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `pages` int(100) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `ISBN`, `name`, `pages`, `date`) VALUES
(1, '1', 'Book1', 20, '2018-08-15'),
(2, '2', 'Book2', 30, '2018-08-18'),
(3, '3', 'Book3', 40, '2018-08-01'),
(4, '5', 'Book4', 60, '2018-08-02');

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Fantasy'),
(2, 'Thrill');

-- --------------------------------------------------------

--
-- Структура таблицы `genresnbooks`
--

CREATE TABLE `genresnbooks` (
  `id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `genresnbooks`
--

INSERT INTO `genresnbooks` (`id`, `books_id`, `genres_id`) VALUES
(2, 1, 1),
(3, 1, 2),
(4, 2, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authornbooks`
--
ALTER TABLE `authornbooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_authorNbooks_authors1_idx` (`authors_id`),
  ADD KEY `fk_authorNbooks_books1_idx` (`books_id`);

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `genresnbooks`
--
ALTER TABLE `genresnbooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_genresnbooks_books_idx` (`books_id`),
  ADD KEY `fk_genresnbooks_genres1_idx` (`genres_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authornbooks`
--
ALTER TABLE `authornbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `genresnbooks`
--
ALTER TABLE `genresnbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `authornbooks`
--
ALTER TABLE `authornbooks`
  ADD CONSTRAINT `fk_authorNbooks_authors1` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_authorNbooks_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `genresnbooks`
--
ALTER TABLE `genresnbooks`
  ADD CONSTRAINT `fk_genresnbooks_books` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_genresnbooks_genres1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
