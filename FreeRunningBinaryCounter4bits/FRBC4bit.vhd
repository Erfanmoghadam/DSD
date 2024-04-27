library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FRBC4bit is
	port(
		clk,reset : in std_logic;
		output : out std_logic_vector(3 downto 0);
		max_pulse : out std_logic
		);
end FRBC4bit;

architecture behavioral of FRBC4bit is

	signal r_next,r_reg : unsigned(3 downto 0);

begin
	--state register 
	process(clk,reset)
	begin
		if (reset = '1') then
			r_reg <= (others => '0');
		elsif ( clk' event and clk = '1' ) then 
			r_reg <= r_next;
		end if;
	end process;
	--next state logic
	r_next <= r_reg + 1;
	--output
	output <= std_logic_vector(r_reg);
	max_pulse <= '1' when r_reg = "1111" else
		'0';
end behavioral;