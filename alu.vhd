library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;
use work.components_all.all;

entity alu is port(
A : in std_logic_vector(31 downto 0);	
B : in std_logic_vector(31 downto 0);	
ALU_sel : in std_logic_vector(4 downto 0);
overflow : out std_logic;	
C : out std_logic_vector(63 downto 0)	
);
end entity alu; 


architecture behav of alu is 
signal Mulout: std_logic_vector(63 downto 0);
signal Divout: std_logic_vector(63 downto 0);
signal addorsub: std_logic;
signal addsuboverflow: std_logic;
signal addsubout: std_logic_vector(31 downto 0);
signal rorout:std_logic_vector(31 downto 0);
signal rolout:std_logic_vector(31 downto 0);
signal shrout: std_logic_vector(31 downto 0);
signal shlout: std_logic_vector(31 downto 0);
signal negout: std_logic_vector(31 downto 0);

begin 
aluMul: booth_logic port map (A, B, Mulout);
aluDiv: lpm_divida port map(B, A, Divout(31 downto 0), Divout(63 downto 32));
aluAddSub: lpm_add_sua port map (addorsub, A, B, addsuboverflow, addsubout);
aluRor: ror32 port map (A, B(4 downto 0), rorout);
aluRol: rol32 port map (A, B(4 downto 0), rolout);
aluShl: shl32 port map (A, B, shlout);
aluShr: shr32 port map (A, B, shrout);
aluNeg: negate32 port map(B, negout);

process(A,B,ALU_sel,Mulout,Divout,addorsub,addsuboverflow,addsubout,negout, shlout, shrout, rorout, rolout) is

begin
addorsub <= '0';
overflow <= '0';

if(ALU_sel = "01001")then 
	C(31 downto 0)<= A and B;
	C(63 downto 32)<=(others=>'0');
	
elsif (ALU_sel = "01010") then 
	C(31 downto 0)<= A or B;
	C(63 downto 32)<=(others=>'0');

elsif (ALU_sel = "01010") then 
	C(31 downto 0)<= A or B;
	C(63 downto 32)<=(others=>'0');
	
elsif (ALU_sel = "10001") then 
	C(31 downto 0)<= not B;
	C(63 downto 32)<=(others=>'0');
	
elsif (ALU_sel = "10000") then 
	C(31 downto 0)<= negout;
	C(63 downto 32)<=(others=>'0');
	
elsif (ALU_sel = "00101") then 
	C(31 downto 0)<= shrout;
	C(63 downto 32)<=(others=>'0');
	
elsif (ALU_sel = "00110") then 
	C(31 downto 0)<= shlout;
	C(63 downto 32)<=(others=>'0');
	
elsif (ALU_sel = "00111") then 
	C(31 downto 0)<= rorout;
	C(63 downto 32)<=(others=>'0');
	
elsif (ALU_sel = "01000") then 
	C(31 downto 0)<= rolout;
	C(63 downto 32)<=(others=>'0');
	
elsif (ALU_sel = "01110") then 
	C <= Mulout;
	
elsif (ALU_sel = "01111") then 
	C <= Divout;
	
elsif (ALU_sel ="00011") then 
	addorsub <= '1';
	C(31 downto 0) <= addsubout;
	C(63 downto 32) <= (others => '0');
	overflow <= addsuboverflow;
	
elsif (ALU_sel ="00100") then 
	addorsub <= '0';
	C(31 downto 0) <= addsubout;
	C(63 downto 32) <= (others => '0');
	overflow <= addsuboverflow;
else
	C <= (others=>'0');
	
end if ;
end process;
end architecture behav;

	