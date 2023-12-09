entity stend is
port ( condition: out bit_vector(1 to 4);
outJ, outK, outQ, outNQ: out bit);
end stend;

architecture stend of stend is

component generator
port(C, J, K:out bit);
end component;

component MS_JK_FF
port (C, J, K:in bit; Q,NQ:inout bit);
end component;

component observer
port (C, J, K, Q, NQ: in bit;
condition: out bit_vector(1 to 4);
outJ, outK, outQ, outNQ: out bit);
end component;

signal C, J, K, Q, NQ: bit;

begin

Gen: generator port map(C, J, K);
Trigger: MS_JK_FF port map(C, J, K, Q, NQ);
Observ: observer port map(C, J, K, Q, NQ, condition, outJ, outK, outQ, outNQ); 
end;
