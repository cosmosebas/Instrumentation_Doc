--binary to 7 segments display converter

-- One display is selected with a button
-- the number is formed with switches


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_STD.ALL;
use IEEE.math_real.ALL;


entity codificador is 
	port (
	    display : in std_logic_vector(3 downto 0);
		number  : in std_logic_vector(3 downto 0);
		output  : out std_logic_vector(6 downto 0);
		display_out : out std_logic_vector(3 downto 0));
end codificador;


architecture arqcod of codificador is

--signal display :  std_logic_vector(3 downto 0);

begin

process (number) begin
	case number is
		when x"0" => 
		   output <= "1111110";
		   
		when X"1" =>   
			output <= "0110000";
			  
		when X"2" =>   
			output <= "1101101";
			  
		when X"3" =>   
			output <= "1111001";
			  
		when X"4" =>   
			output <= "0110011";
			  
		when X"5" =>   
			output <= "1011011";
			  
		when X"6" =>   
			output <= "1011111";
			  
		when X"7" =>   
			output <= "1110000";
			  
		when X"8" =>   
			output <= "1111111";
			  
		when X"9" =>   
			output <= "1110011";
		when others =>
		    output <= "0000000";	
	end case;
	
end process;

display_out <= display ;

end arqcod;


	