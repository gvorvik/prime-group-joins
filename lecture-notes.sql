CREATE TABLE "person"(
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50)
);

INSERT INTO "person" ("name")
VALUES ('Kaite'), 
('Brie'), ('Jason'), ('Nathan');

SELECT "id", "name" FROM "person";

CREATE TABLE "hobby" (
	"id" SERIAL PRIMARY KEY,
	"description" VARCHAR(100)
);

INSERT INTO "hobby" ("description")
VALUES ('Space Travel'), ('Kayaking'), ('Twins Games'), ('RacquetBall'), ('Deep Sea Rocket Racing'), ('Biking'), ('Karaoke');

SELECT * FROM "hobby";

SELECT * FROM "person";

UPDATE "public"."hobby" SET "person_id"=3 WHERE "id"=4 RETURNING "id", "description", "person_id";

UPDATE "hobby" SET "person_id" = 3 WHERE "id" = 5;

-- All data where both tables are referenced
SELECT * FROM "hobby"
JOIN "person" ON "hobby"."person_id" = "person"."id"
ORDER BY "hobby"."id";

-- All data whether it's referenced or not
SELECT * FROM "hobby"
FULL OUTER JOIN "person" ON "hobby"."person_id" = "person"."id"
ORDER BY "hobby"."id";

--All hobbies and only people who are referenced
SELECT * FROM "hobby"
LEFT JOIN "person" ON "hobby"."person_id" = "person"."id"
ORDER BY "hobby"."id";


--All people and only hobbies referenced
SELECT * FROM "hobby"
RIGHT JOIN "person" ON "hobby"."person_id" = "person"."id"
ORDER BY "hobby"."id";

--Creating a junction table (basically a table connecting two other tables)
CREATE TABLE "person_hobby" (
	"id" SERIAL PRIMARY KEY,
	"person_id" INT REFERENCES "person",
	"hobby_id" INT REFERENCES "hobby",
	"skill" INT
);

INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill")
VALUES(4,3,2), (5,5,4), (3,1,5);

INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill")
VALUES(2,3,4);


-- Add to the table using joins
SELECT "person"."name", "person"."id", "person_hobby"."person_id", "person_hobby"."hobby_id", "hobby"."id", "hobby"."description", "person_hobby"."skill"
FROM "person"
JOIN "person_hobby" ON "person"."id"="person_hobby"."person_id"
JOIN "hobby" ON "person_hobby"."hobby_id"="hobby"."id";



INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill")
VALUES(1,5,2), (2,5,4), (3,5,5);

SELECT "person"."name", "person"."id", "person_hobby"."person_id", "person_hobby"."skill", "person_hobby"."hobby_id", "hobby"."id", "hobby"."description"
FROM "person"
JOIN "person_hobby" ON "person"."id"="person_hobby"."person_id"
JOIN "hobby" ON "person_hobby"."hobby_id"="hobby"."id";


--aggregates
SELECT COUNT(*) FROM "hobby";

SELECT MIN("skill") FROM "person_hobby";

SELECT MAX("skill") FROM "person_hobby";


SELECT AVG("skill") FROM "person_hobby";

SELECT SUM("skill") FROM "person_hobby";

SELECT MIN("skill"), MAX("skill"), AVG("skill"), SUM("skill") FROM "person_hobby";



SELECT "hobby"."description", "person_hobby"."hobby_id", COUNT("hobby_id") FROM "person_hobby"
JOIN "hobby" ON "hobby"."id" = "person_hobby"."hobby_id" 
GROUP BY "hobby"."description", "person_hobby"."hobby_id";

