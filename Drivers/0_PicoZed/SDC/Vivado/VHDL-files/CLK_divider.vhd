library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CLK_divider is
    Generic ( CLK_DIVIDER : integer range 1 to 100_000_000 := 50_000_000 );
    Port 
    (
        DISABLE_I : in  STD_ULOGIC := '0';
        CLK_I     : in  STD_ULOGIC;
        CLK_O     : out STD_ULOGIC := '0'
    );
end CLK_divider;

architecture Behavioral of CLK_divider is
    signal counter : integer  :=  0 ; 
begin


    -- Use CLK enable instead of a gated CLK to avoid timing issues or CLK domain crossings. 
    process(CLK_I, DISABLE_I)
    begin
        if DISABLE_I = '1' then
            counter <= 0;
            
        elsif rising_edge(CLK_I) then
            counter <= counter + 1;
            if (counter >= CLK_DIVIDER) then
                CLK_O <= '1';
                counter <= 0; 
            else
                CLK_O <= '0'; 
            end if;
        end if;
    end process;

end Behavioral;
