1.
SELECT number_of_copies
FROM tbl_books a
join  tbl_book_copies b on a.book_id=b.book_id
join tbl_branch c on b.branch_id=c.branch_id
where book_title ='the lost tribe' and branch_name= 'sharpstown' 

2. 
 select book_title, branch_name, number_of_copies
 from tbl_books a
 JOIN tbl_book_copies b (NOLOCK) ON a.book_id = b.book_id
 JOIN tbl_branch c (NOLOCK) ON b.branch_id = c.branch_id
 WHERE branch_name = 'central' AND book_title = 'the lost tribe'


3.

select a.borrower_name, a.card_number
from tbl_borrower a
left join tbl_book_loans b (NOLOCK) ON a.card_number = b.card_number
WHERE b.card_number IS NULL
4.

select a.branch_name, b.date_in, c.book_title, d.borrower_name, d.branch_address 
from tbl_branch a
 join tbl_book_loans b on b.branch_id= a.branch_id
 join tbl_books c on c.book_id= b.book_id
 join tbl_borrower d on d.card_number= b.card_number
 where branch_name= 'sharpstown' and date_in = '10-12-18'

 
5.
 select branch_name, COUNT(*) as Books_Loaned
 from tbl_branch a
 join tbl_book_loans b (NOLOCK) on a.branch_id = b.branch_id
 where branch_name = 'sharpstown'
group by branch_name
6.

select borrower_name, c.card_number, c.branch_address 
from tbl_books a
join tbl_book_loans b on a.book_id=b.book_id  
join tbl_borrower c on  c.card_number= b.card_number
group by borrower_name, c.card_number, c.branch_address
having count (b.card_number) >5
order by c.card_number asc

7.
select * from tbl_book_authors a
join tbl_book_copies b (NOLOCK) ON a.book_id = b.book_id
where branch_id = 2 and author_name= 'king1'



 