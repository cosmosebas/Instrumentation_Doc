


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cronometro is 
Port (
clk_int : in std_logic;
reset : in std_logic;
BCD1 : out std_logic_vector(3 downto 0);
BCD2 : out std_logic_vector(3 downto 0);
BCD3 : out std_logic_vector(3 downto 0);
BCD4 : out std_logic_vector(3 downto 0));
      
end cronometro;



architecture Behavioral of cronometro is

signal BCD1_int : integer;
signal BCD2_int : integer;
signal BCD3_int : integer;
signal BCD4_int : integer;

begin
BCD1 <= std_logic_vector(to_unsigned(BCD1_int, 4));
BCD2 <= std_logic_vector(to_unsigned(BCD2_int, 4));
BCD3 <= std_logic_vector(to_unsigned(BCD3_int, 4));
BCD4 <= std_logic_vector(to_unsigned(BCD4_int, 4));


    process(clk_int,reset)
    begin
     if reset = '1' then
        BCD1_int <= 0;
        BCD2_int <= 0;
        BCD3_int <= 0;
        BCD4_int <= 0;
        
     elsif rising_edge(clk_int) then
        if BCD1_int >= 9 then
            BCD1_int <= 0;
            
            
            if BCD2_int >= 9 then
                BCD2_int <= 0;
                
                
                if BCD3_int >= 9 then
                   BCD3_int <= 0;
                   
                   
                   if BCD4_int >= 5 then
                   BCD4_int <= 0;
                   
                   else
                        BCD4_int <= BCD4_int + 1;
                   
                   end if;
                else
                    BCD3_int <= BCD3_int + 1;   
                    
                end if;
            else 
                BCD2_int <= BCD2_int + 1;
                
            end if;
         
         else
            BCD1_int <= BCD1_int + 1;
          
        end if;
        
      end if;


    end process;
    
end Behavioral;