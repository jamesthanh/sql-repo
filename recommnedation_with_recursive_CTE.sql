CREATE TABLE users (
	id SERIAL PRIMARY KEY,
  username VARCHAR(40)
);

CREATE TABLE followers (
	id SERIAL PRIMARY KEY,
	leader_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	follower_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	UNIQUE(leader_id, follower_id)
);

INSERT INTO users (username)
VALUES 
	('James'),
  ('Alice'),
  ('Henry'),
  ('Bob'),
  ('Jack'),
  ('John');

-- SELECT *
-- FROM users

INSERT INTO followers (leader_id, follower_id)
VALUES 
	(5, 1),
  (6, 5),
  (4, 1),
  (2, 5),
  (3, 4);


-- depth does not exist in any tables, but we need it to record the depth,
-- in which we are currently at
WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS (
		SELECT leader_id, follower_id, 1 AS depth
		FROM followers
		-- Getting the result for this specific user with id 1, in this case is James
		WHERE follower_id = 1
	UNION
		SELECT followers.leader_id, followers.follower_id, depth + 1
		FROM followers
		JOIN suggestions ON suggestions.leader_id = followers.follower_id
		Where depth < 3
)
SELECT DISTINCT users.id, users.username AS recommneded_usernames
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1
LIMIT 3;
  
  

