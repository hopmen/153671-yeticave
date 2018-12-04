INSERT INTO `categories` (`name`)
	VALUES ('Доски и лыжи'),
	       ('Крепления'),
	       ('Ботинки'),
	       ('Одежда'),
	       ('Инструменты'),
	       ('Разное');


INSERT INTO `users`
  	( `email`, 										`name`, 	`password`,		`avatar_path`, 			`contact_info`)
	VALUES
		(	'info.a@mail.ru',						'Вася',		'123456',			'img/avatar.jpg',		'88005553535'),
		(	'info.b@mail.ru',						'Петя',		'654321',			'img/user.jpg',			'88005553535');



INSERT INTO `lots`
  	(`title`, 																						`end_time`,						`img_path`, 			`price`, 				`bets_step`, 	`author_id`,	`category_id`)
	VALUES
	  ('2014 Rossignol District Snowboard', 								'2018-12-31 23:59:59','img/lot-1.jpg', 	10999, 					100, 					1, 						1),
 		('DC Ply Mens 2016/2017 Snowboard', 									'2018-12-31 23:59:59','img/lot-2.jpg', 	159999, 				100, 					2, 						2),
    ('Крепления Union Contact Pro 2015 года размер L/XL', '2018-12-31 23:59:59','img/lot-3.jpg', 	8000, 					100, 					3, 						3),
    ('Ботинки для сноуборда DC Mutiny Charocal', 					'2018-12-31 23:59:59','img/lot-4.jpg', 	10999, 					100, 					1, 						4),
    ('Куртка для сноуборда DC Mutiny Charocal', 					'2018-12-31 23:59:59','img/lot-5.jpg', 	7500, 					100, 					2, 						5),
    ('Маска Oakley Canopy', 															'2018-12-31 23:59:59','img/lot-6.jpg', 	5400, 					100, 					3, 						6);


INSERT INTO `bets`
  	(`price`, 	`author_id`,	`lot_id`)
	VALUES
		(11299, 		1, 						1),
		(8100, 			2, 						2);

-------------------------------------------------------


-- Получить все категории
SELECT `name` FROM `categories`;


-- Получить самые новые, открытые лоты.
SELECT l.title, l.price, l.img_path, c.name
	FROM lots l
		JOIN categories c ON c.id = l.category_id
			WHERE l.end_time != current_timestamp()
				ORDER BY l.start_time DESC;


-- Показать лот по его id.
SELECT l.`id`,
       l.`title`,
       l.`category_id`,
       l.`description`,
       l.`img_path`,
       l.`price`,
       l.`bets_step`,
       l.`start_time`,
       l.`end_time`,
       l.`author_id`,
       l.`winner_id`,
       c.`name`
	FROM `lots` l
		INNER JOIN `categories` c ON l.`category_id` = c.`id`
			WHERE l.`id` = 1;


-- Обновить название лота по его id.
UPDATE `lots` l
	SET l.`title` = 'UPDATE TITLE'
		WHERE l.`id` = 1;


-- Получить список самых свежих ставок для лота по его id.
SELECT b.`date`, b.`price`, b.`author_id`
	FROM `bets`b
		WHERE b.`lot_id` = 3
			ORDER BY b.`date` DESC;