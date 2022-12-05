select authors.au_id as AUTHOR_ID,
au_lname  as LAST_NAME,
au_fname as FIRST_NAME,
pub_name as PUBLISHER,
title as TITLE 
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id;

select authors.au_id as AUTHOR_ID,
au_lname  as LAST_NAME,
au_fname as FIRST_NAME,
pub_name as PUBLISHER,
count(titles.title_id) as TITLE_COUNT
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id,publishers.pub_id;

select authors.au_id as AUTHOR_ID,
au_lname as LAST_NAME,
au_fname as FIRST_NAME,
sum(qty) as TOTAL
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by TOTAL desc
limit 3;

select authors.au_id as AUTHOR_ID,
au_lname as LAST_NAME,
au_fname as FIRST_NAME,
(case 
	when qty is null then 0
	else sum(qty) 
end) as TOTAL
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by TOTAL desc;