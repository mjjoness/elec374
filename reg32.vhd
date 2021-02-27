Library ieee;
Use ieee.std_logic_1164.ALL;
Use ieee.std_logic_arith.ALL;
Use ieee.std_logic_unsigned.ALL;

entity reg32 is Port(
D : in std_logic_vector (31 downto 0);
ld : in std_logic; 
clr : in std_logic;
clk : in std_logic;
Q: out std_logic_vector (31 downto 0)); 

end entity reg32;


architecture behav of reg32 is 
begin
	process(clk, clr)
		begin
			if clr = '0' then 
				Q<= (others=>'0');
			elsif (clk'event and clk='1') then
            if ld = '1' then
                Q <= D;
            end if;
        end if;
    end process;
end behav;