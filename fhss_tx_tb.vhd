library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fhss_tx_tb is
end;

architecture test of fhss_tx_tb is
  
  signal clk : std_logic := '1';
  signal rst : std_logic := '0';
  signal mt : std_logic_vector(7 downto 0);
  signal data : std_logic_vector(7 downto 0);
  
  begin
  
  radio : entity work.mixer
    port map(clock => clk,
              reset => rst,
				  input_data => mt, 
              output_data => data);
      
  
  clk_proc : process
    begin
	 wait until clk'event and clk='1';
    clk <= not clk;
  end process clk_proc;
	
end test;
