
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;




entity maquina_estados is Port (
        clk : in std_logic;
		output  : out std_logic_vector(6 downto 0);
		display_out : out std_logic_vector(3 downto 0);
		reset : in std_logic);
end maquina_estados;



architecture Behavioral of maquina_estados is

constant max : integer := 1000000;
constant number_1 : std_logic_vector(3 downto 0) := "0011"; --3
constant number_2 : std_logic_vector(3 downto 0) := "0001"; --1
constant number_3 : std_logic_vector(3 downto 0) := "0101"; --5
constant number_4 : std_logic_vector(3 downto 0) := "0000"; --0

signal contador : integer;
signal Display : std_logic_vector(3 downto 0);
signal number : std_logic_vector(3 downto 0);

    type Estados_display is (S0,S1,S2,S3);
    signal Estado : Estados_display;
    
    component codificador is 
	port (
	    display : in std_logic_vector(3 downto 0);
		number  : in std_logic_vector(3 downto 0);
		output  : out std_logic_vector(6 downto 0);
		display_out : out std_logic_vector(3 downto 0));
    end component;

begin

    pantalla : codificador  
	port map (
	    display =>  Display,
		number  => number,
		output  => output,
		display_out => display_out);

    process(clk,reset)
    begin
        if(reset = '1') then
            contador <= 0;
            Estado <= S0;
        elsif rising_edge(clk) then
        
            case Estado is
                
                when S0 =>
                    Display <= "0001";
                    number <= number_1;
                    if contador >= max then
                      contador <= 0;
                      Estado <= S1;
                    else
                        contador <= contador + 1;
                   end if;
                    
				when S1 =>
                    Display <= "0010";
                    number <= number_2;
                    if contador >= max then
                      contador <= 0;
                      Estado <= S2;
                    else
                        contador <= contador + 1;
                   end if;
				   
				when S2 =>
                    Display <= "0100";
                    number <= number_3;
                    if contador >= max then
                      contador <= 0;
                      Estado <= S3;
                    else
                        contador <= contador + 1;
                   end if;
				   
				when S3 =>
                    Display <= "1000";
                    number <= number_4;
                    if contador >= max then
                      contador <= 0;
                      Estado <= S0;
                    else
                        contador <= contador + 1;
                   end if;
				   
				when others =>
					contador <= 0;
					Estado <= S0;
                    
                    
                    
                        
            end case; 
       end if;
   end process;           


end Behavioral;
