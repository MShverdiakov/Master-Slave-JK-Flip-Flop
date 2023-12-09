entity generator is
port (C, J, K: out bit);
end generator;

architecture gener of generator is
begin
process begin
    C <= '0'; J <= '1'; K <= '0'; wait for 100 ps;
    C <= '1'; J <= '1'; K <= '0'; wait for 100 ps;
    C <= '0'; J <= '1'; K <= '0'; wait for 100 ps;
    C <= '1'; J <= '0'; K <= '1'; wait for 100 ps;
    C <= '0'; J <= '0'; K <= '1'; wait for 100 ps;
    C <= '1'; J <= '1'; K <= '0'; wait for 100 ps;
    C <= '0'; J <= '1'; K <= '0'; wait for 100 ps;
    C <= '1'; J <= '1'; K <= '0'; wait for 100 ps;
    C <= '0'; J <= '1'; K <= '0'; wait for 100 ps;
    C <= '1'; J <= '0'; K <= '1'; wait for 100 ps;
    C <= '0'; J <= '0'; K <= '1'; wait for 100 ps;
    wait;
end process;
end;