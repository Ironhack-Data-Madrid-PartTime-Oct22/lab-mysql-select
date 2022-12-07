USE publications;

select * from authors;
select * from titleauthor;
select * from titles;
select * from publishers;


select au_id , au_lname, au_fname, title, pub_name
from titles
natural join titleauthor
natural join authors
natural join publishers;






