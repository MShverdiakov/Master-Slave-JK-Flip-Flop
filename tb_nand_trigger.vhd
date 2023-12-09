 	-- Testbench for MS_JK_FF_NAND
entity tb_MS_JK_FF_NAND is
end;

architecture arch_tb_MS_JK_FF_NAND of tb_MS_JK_FF_NAND is
  --architecture sim of tb_comparator is
  component MS_JK_FF_NAND
    port(R, S, C, J, K: in bit; Q, NQ: inout bit);
  end component;
  constant T: time := 100 ps;
signal R, S, C, J, K, Q, NQ: bit;
begin
-- instantiate device under test
  dut: MS_JK_FF_NAND port map(R, S, C, J, K, Q, NQ);
  -- apply inputs one at C time
  process begin
    R <= '1'; S <= '1'; C <= '0'; J <= '1'; K <= '0'; wait for T;
    R <= '0'; S <= '1'; C <= '1'; J <= '1'; K <= '0'; wait for T;
    R <= '1'; S <= '1'; C <= '0'; J <= '1'; K <= '0'; wait for T;
    R <= '1'; S <= '1'; C <= '1' after 5 ps; J <= '0'; K <= '1'; wait for T;
    R <= '1'; S <= '1'; C <= '0'; J <= '0'; K <= '1'; wait for T;
    R <= '1'; S <= '1'; C <= '1'; J <= '1'; K <= '0'; wait for T;
    R <= '1'; S <= '1'; C <= '0'; J <= '0'; K <= '0'; wait for T;
    R <= '1'; S <= '1'; C <= '1'; J <= '0'; K <= '1'; wait for T;
    R <= '1'; S <= '1'; C <= '0'; J <= '1'; K <= '0'; wait for T;
    R <= '1'; S <= '1'; C <= '1'; J <= '0'; K <= '1'; wait for T;
    R <= '1'; S <= '1'; C <= '0'; J <= '0'; K <= '1'; wait for T;
    wait;
  end process;
end arch_tb_MS_JK_FF_NAND;