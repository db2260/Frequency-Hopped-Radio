----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    17:03:50 12/10/2021
-- Design Name:
-- Module Name:    spreader - Behavioral
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

entity spreader is
Port(
	RF_data : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	spread_data : out std_logic);
end spreader;

architecture Behavioral of spreader is
	signal state_pos : std_logic;
	signal state_neg : std_logic;
	signal state_toggle : std_logic;
	
begin
	SVR_pos : process(clk,reset)
	-- this FF toggles when state_neg is 1 during state_toggle HIGH
	-- but then toggles on each clock when state_toggle is LOW
	begin
		if reset = '1' then
			state_pos <= '0';
		elsif rising_edge(clk) then
			if state_toggle = '1' then
				if state_neg = '1' then
					state_pos <= not state_pos;
				end if;
			else -- state_toggle = '0'
				state_pos <= not state_pos;
			end if;
		end if;
	end process;
	
	SVR_neg : process(clk,reset)
	-- Toggle FF with reset
	begin
		if reset = '1' then
			state_neg <= '0';
		elsif falling_edge(clk) then
			state_neg <= not state_neg;
		end if;
	end process;
		
		
	FSM_toggle : process(state_neg,reset)
	-- Toggles on the +ve edge of state_neg when state_pos is LOW
	begin
		if reset = '1' then
				state_toggle <= '0';
		elsif rising_edge(state_neg) then
			if state_pos = '0' then
				state_toggle <= not state_toggle;
			end if;
		end if;
	end process;
	
	
	output : spread_data <= (state_pos xor state_neg) xor RF_data;

end Behavioral;
