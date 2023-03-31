-- attempt #1

with uncat_calls as (
select call_category from callers
where call_category is null or call_category = 'n/a'
)

-- attempt #2 (had to learn about filter())

select round(100.0 * count(case_id) filter(
	where call_category is null or call_category = 'n/a')
	/ count(case_id), 1) as uncat_calls_pt
	from callers;
	