library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.numeric_std.all;

entity telemetre_tb is
end entity;

architecture bench of telemetre_tb is

	signal clk,rst,echo,trig, go :  std_logic;
	signal sortie		         :  std_logic_vector(7 downto 0);
	
	begin 
	
	CLKGenerator : process
		
		begin
		
			CLK <= '0';
			wait for 5 NS;
			
			CLK <= '1';
			wait for 5 NS;
			
	end process;

		
	reset : process
		
		begin
		
			rst <= '1';
			wait for 10 ns;
			
			rst <= '0';
			wait for 2000 ns;
			
			wait;
			
	end process;
	
	stimulus : process
		
		begin
		
		Echo <= '1';
		wait for 10000 ns;
		
		Echo <= '1';
		wait for 30000000 ns;
		
		Echo <= '0';
		wait for 200 ms;
		
		Echo <= '1';
		wait for 20040 ns;
		
		Echo <= '1';
		wait for 2E7 ns;
		
		Echo <= '0';
		wait for 100 ms;
	
	end process;
	
	
	A0 : entity work.telemetre port map ( clk => clk,
										  rst => rst,
										  echo => echo,
										  trig => trig, 
										  go => go
										);
										
end architecture;
		