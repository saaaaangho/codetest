with intact as (
  select ANIMAL_ID, ANIMAL_TYPE, NAME
  from ANIMAL_INS
  where SEX_UPON_INTAKE like '%Intact%'
)

select i.ANIMAL_ID, i.ANIMAL_TYPE, i.NAME from intact i
join ANIMAL_OUTS ao on ao.ANIMAL_ID = i.ANIMAL_ID
where ao.SEX_UPON_OUTCOME like '%Spayed%'
   or ao.SEX_UPON_OUTCOME like '%Neutered%'
order by ANIMAL_ID