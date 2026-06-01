library ieee;
use ieee.std_logic_1164.all;




entity shift_register is
	port(
		i_clock : in std_logic
		);
end shift_register;

architecture rtl of shift_register is 

signal test1 : std_logic := '1';
signal test2 : std_logic := '0';
signal test3 : std_logic := '0';
signal test4 : std_logic := '0';

begin  

process (i_clock)
begin
  if rising_edge(i_clock) then
    test2 <= test1;
    test3 <= test2;
    test4 <= test3;
  end if;
end process;

end rtl;
