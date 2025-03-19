alter procedure ventasporcliente
	@clienteID int
as
begin
	select c.ClienteID , c.Nombre , COUNT(p.ClienteID) as ventas
	from CLIENTES as c
	inner join PEDIDOS as p
	on p.ClienteID = c.ClienteID
	group by c.clienteID, c.nombre
	having c.ClienteID = @clienteID
end;

select *
from PEDIDOS