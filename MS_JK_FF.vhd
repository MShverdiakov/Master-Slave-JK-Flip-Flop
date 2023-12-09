entity MS_JK_FF is
	generic(T01: time := 5 ps; T10: time := 7 ps );
	port(C, J, K: in bit; Q, NQ: inout bit);
end MS_JK_FF;

architecture arch_MS_JK_FF of MS_JK_FF is
  signal Q_buf: bit;
begin
  process(C, J, K)
  begin
    -- if (rising_edge(C)) then
	-- if (J = '0' and K = '1') then
	 	-- Q_buf <= '0';
	--  elsif (J = '1' and K = '0') then
	 	-- Q_buf <= '1';
	--  elsif (J = '1' and K = '1') then
	 	-- Q_buf <= (not Q_buf);
	 -- end if;
    -- end if;

	if falling_edge(C) then
		assert not (C = '0' or (J = '0' and K = '0')) report ("storage mode") severity warning;
		
		Q_buf <= ((J and (not Q_buf)) or ((not K) and Q_buf));
	end if;

    if (Q_buf = '0' and Q = '1') then
    	Q <= Q_buf after T10;
    	NQ <= (not Q_buf) after T01;
    elsif (Q_buf = '1' and Q = '0') then
	Q <= Q_buf after T01;
    	NQ <= (not Q_buf) after T10;
    else
	Q <= Q_buf;
	NQ <= (not Q_buf);
    end if;
  end process;
end arch_MS_JK_FF;