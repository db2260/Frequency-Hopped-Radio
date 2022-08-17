library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mixer is
Port (
  clock : in std_logic;
  reset : in std_logic;
  input_data : in std_logic_vector(7 downto 0);
  output_data : out std_logic_vector(7 downto 0)
);
end mixer;

architecture Behavioral of mixer is

  component bpsk_mod port (clk,valid_in,reset : in std_logic;
                      valid_out : out std_logic;
			 data_in : in std_logic_vector(7 downto 0);
                      data_out : out std_logic_vector(7 downto 0));
  end component;

  component spreader port (RF_data,clk,reset : in std_logic;
                      spread_data : out std_logic);
  end component;
  
  component pn_code_gen port (clk,reset : in std_logic;
				pn_out : out std_logic);
	end component;
  
  signal vin,vout : std_logic;
  signal dout,output : std_logic_vector(7 downto 0);

  begin
		
	--Instantiate PN code generator
		P1 : pn_code_gen port map(clock,reset,dout(0));
		P2 : pn_code_gen port map(clock,reset,dout(1));
		P3 : pn_code_gen port map(clock,reset,dout(2));
		P4 : pn_code_gen port map(clock,reset,dout(3));
		P5 : pn_code_gen port map(clock,reset,dout(4));
		P6 : pn_code_gen port map(clock,reset,dout(5));
		P7 : pn_code_gen port map(clock,reset,dout(6));
		P8 : pn_code_gen port map(clock,reset,dout(7));
		
	--Instantiate BPSK modulator
	B1 : bpsk_mod port map(clock,vin,reset,vout,input_data,output);
	 
	 --Instantiate spreader and mixer
    S1 : spreader port map(dout(0),clock,reset,output_data(0));
    S2 : spreader port map(dout(1),clock,reset,output_data(1));
    S3 : spreader port map(dout(2),clock,reset,output_data(2));
    S4 : spreader port map(dout(3),clock,reset,output_data(3));
    S5 : spreader port map(dout(4),clock,reset,output_data(4));
    S6 : spreader port map(dout(5),clock,reset,output_data(5));
    S7 : spreader port map(dout(6),clock,reset,output_data(6));
    S8 : spreader port map(dout(7),clock,reset,output_data(7));
  
end Behavioral;
