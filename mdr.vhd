library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.components_all.all;

entity mdr is port(
mux_read: in std_logic; 
mrd_enable: in std_logic; 
clr: in std_logic;
clk: in std_logic;
mdr_i1:in std_logic_vector(31 downto 0); 
mdr_i2: in std_logic_vector(31 downto 0); 
mdr_out: out std_logic_vector(31 downto 0)
);
end entity mdr;

architecture arch of mdr is 
signal mux_out: std_logic_vector(31 downto 0);
begin 
mux_out <= mdr_i1 when mux_read = '0' else 
				 mdr_i2;
mdr: register32bit port map(mux_out, mdr_enable, clr, clk, mdr_out);

end architecture arch;
