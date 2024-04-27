library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PM_mC is
	port(
		clk,reset : in std_logic;
		m : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(3 downto 0)
	);
end PM_mC;

architecture behavioral of PM_mC is 
	signal r_reg,r_next,r_inc : unsigned(3 downto 0);
begin
	--state register
	process(clk,reset)
	begin
		if (reset = '1')  then 
			r_reg <= (others => '0');
		elsif (clk' event and clk = '1') then 
			r_reg <= r_next;
		end if;
	end process;
	--next state logic 
	r_inc <= r_reg + 1 ; 
	r_next <= (others => '0') when r_inc = unsigned(m) else
		r_inc;
	--output
	output <= std_logic_vector(r_reg);
end behavioral;