
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



CREATE TABLE `recall` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `recall` (`id`, `name`, `number`, `email`, `comment`) VALUES
(5, 'Максим', '123333', 'maxicoldi@gmail.com', 'sasd'),
(6, 'ААААА', '123123', 'maxicoldi@gmail.com', 'фыв'),
(7, 'Максим', '89148304348', 'maxicoldi@gmail.com', 'sadasd'),
(8, 'ААААА', '89148304348', 'maxicoldi@gmail.com', 'ыфвфыв'),
(9, 'ААААА', '89148304348', 'maxicoldi@gmail.com', 'sadasdsad'),
(10, 'Максим', '89148304348', 'maxicoldi@gmail.com', 'asdasd12123');


ALTER TABLE `recall`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `recall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
