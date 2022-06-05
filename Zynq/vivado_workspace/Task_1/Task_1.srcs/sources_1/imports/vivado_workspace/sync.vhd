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
        SYNC_STAGES : integer range 2 to 255 := 8;
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
    signal sync : std_logic_vector(1 to SYNC_STAGES);
begin
    sync_proc : process(clk, res_n)
    begin
        if res_n = '0' then
            sync <= (others => RESET_VALUE);
        elsif rising_edge(clk) then
            sync(1) <= data_in; -- get new data
            -- forward data to next synchronizer stage
            for i in 2 to SYNC_STAGES loop
                sync(i) <= sync(i - 1);
            end loop;
        end if;
    end process sync_proc;

    -- output synchronized data
    data_out <= sync(SYNC_STAGES);
end Behavioral;
