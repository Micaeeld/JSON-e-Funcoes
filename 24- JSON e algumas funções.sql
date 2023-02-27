select doc from countryinfo where _id = 'USA';

select JSON_KEYS(doc) from countryinfo where _id = 'USA';
select JSON_KEYS(doc, '$.geography') from countryinfo where _id = 'USA'; #$.(propriedade) mostra os coiso

select JSON_EXTRACT(doc, '$.government') from countryinfo where _id = 'USA';
select JSON_EXTRACT(doc, '$.IndepYear') from countryinfo where _id = 'USA';
select JSON_EXTRACT(doc, '$.government.HeadOfState') from countryinfo where _id = 'USA';

SELECT JSON_EXTRACT(doc, "$.Code") as Code, REPLACE(JSON_EXTRACT(doc, "$.Code"), '"', '') as Code2
from countryinfo; #REPLACE

select JSON_EXTRACT(doc, '$.geography.Continent') as Continent,
SUM(JSON_EXTRACT(doc, '$.demographics.Population')) as Populatio,
AVG(JSON_EXTRACT(doc, '$.demographics.LifeExpectancy')) as Expectativa from countryinfo
where JSON_EXTRACT(doc, '$.government.GovernmentForm') like ('%Monarchy%')
and JSON_EXTRACT(doc, '$.demographics.Population') > 10000000
group by JSON_EXTRACT(doc, '$.geography.Continent')
ORDER BY 2;


insert into X values ('{"nome": "Jonas"}');

select JSON_EXTRACT(y, '$.nome'), JSON_CONTAINS_PATH(Y, "ONE", "$.telefone") from X;

insert into X values ('{"nome": "Alberto", "endereco":"Rua X numero Y"}');

select JSON_EXTRACT(y, '$.nome'), 
JSON_CONTAINS_PATH(Y, "ONE", "$.telefone", "$.endereco") from X;

insert into X values 
('{"nome": "Maria", "endereco":"Rua Y numero X", "telefone": "4324-4234"}');

SELECT JSON_CONTAINS (Y, '"3293-3232"', "$.telefone") from X;

SELECT JSON_SEARCH(Y, "ALL", "4324-4234") from X;

insert into X values 
('{"nome": "Katia", "endereco":"Rua Y numero X", "telefone": "4324-4234", "telefone2": "4324-4234"}');

