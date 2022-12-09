USE publications;
select * from authors;

select * from titles;

select * from publishers;

select * from titleauthor;

-- Challenge 1 - Who Have Published What At Where?

select authors.au_id as "Author ID", authors.au_lname as "Last Name", authors.au_fname as "First Name", titles.title as "Title", publishers.pub_name as "Publisher"
from authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join titles on titleauthor.title_id= titles.title_id
inner join publishers on titles.pub_id= publishers.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?

select authors.au_id as "Author ID", authors.au_lname as "Last Name", authors.au_fname as "First Name", publishers.pub_name as "Publisher", count(titles.title) as "Title Count"
from authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join titles on titleauthor.title_id= titles.title_id
inner join publishers on titles.pub_id= publishers.pub_id
group by "Author ID", "Last Name", "First Name", "Publisher"
order by "Title Count" desc;

--Challenge 3 - Best Selling Authors

select authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as "Total"
from authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join sales on sales.title_id= sales.title_id
group by authors.au_id
order by "Total" desc
limit 3;

-- Challenge 4 - Best Selling Authors Ranking

select authors.au_id, authors.au_lname, authors.au_fname, case when SUM(qty) is not null then SUM(qty) ELSE 0 end as "Total"
from authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join sales on sales.title_id= sales.title_id
group by authors.au_id
order by "Total" desc
limit 23;

