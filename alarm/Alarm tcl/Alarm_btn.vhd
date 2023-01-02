----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2022 07:39:29 PM
-- Design Name: 
-- Module Name: Alarm_btn - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

			
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alarm_btn is
Port (
btn: in std_logic_vector(3 downto 0):=(others => '0');
Record_PS: out std_logic;
RGB:out std_logic_vector(2 downto 0);
Led: out std_logic_vector(3 downto 0)
);
end Alarm_btn;

architecture Behavioral of Alarm_btn is
type Statetype is (State1,State2,State3,State4,State5,State6);
signal state:Statetype:=State1;
signal arm : std_logic:='0';
begin
process(btn)
begin
case state is
when state1 =>
Record_PS <= '0';
if btn = "0100" then
state <= state2;
end if;
if btn = "0000" then

else
state <= state1;
end if;
when state2 =>
if btn = "0100" then
state <= state3;
elsif btn = "0000" then

else
state <= state1;
end if;
when state3 =>
if btn = "0100" then
state <= state4;
elsif btn = "0000" then

else
state <= state1;
end if;
when state4 =>
if btn = "0100" then
state <= state5;
elsif btn = "0000" then

else
state <= state1;

end if;
when state5 =>
if btn = "0100" then
state <= state6;
elsif btn = "0000" then

else
state <= state1;

end if;
when state6 =>
arm <= not arm; 
state <= state1;
end case;
if arm = '0' then 
rgb <= "100";
else
rgb <= "010";
Record_PS <= '1';
end if;

end process;
led <= btn;
end Behavioral;
