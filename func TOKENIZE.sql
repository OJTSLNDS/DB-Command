
Create function dbo.fn_tokenize_string
(@BigStr varchar(max),		-- STRINGA IN INPUT
 @seperator char(1),		-- SEP
 @ind int					-- INDEX
) returns varchar(max)
as
begin

declare @xpos int			-- POSIZIONE DEL SEP ALL'INTERNO DELLA STRINGA - ad ogni iterazione
declare @i int				-- ITERATORE
declare @res varchar(max)   -- RESULT

--CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] )  
--expressionToFind -> Finding is the completion of searching.

set @i=1
set @xpos = CharIndex (@seperator,@BigStr) -- al primo giro mi aspetto restituisca posizione 9

while @i < @ind
 begin  
  set @i = @i + 1
  set @BigStr = substring (@BigStr, @xpos + 1,len(@BigStr) - @xpos ) -- nel primo giro, in termini di valori, sarebbe : 
  --						  200,		10,		190					
  set @xpos = CharIndex (@seperator,@BigStr)
 end

if @xpos = 0			-- quando il valore SEP non e' piu' presente nella porzione della stringa -> /* select CharIndex(';', 'sgdhf')  */
  set @res =  @BigStr	-- 'sgdhf' or ''
else 
 begin 
  set @BigStr = substring (@BigStr,1,@xpos - 1) + ';' +				 -- ad una prima iterazione : da 200 char , parti da char 1, arriva a char 8  [char 9 - 1] -> 20230303 | CONCATENA '.' | 
                substring (@BigStr, @xpos + 1,len(@BigStr) - @xpos ) -- | CONCATENA |  da 200 char ,  parti da char 10 [secondo valore] , 192 [200 char - 8 char], leggendo gli ultimi 191 char [200-9]
  set @res = substring(@BigStr, 1, @xpos - 1)

 end
return @res
end 

go


--A call to the function:

declare @strTabulato varchar(max) = '20230303;0370003840016;009104845;00501837555  ;C;V;Y;  0,000000;      0,000000;  0,000000;  0,000000;      0,000000;MBTA;MBYYGA;CON;MH;MTE;20210605;C;Y;            327530,78;            37770,78;            327990,78;'

--select CharIndex(';', @strTabulato) --il contatore parte da 1, non da 0
--select len(@strTabulato)

select dbo.fn_tokenize_string ( @strTabulato , ';', 1) as token1,
       dbo.fn_tokenize_string ( @strTabulato , ';', 2) as token2,
       dbo.fn_tokenize_string ( @strTabulato , ';', 3) as token3,
       dbo.fn_tokenize_string ( @strTabulato , ';', 4) as token4,
       dbo.fn_tokenize_string ( @strTabulato , ';', 5) as token5,
       dbo.fn_tokenize_string ( @strTabulato , ';', 6) as token6,
	   dbo.fn_tokenize_string ( @strTabulato , ';', 7) as token7,
       dbo.fn_tokenize_string ( @strTabulato , ';', 8) as token8,
       dbo.fn_tokenize_string ( @strTabulato , ';', 9) as token9,
       dbo.fn_tokenize_string ( @strTabulato , ';', 10) as token10,
       dbo.fn_tokenize_string ( @strTabulato , ';', 11) as token11,
       dbo.fn_tokenize_string ( @strTabulato , ';', 12) as token12,
	   dbo.fn_tokenize_string ( @strTabulato , ';', 13) as token13,
       dbo.fn_tokenize_string ( @strTabulato , ';', 14) as token14,
       dbo.fn_tokenize_string ( @strTabulato , ';', 15) as token15,
       dbo.fn_tokenize_string ( @strTabulato , ';', 16) as token16,
       dbo.fn_tokenize_string ( @strTabulato , ';', 17) as token17,
       dbo.fn_tokenize_string ( @strTabulato , ';', 18) as token18,
	   dbo.fn_tokenize_string ( @strTabulato , ';', 19) as token19,
       dbo.fn_tokenize_string ( @strTabulato , ';', 20) as token20,
       dbo.fn_tokenize_string ( @strTabulato , ';', 21) as token21,
       dbo.fn_tokenize_string ( @strTabulato , ';', 22) as token22,
       dbo.fn_tokenize_string ( @strTabulato , ';', 23) as token23

