create database db_library-- pause
go

create table tbl_branch (
branch_id int primary key not null identity (1, 1),
branch_name varchar(50) not null,
branch_address varchar(50) not null
)

create table tbl_publisher (
	publisher_name varchar(50)  primary key,
	publisher_phone varchar(50) not null,
	publisher_address varchar(50) not null,
)
create table tbl_books (
	book_id int primary key not null identity (100, 1),
	book_title varchar(50) not null,
	publisher_name varchar(50) not null,
	-- primary key(publisher_name),
	constraint fkpublisher_name_publisher_name foreign key (publisher_name) references tbl_publisher(publisher_name)
)

create table tbl_borrower(
	card_number varchar(50) primary key not null,
	borrower_name varchar(50) not null,
	branch_address varchar(50) not null,
	branch_phone varchar(50) not null
)
create table tbl_book_authors (
	book_id int not null,
	author_name varchar(50) not null,
	-- primary key(book_id),
	constraint fk_book_id_book_id foreign key (book_id) references tbl_books(book_id)
)

create table tbl_book_copies (
	book_id int not null,
	branch_id int not null,
	number_of_copies varchar(50) not null,
	constraint fk_book_id_book_id2 foreign key (book_id)references tbl_books(book_id),
	constraint fk_branch_id_branch_id foreign key (branch_id)references tbl_branch(branch_id)
)

create table tbl_book_loans(
	book_id int not null, 
	branch_id int not null,
	card_number varchar(50) not null,
	date_out varchar(50) not null,
	date_in varchar(50) not null,
	constraint fkbook_id_book_id3 foreign key (book_id)references tbl_books(book_id),
	constraint fkbranch_id_branch_id foreign key (branch_id)references tbl_branch(branch_id),
	constraint fkcard_number_card_number foreign key (card_number)references tbl_borrower(card_number)
)