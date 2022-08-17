----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:55 12/09/2021 
-- Design Name: 
-- Module Name:    pn_code_gen - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pn_code_gen is
Port(
	clk, reset : in std_logic;
	pn_out : out std_logic);
end pn_code_gen;

architecture Behavioral of pn_code_gen is

	component d_ff port (D,clk,reset : in std_logic; -- D Flip Flop
				Q : out std_logic);
	end component;

	signal Q1,Q2,Q3,Q4,x : std_logic;

	begin 

	D1 : d_ff port map(x,clk,reset,Q1); -- Cascading flip flops to make an LFSR
	D2 : d_ff port map(Q1,clk,reset,Q2);
	D3 : d_ff port map(Q2,clk,reset,Q3);
	D4 : d_ff port map(Q3,clk,reset,Q4);
	--x <= Q1 xnor Q4; -- Getting feedback
	pn_out <= Q4;

end Behavioral;
