----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2022 03:20:37 PM
-- Design Name: 
-- Module Name: sync_array - Behavioral
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
use work.sync;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sync_array is
    generic (
        -- number of stages in the input synchronizer
        SYNCH_CNT : integer range 1 to 255 := 3;
        SYNC_STAGES : integer range 2 to 255 := 8;
        -- reset value of the output signal
        RESET_VALUE : std_logic := '1'
    );
    Port ( clk : in std_logic;
           res_n : in std_logic;
           data_in : in std_logic_vector(0 to SYNCH_CNT-1);
           data_out : out std_logic_vector(0 to SYNCH_CNT-1)
          );
end sync_array;

architecture Behavioral of sync_array is
    component sync is
        generic
        (
          -- number of stages in the input synchronizer
          SYNC_STAGES : integer range 2 to 255 := 8;
          -- reset value of the output signal
          RESET_VALUE : std_logic
        );
        port
        (
          clk       : in std_logic;
          res_n     : in std_logic;
          
          data_in   : in std_logic;
          data_out  : out std_logic
        );
    end component sync;
begin
   gen_synchronizers: 
   for I in 0 to SYNCH_CNT-1 generate
      synch_x : sync 
        generic map
        (
            SYNC_STAGES => SYNC_STAGES ,
            RESET_VALUE => '1'
        )
        port map
        (
            clk => clk ,
            res_n => res_n ,
            data_in => data_in ( I ) ,
            data_out => data_out( I) 
        );
   end generate gen_synchronizers;

end Behavioral;
