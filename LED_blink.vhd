library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LED_blink is
    port(
        i_clock : in std_logic;
        i_enable : in std_logic;
        i_switch1 : in std_logic;
        i_switch2 : in std_logic;
        o_led_drive     : out std_logic
    );
end LED_blink;

architecture rtl of LED_blink is
    constant c_CNT_1Hz   : natural := 10;
    constant c_CNT_10Hz  : natural := 5;
    constant c_CNT_50Hz  : natural := 3;
    constant c_CNT_100Hz : natural := 2;

    signal r_CNT_1Hz : natural range 0 to c_CNT_1Hz; 
    signal r_CNT_10Hz : natural range 0 to c_CNT_10Hz; 
    signal r_CNT_50Hz: natural range 0 to c_CNT_50Hz; 
    signal r_CNT_100Hz : natural range 0 to c_CNT_100Hz; 

    signal r_led_drive : std_logic := '0';

    signal r_TOGGLE_1Hz : std_logic := '0';
    signal r_TOGGLE_10Hz : std_logic := '0';
    signal r_TOGGLE_50Hz : std_logic := '0';
    signal r_TOGGLE_100Hz : std_logic := '0';

    signal w_LED_SELECT : std_logic;

begin
    p_1Hz : process(i_clock) is 
    begin
        if rising_edge( i_clock) then
            if r_CNT_1Hz = c_CNT_1Hz -1 then
                r_TOGGLE_1Hz <= not r_TOGGLE_1Hz;
                r_CNT_1Hz <= 0;
            else
                r_CNT_1Hz <= r_CNT_1Hz + 1;
            end if;
        end if;
    end process p_1Hz;

    p_10Hz : process(i_clock) is 
    begin
        if rising_edge( i_clock) then
            if r_CNT_10Hz = c_CNT_10Hz -1 then
                r_TOGGLE_10Hz <= not r_TOGGLE_10Hz;
                r_CNT_10Hz <= 0;
            else
                r_CNT_10Hz <= r_CNT_10Hz + 1;
            end if;
        end if;
    end process p_10Hz;


    p_50Hz : process(i_clock) is 
    begin
        if rising_edge( i_clock) then
            if r_CNT_50Hz = c_CNT_50Hz -1 then
                r_TOGGLE_50Hz <= not r_TOGGLE_50Hz;
                r_CNT_50Hz <= 0;
            else
                r_CNT_50Hz <= r_CNT_50Hz + 1;
            end if;
        end if;
    end process p_50Hz;

    p_100Hz : process(i_clock) is 
    begin
        if rising_edge( i_clock) then
            if r_CNT_100Hz = c_CNT_100Hz -1 then
                r_TOGGLE_100Hz <= not r_TOGGLE_100Hz;
                r_CNT_100Hz <= 0;
            else
                r_CNT_100Hz <= r_CNT_100Hz + 1;
            end if;
        end if;
    end process p_100Hz;

-- multiplexer based on switch inputs 
    

    w_LED_SELECT <= r_TOGGLE_1Hz when (i_switch1 = '0' and i_switch2 = '0') else
                r_TOGGLE_10Hz when (i_switch1 = '1' and i_switch2 = '0') else
                r_TOGGLE_50Hz when (i_switch1 = '0' and i_switch2 = '1') else
                r_TOGGLE_100Hz;

    o_led_drive <= w_LED_SELECT and i_enable;

end rtl;