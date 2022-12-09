use publications;

-- Challenge 1
select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name from authors
inner join titleauthor on authors.au_id= titleauthor.au_id
inner join titles on titleauthor.title_id= titles.title_id
inner join publishers on titles.pub_id= publishers.pub_id;


Create table challenge2 as
select authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title) as title_count from authors
inner join titleauthor on authors.au_id= titleauthor.au_id
inner join titles on titleauthor.title_id= titles.title_id
inner join publishers on titles.pub_id= publishers.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;

select sum(title_count) from challenge2
select count(title_id) from titleauthor

-- Challenge 3
select authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as total from authors
inner join titleauthor on authors.au_id= titleauthor.au_id
inner join titles on titleauthor.title_id= titles.title_id
inner join sales on titles.title_id= sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by total DESC
limit 3;


Create table challenge4 as
select authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as total from authors
left join titleauthor on authors.au_id= titleauthor.au_id
left join titles on titleauthor.title_id= titles.title_id
left join sales on titles.title_id= sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by total DESC;

select count(distinct(au_id)) from challenge4;
