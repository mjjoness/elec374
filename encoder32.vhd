library IEEE;
use IEEE.std_logic_1164.all;

entity encoder32 is
port(
	-- input registers r0 to r15
	r0 : in std_logic;
	r1 : in std_logic;
	r2 : in std_logic;
	r3 : in std_logic;
	r4 : in std_logic;
	r5 : in std_logic;
	r6 : in std_logic;
	r7 : in std_logic;
	r8 : in std_logic;
	r9 : in std_logic;
	r10 : in std_logic;
	r11 : in std_logic;
	r12 : in std_logic;
	r13 : in std_logic;
	r14 : in std_logic;
	r15 : in std_logic;
	
	hi : in std_logic;
	lo : in std_logic;
	zhi : in std_logic;
	zlo : in std_logic;
	pc : in std_logic;
	mdr : in std_logic;
	inport : in std_logic;
	c : in std_logic;

	s : out std_logic_vector (4 downto 0));
	end entity encoder32;

architecture arch of encoder32 is
begin
s <=	"00000" when r0 = '1' ELSE
		"00001" when r1 = '1' ELSE
		"00011" when r2 = '1' ELSE
		"00100" when r3 = '1' ELSE
		"00101" when r4 = '1' ELSE
		"00110" when r5 = '1' ELSE
		"00111" when r6 = '1' ELSE
		"01000" when r7 = '1' ELSE
		"01001" when r8 = '1' ELSE
		"01010" when r9 = '1' ELSE
		"01011" when r10 = '1'ELSE
		"01100" when r11 = '1'ELSE
		"01101" when r12 = '1'ELSE
		"01110" when r13 = '1'ELSE
		"01111" when r14 = '1'ELSE
		"10000" when r15 = '1'ELSE
		"10001" when hi = '1' ELSE
		"10010" when lo = '1' ELSE
		"10011" when zhi = '1' ELSE
		"10100" when zlo = '1' ELSE
		"10101" when pc = '1' ELSE
		"10110" when mdr = '1' ELSE
		"10111" when inport = '1' ELSE
		"11000" when c = '1';
end architecture arch;
