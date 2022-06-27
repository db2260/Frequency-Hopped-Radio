----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:21 12/09/2021 
-- Design Name: 
-- Module Name:    d_ff - Behavioral 
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

entity d_ff is
    Port ( D : in  STD_LOGIC; --Input
           clk : in  STD_LOGIC; --Clock
           reset : in  STD_LOGIC; --Reset signal
           Q : out  STD_LOGIC); --Output
end d_ff;

architecture Behavioral of d_ff is

begin
	process(clk,reset) begin
	if clk'event and clk='1' then
		if reset = '1' then Q <= '0';
		else Q <= D;
		end if;
	end if;
	end process;

end Behavioral;
