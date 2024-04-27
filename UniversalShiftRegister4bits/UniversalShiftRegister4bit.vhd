library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UniversalShiftRegister4bit is 
	port(
		clk,reset: in std_logic;
		en: in std_logic_vector(1 downto 0);
		--input: in std_logic_vector(3 downto 0); 
		output: out std_logic_vector(3 downto 0)
		);
end UniversalShiftRegister4bit;

architecture behavioral of UniversalShiftRegister4bit is
	signal r_reg,r_next: std_logic_vector(3 downto 0);
		begin
		--State register
			process(clk,reset)
				begin
					if (reset = '1') then
						r_reg <= (others =>'0');
					elsif (clk' event and clk = '1') then
						r_reg <= r_next;
					end if;
			end process;
		--Next state logic
			--process(r_reg,en,input)
			--begin 
				--case en is
				--when "00" =>
				--	r_next <= r_reg;
				--when "01" =>
				--	r_next <= input(3) & r_reg(3 downto 1);
				--when "10" =>
				--	r_next <= r_reg(2 downto 0) & input(0);
				--when others =>
				--	r_next <= input;
			   --end case;
			--end process;
			r_next <= r_reg when en = "00" else
						 r_reg(0) & r_reg(3 downto 1) when en = "01" else
						 r_reg(1 downto 0) & r_reg(2 downto 1) when en = "10" else
						 r_reg(2 downto 0) & r_reg(3);
			--with en select
				--r_next <= 
				--r_reg when "00",
				--input(3) & r_reg(3 downto 1) when  "01",
				--r_reg(2 downto 0) & input(0) when  "10",
				--input 								 when others;
		--Output
			output <= r_reg;
end behavioral;	