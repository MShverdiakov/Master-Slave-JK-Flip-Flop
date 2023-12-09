entity observer is
port (C, J, K, Q, NQ: in bit;
condition: out bit_vector(1 to 4);
outJ, outK, outQ, outNQ: out bit);
end observer;

architecture observer of observer is
begin
process(C, J, K, Q, NQ) begin
if (J = '1' and K = '1' and (C'EVENT and C = '0')) then condition <= "1000"; -- toggle
elsif (falling_edge(C) and J = '0' and K = '1') then condition <= "0010"; -- reset
elsif (falling_edge(C) and J = '1' and K = '0') then condition <= "0001"; -- set
elsif ((C'EVENT and C = '0') or (falling_edge(C) and J = '0' and K = '0')) then condition <= "0100"; end if; -- storage

outJ <= J;
outK <= K;
outQ <= Q;
outNQ <= NQ;
end process;
end;