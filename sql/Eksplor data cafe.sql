use cafe_sales;
select*from clean_cafe_sales;


-- mengubah nama tabel agar mempermudah proses penulisan kode
alter table clean_cafe_sales
rename cafe;

select*from cafe;

-- mengubah nama kolom
alter table cafe
rename column `Transaction ID` to trans_id;

-- menghitung total baris
select count(trans_id) from cafe; -- total ada 8564 baris

-- Total Revenue dari masing-masing produk
select Item, sum(`Total Spent`) as total
from cafe
group by Item;

-- Jumlah masing-masing produk terjual
select Item, sum(Quantity)
from cafe
group by Item;

-- Perbandingan jumlah payment methode
select `Payment Method`, count(`Payment Method`)
from cafe
group by `Payment Method`;

-- perbandingan revenue minimal dan maksimal
select min(`Total Spent`) as minimal, max(`Total Spent`)
from cafe;

select avg(`Total Spent`)
from cafe;

-- Transaksi dengan total spent lebih dari rata2 keseluruhan
Select trans_id, Item, `Total Spent`, (select avg (`Total Spent`) from cafe) as avg
from cafe
having `Total Spent`> 
(select  avg(`Total Spent`) from cafe);

select * from cafe;

select  count(`Total Spent`)
from cafe
where `Total Spent` > 10;

select trans_id, Quantity from cafe
where Quantity = 5
union all
select trans_id, `Total Spent` from cafe
where `Total Spent` = 10;

-- grup item yang memiliki total spent lebih dari rata2 antar grup item
with paycash
as (select Item, sum(`Total Spent`) as total from cafe 
group by Item)

select*, (select avg(total) from paycash) avg
from paycash
where total > (select avg(total) from paycash);

-- mengecek apakah terdapat duplikat atau tidak menggunakan CTE
with duplicat
as (
select *, 
row_number () over(partition by trans_id, Item, Quantity, 
`Price Per Unit`, `Total Spent`, `Payment Method`, Location, `Transaction Date`) row_num
from cafe)

Select*from duplicat
where row_num > 1; -- hasilnya, tidak ada duplikat 

-- total pemasukan per hari
select `Transaction Date`, sum(`Total Spent`)
from cafe
group by `Transaction Date`;


-- mmengubah format teks ke tanggal
describe cafe;
alter table cafe
modify  `Transaction Date` varchar(28);
select `Transaction Date`, str_to_date(`Transaction Date`, '%m/%d/%Y')
from cafe;

delete
from cafe
where `Transaction Date` = 'Missing'; -- menghapus baris di kolom Transaction date yang bukan berupa tanggal

select * from cafe
where `Transaction Date` = 'Missing';

update cafe
set `Transaction Date`= str_to_date(`Transaction Date`, '%m/%d/%Y'); -- memperbarui format tanggal dari sting menjadi date

alter table cafe
modify `Transaction Date`  date;
describe cafe;

-- total pemasukan tiap bulan
select month(`Transaction Date`), sum(`Total Spent`) as pemasukan
from cafe
group by month(`Transaction Date`)
order by 1 asc;

select * from cafe;
