----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:51:04 12/09/2021
-- Design Name:
-- Module Name:    bpsk_mod - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bpsk_mod is
Port(
	clk : in std_logic; -- Processing clock
	valid_in : in std_logic; -- Input valid signal
	reset : in std_logic; -- Asynchronous reset signal
	valid_out : out std_logic; -- Output valid signal
	data_in : in std_logic_vector(7 downto 0); -- Input data signal
	data_out : out std_logic_vector(7 downto 0) -- output data
);
end bpsk_mod;

architecture Behavioral of bpsk_mod is
begin
process(clk, reset) begin
	if reset = '1' then
		valid_out <= '0';
		data_out <= (others => '0');
	elsif clk'event and clk = '1' then
		if valid_in = '1' then
			data_out <= data_in(0) & data_in(7 downto 1);
		else
			valid_out <= '0';
			data_out <= (others => '0');
		end if;
	end if;
end process;
	
end Behavioral;
