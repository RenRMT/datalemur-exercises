-- attempt #1

select candidate_id from candidates
where skill in ('Python', 'PostgreSQL', 'Tableau')
group by candidate_id
having count(skill) = 3;

-- attempt #2 (forgot to sort)
select candidate_id from candidates
where skill in ('Python', 'PostgreSQL', 'Tableau')
group by candidate_id having count(skill) = 3
order by candidate_id asc;
