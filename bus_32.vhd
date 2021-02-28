library IEEE;
use IEEE.std_logic_1164.all;

entity bus_32 is 
port(
	-- registers r0 to r15
	b_r0 : in std_logic_vector (31 downto 0);
	b_r1 : in std_logic_vector (31 downto 0);
	b_r2 : in std_logic_vector (31 downto 0);
	b_r3 : in std_logic_vector (31 downto 0);
	b_r4 : in std_logic_vector (31 downto 0);
	b_r5 : in std_logic_vector (31 downto 0);
	b_r6 : in std_logic_vector (31 downto 0);
	b_r7 : in std_logic_vector (31 downto 0);
	b_r8 : in std_logic_vector (31 downto 0);
	b_r9 : in std_logic_vector (31 downto 0);
	b_r10 : in std_logic_vector (31 downto 0);
	b_r11 : in std_logic_vector (31 downto 0);
	b_r12 : in std_logic_vector (31 downto 0);
	b_r13 : in std_logic_vector (31 downto 0);
	b_r14 : in std_logic_vector (31 downto 0);
	b_r15 : in std_logic_vector (31 downto 0);
	
	b_hi : in std_logic_vector (31 downto 0);
	b_lo : in std_logic_vector (31 downto 0);
	b_zhi : in std_logic_vector (31 downto 0);
	b_zlo : in std_logic_vector (31 downto 0);
	b_pc : in std_logic_vector (31 downto 0);
	b_mdr : in std_logic_vector (31 downto 0);
	b_inport : in std_logic_vector (31 downto 0);
	c_sign_extended : in std_logic_vector (31 downto 0);
	
	-- 32 - to - 5 encoder as the Select
	sel : in std_logic_vector (4 downto 0);
	
	bus_mux_out : out std_logic_vector (31 downto 0)
);
end entity bus_32;

architecture behavioral of bus_32 is
begin
with sel select
bus_mux_out <= b_r0 when "00000",
					b_r1 when "00001",
					b_r2 when "00010",
					b_r3 when "00011",
					b_r4 when "00100",
					b_r5 when "00101",
					b_r6 when "00110",
					b_r7 when "00111",
					b_r8 when "01000",
					b_r9 when "01001",
					b_r10 when "01010",
					b_r11 when "01011",
					b_r12 when "01100",
					b_r13 when "01101",
					b_r14 when "01110",
					b_r15 when "01111",
					
					b_hi 		 when "10000",
					b_lo 		 when "10001",
					b_zhi 	 when "10010",
					b_zlo 	 when "10011",
					b_pc 		 when "10100",
					b_mdr 	 when "10101",
					b_inport  when "10110",
					c_sign_extended when "10111",
					"11111111111111111111111111111111" when others;

end architecture behavioral;
