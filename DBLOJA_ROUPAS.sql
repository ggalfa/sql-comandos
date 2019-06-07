/*

Craindo uma loja de roupas, inserindo dados no banco
Criando uma tabela para registar as vendas de roupas
Usamos a funcao SUM para somar a quantidade de produtos no estoque
INNER JOIN junta os produtos vendidos da tabela roupas com o nome
do cliente e quantidade vendida da tabela vendas.

*/

CREATE TABLE roupas(id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, price REAL, len TEXT);

CREATE TABLE vendas (id INTEGER PRIMARY KEY, quant_venda INTEGER, nome_cliente TEXT, nome_ven TEXT, roupas_id INTEGER);

INSERT INTO roupas VALUES (1, "Camisa", 20, 20, "M");
INSERT INTO roupas VALUES (2, "Camisa", 2, 22, "G");
INSERT INTO roupas VALUES (3, "Camisa", 1, 15, "P");
INSERT INTO roupas VALUES (4, "Camisa", 10, 20, "M");
INSERT INTO roupas VALUES (5, "Camisa", 2, 20, "M");

INSERT INTO vendas (id, quant_venda, nome_cliente, nome_ven, roupas_id) VALUES (1, 5, "Gleison", "Alice", 1);
INSERT INTO vendas (id, quant_venda, nome_cliente, nome_ven, roupas_id) VALUES (2, 5, "Amanda", "Alice", 4);
INSERT INTO vendas (id, quant_venda, nome_cliente, nome_ven, roupas_id) VALUES (3, 7, "Chico", "Fernanda", 2);

SELECT * FROM roupas ORDER BY price;
SELECT SUM(quantity) FROM roupas ORDER BY quantity;

SELECT roupas.name, vendas.nome_cliente, vendas.quant_venda AS comprou
FROM roupas
JOIN vendas
ON vendas.roupas_id = roupas.id;

SElECT SUM(quant_venda) FROM vendas ORDER BY quant_venda;
