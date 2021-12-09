CREATE TABLE category(
  
	Category INT NOT NULL,  
  	Min_Score Int NOT NULL, 
  	Max_Score Int NOT NULL,
  
  	PRIMARY KEY(Category)
);

CREATE TABLE Students(
  
	ID INT NOT NULL,  
  	Name VARCHAR(128),
  	Score Int NOT NULL,
  	PRIMARY KEY(ID)
);

--  insert into category
INSERT INTO category VALUES(1,0,30);
INSERT INTO category VALUES(2,31,45);
INSERT INTO category VALUES(3,46,65);
INSERT INTO category VALUES(4,66,85);
INSERT INTO category VALUES(5,86,100);

-- INSERT into students
INSERT INTO Students VALUES(1,'John',25);
INSERT INTO Students VALUES(2,'Jane',43);
INSERT INTO Students VALUES(3,'Bob',61);
INSERT INTO Students VALUES(4,'Jake',78);
INSERT INTO Students VALUES(5,'Reed',88);





--   creating result table 
CREATE TABLE result_table  As  SELECT category.Category , Students.name  FROM category , Students where (SELECT Students.Score where  Students.Score > category.Min_Score and Students.Score < category.Max_Score) ;


--  adding the Result column with passed failed value

SELECT result_table.name , result_table.Category,
    CASE WHEN result_table.Category > 2 THEN 'Passed'
    ELSE 'Failed' END AS Result
    FROM result_table 
    ORDER BY result_table.Category  DESC;


