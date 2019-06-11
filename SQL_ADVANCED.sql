/*

Utilizando a função SUM dentro de um select:
A função SUM obtém a soma dos valores da expressão.  
SUM é utilizado no modelo Funcao(expressao):
exe: SUM(salario) = valor da expressao.

*/

SELECT type, SUM(calories) AS total_calories FROM exercise_logs GROUP BY type;

/* 

Com as funçoes SQL podemos ainda criar um alias para a funcao + expressao
utilizando a palavra reservada AS, assim como no exemplo abaixo.
Podemos utilizar o HAVING em conjuntos com funçoes agregadas o que não
seria possivel com WHERE.
HAVING é excelente usado após GROUP BY para realizar filtros ex:

*/

SELECT type, SUM(calories) AS total_calories FROM exercise_logs
    GROUP BY type
    HAVING total_calories > 150
    ;

/* 

A função AVG () retorna o valor médio de uma coluna numérica.
no exemplo abaixo  utilizamos AVG  e fazemos um filtro com o 
HAVING para o preço médio > 70.
*/

SELECT type, AVG(calories) AS avg_calories FROM exercise_logs
    GROUP BY type
    HAVING avg_calories > 70
    ; 

/* 

Podemos utilizar o HAVING em conjuntos com funçoes agregadas o que não
seria possivel com WHERE veja abaixo utilizamos o HAVING com funçoes
agregada COUNT e um comando de decisão veja abaixo.

*/
    
SELECT type FROM exercise_logs GROUP BY type HAVING COUNT(*) >= 2;

/*

Fazendo consultas mais avançadas com ROUND e utilizando expressões.

*/

/* 50-90% of max*/
SELECT COUNT(*) FROM exercise_logs WHERE
    heart_rate >= ROUND(0.50 * (220-30)) 
    AND  heart_rate <= ROUND(0.90 * (220-30));
 
/*



*/

/* CASE */
SELECT type, heart_rate,
    CASE 
        WHEN heart_rate > 220-30 THEN "above max"
        WHEN heart_rate > ROUND(0.90 * (220-30)) THEN "above target"
        WHEN heart_rate > ROUND(0.50 * (220-30)) THEN "within target"
        ELSE "below target"
    END as "hr_zone"
FROM exercise_logs;

/*



*/

SELECT COUNT(*),
    CASE 
        WHEN heart_rate > 220-30 THEN "above max"
        WHEN heart_rate > ROUND(0.90 * (220-30)) THEN "above target"
        WHEN heart_rate > ROUND(0.50 * (220-30)) THEN "within target"
        ELSE "below target"
    END as "hr_zone"
FROM exercise_logs
GROUP BY hr_zone;