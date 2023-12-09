
-- Testbench for MS_JK_FF
entity tb_MS_JK_FF is
end tb_MS_JK_FF;

architecture arch_tb_MS_JK_FF of tb_MS_JK_FF is
  --architecture sim of tb_comparator is
  component MS_JK_FF
    port(C, J, K: in bit; Q, NQ: inout bit);
  end component;
  constant T: time := 100 ps;
signal C, J, K, Q, NQ: bit;
begin
-- instantiate device under test
  dut: MS_JK_FF port map(C, J, K, Q, NQ);
  -- apply inputs one at C time
  process begin
    C <= '0'; J <= '1'; K <= '0'; wait for T;
    C <= '1'; J <= '1'; K <= '0'; wait for T;
    C <= '0'; J <= '1'; K <= '0'; wait for T;
    C <= '1'; J <= '0'; K <= '1'; wait for T;
    C <= '0'; J <= '0'; K <= '1'; wait for T;
    C <= '1'; J <= '1'; K <= '0'; wait for T;
    C <= '0'; J <= '1'; K <= '0'; wait for T;
    C <= '1'; J <= '1'; K <= '0'; wait for T;
    C <= '0'; J <= '1'; K <= '0'; wait for T;
    C <= '1'; J <= '0'; K <= '1'; wait for T;
    C <= '0'; J <= '0'; K <= '1'; wait for T;
    wait;
  end process;
end arch_tb_MS_JK_FF;