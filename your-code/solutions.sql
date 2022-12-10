--- CHALLENGE 1 --- 

select authors.au_id ,au_lname,au_fname,title,pub_name from publishers
natural join titles
inner join titleauthor
on titles.title_id = titleauthor.title_id
inner join author
on titleauthor.au_id = authors.au_id;

--- Challenge 2 ---

select *from publishers
natural join titles
inner join titleauthor
on titles.title_id = titleauthor.title_id
inner join authors
on titleauthor.au_id = authors.au_id
group by titleauthor.au_id, pub_id;

--- Challenge 3 ---
select * , sum(sales.qty) as total
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join sales
on titles.title_id = sales.title_id
group by titleauthor.au_id, sales.qty
order by sum(sales.qty) desc limit 3;

--- Challenge 4 --

select * from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by titleauthor.au_id, sales.qty
order by sum(sales.qty) desc;