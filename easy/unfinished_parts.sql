-- attempt #1

select part, max(assembly_step), finish_date from parts_assembly
group by part, finish_date 
having finish_date is null;

-- attempt #2 (output only 'part' column)
select part from (
	select part, max(assembly_step), finish_date from parts_assembly
	group by part, finish_date 
	having finish_date is null
) as parts_unfinished;
