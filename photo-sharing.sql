CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
 );

INSERT INTO users (username)
VALUES 
	('managa93'),
  ('owo12'),
  ('sis3032'),
  ('99axcs');

SELECT *
FROM users;


CREATE TABLE photos (
  photo_id SERIAL PRIMARY KEY,
  url VARCHAR(50),
  user_id INTEGER REFERENCES users (id)
);

INSERT INTO photos (url, user_id)
VALUES ('http://one.jpg', 4);


INSERT INTO photos (url, user_id)
VALUES
	('http://two.jpg', 1),
  ('http://72.jpg', 1),
  ('http://88.jpg', 1),
  ('http://23.jpg', 2),
  ('http://76.jpg', 2),
  ('http://42.jpg', 3),
  ('http://53.jpg', 4);

SELECT * FROM photos;

SELECT * FROM photos
WHERE user_id = 4;


SELECT url, username 
FROM photos
JOIN users on users.id = photos.user_id


  -- Query
  
  -- Requirement: For each comment, show the contents 
  -- of the comment and the username who wrote that comment 
  
--   SELECT contents, username
--   FROM comments   
--   JOIN users ON users.id = comments.user_id;

-- Requriement
-- For each comment, list the contents of the comment
-- and URL of the photo of that comment
-- SELECT contents, url
-- FROM comments
-- JOIN photos ON photos.id = comments.photo_id;


-- Requirements: show all photos eventho they do not
-- hav have a username

-- SELECT url, username
-- FROM 	photos
-- LEFT JOIN users ON users.id = photos.user_id

-- INSERT INTO users (username)
-- VALUES ('Nicole');
-- Get all users even they dont have photo
-- SELECT url, username
-- FROM photos
-- RIGHT JOIN users on users.id = photos.user_id

-- get all results
-- SELECT url, username
-- FROM photos
-- FULL JOIN users on users.id = photos.user_id

-- SELECT url, contents, username
-- FROM comments
-- JOIN photos ON photos.id = comments.photo_id
-- JOIN users on users.id = comments.user_id 
-- 		AND users.id = photos.user_id;

-- find th number of comments for each photo
-- where the photo_id is less than 3 and the photo has 
-- has more than 2 comments

-- SELECT photo_id, COUNT(*) AS num_comment_per_photo
-- FROM comments
-- WHERE photo_id < 3
-- GROUP BY photo_id 
-- HAVING COUNT(*) > 2;

-- find the users (user_ids) where the users 
-- has commented on the first 50 photos 
-- and they added more than 20 comments on those photos 

-- SELECT user_id, COUNT(*)
-- FROM comments
-- WHERE photo_id < 50
-- GROUP BY user_id
-- HAVING COUNT(*) > 20
  















