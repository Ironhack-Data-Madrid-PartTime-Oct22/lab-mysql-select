USE publications;

select * from authors;
select * from titleauthor;
select * from titles;
select * from publishers;

##CHALLANGE 1## 
select au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", title AS "TITLE", pub_name AS "PUBLISHER"
from authors
natural join titleauthor 
natural join titles
inner join publishers on titles.pub_id = publishers.pub_id;










