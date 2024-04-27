library ieee;
use ieee.std_logic_1164.all;

entity RightShiftReg4 is 
	port (
			reset,clk,d : in std_logic;
			q : out std_logic
			);
end RightShiftReg4;

architecture behavioral of RightShiftReg4 is

	signal q_reg,q_next : std_logic_vector(3 downto 0);

	begin
		--state register
		process(reset,clk)
			begin
				if (reset = '1') then
					q_reg <= "0000";
				elsif ( clk' event and clk = '1' )then
					q_reg <= q_next;
				end if;
		end process;
		--next state 
		q_next <= d & q_reg (3 downto 1); 
		--output
		q <= q_reg(0);
	end behavioral;
