----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2022 03:02:07 PM
-- Design Name: 
-- Module Name: sync - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sync is
    generic (
        -- number of stages in the input synchronizer
        SYNC_STAGES : integer range 2 to 650_000_000 := 8;
        -- reset value of the output signal
        RESET_VALUE : std_logic
    );
    port (
        clk   : in std_logic;
        res_n : in std_logic;

        data_in   : in std_logic;
        data_out  : out std_logic
    );
end sync;

architecture Behavioral of sync is
    signal ffs : std_logic_vector(0 to 1);
    signal cnt_rst: std_logic;
begin

    cnt_rst <= ffs(0) xor ffs(1);
    sync_proc : process(clk, res_n)
        variable count : integer range 0 to SYNC_STAGES;
    begin
        if res_n = '0' then
            ffs <= (others => RESET_VALUE);
        elsif rising_edge(clk) then
            ffs(0) <= data_in; -- get new data
            ffs(1) <= ffs(0);
            -- forward data to next synchronizer stage
            if cnt_rst = '1' then
                count := 0;
            elsif count < SYNC_STAGES then
                count := count +1;
            else 
                data_out<=  ffs(1);
            end if;
               
        end if;
    end process sync_proc;

end Behavioral;
