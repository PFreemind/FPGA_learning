library ieee; 
use ieee.std_logic_1164.all;

entity shift_register_tb is 
end shift_register_tb;


architecture sim of shift_register_tb is 
	
	signal i_clock : std_logic := '0';
	
begin

	uut : entity work.shift_register
		port map ( 
			i_clock => i_clock
			);
		
		i_clock <= not i_clock after 5 ns;
		
		process 
		begin 
			wait for 100 ns;
			assert false report "Simulation finished " severity failure;
		end process;
	
	end sim;
	
	
