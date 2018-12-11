USE `153671-yeticave`;

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
    ('Крепления Union Contact Pro 2015 года размер L/XL', '2018-12-31 23:59:59','img/lot-3.jpg', 	8000, 					100, 					1, 						3),
    ('Ботинки для сноуборда DC Mutiny Charocal', 					'2018-12-31 23:59:59','img/lot-4.jpg', 	10999, 					100, 					1, 						4),
    ('Куртка для сноуборда DC Mutiny Charocal', 					'2018-12-31 23:59:59','img/lot-5.jpg', 	7500, 					100, 					2, 						5),
    ('Маска Oakley Canopy', 															'2018-12-31 23:59:59','img/lot-6.jpg', 	5400, 					100, 					2, 						6);


INSERT INTO `bets`
  	(`price`, 	`author_id`,	`lot_id`)
	VALUES
		(11299, 		2, 						1),
		(170000,		1, 						2),
    (12299, 		2, 						1),
    (180000, 		1, 						2);

-------------------------------------------------------


-- Получить все категории
SELECT * FROM `categories`;


-- Получить самые новые, открытые лоты.
SELECT l.title, l.price start_price, l.img_path, c.name, MAX(b.price) price
	FROM lots l
		LEFT JOIN categories c ON c.id = l.category_id
    	LEFT JOIN bets b ON b.lot_id = l.id
				WHERE l.end_time >= now() AND l.author_id IS NOT NULL
					GROUP BY l.id
						ORDER BY l.start_time DESC;


-- Показать лот по его id.
SELECT l.*,
       c.`name`
	FROM `lots` l
		INNER JOIN `categories` c ON l.`category_id` = c.`id`
			WHERE l.`id` = 1;


-- Обновить название лота по его id.
UPDATE `lots` l
	SET l.`title` = 'UPDATE TITLE'
		WHERE l.`id` = 1;


-- Получить список самых свежих ставок для лота по его id.
SELECT b.*
	FROM `bets`b
		WHERE b.`lot_id` = 2
			ORDER BY b.`date` DESC;