library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity D_FF is
	port (
		d,clk,en,reset : in std_logic;
		q : out std_logic
	);
end D_FF;

architecture behavioral of D_FF is

signal q_reg,q_next : std_logic;

begin
--state register 
process(reset,clk)
begin
	if (reset = '1') then
		q_reg <= '0';
	elsif (clk' event and clk = '1') then
		q_reg <= q_next;
	end if;
end process;
--next state logic
q_next <= d when en = '1' else
q_reg;
--output
q <= q_reg; 
end behavioral;