entity MS_JK_FF_NAND is
 port (
     R: in BIT;
     S: in BIT;
     C: in BIT;
     J: in BIT;
     K: in BIT;
     Q: out BIT;
     NQ: out BIT
      );
end MS_JK_FF_NAND;

entity and_no_3 is
 port (
    x1: in BIT;
    x2: in BIT;
    x3: in BIT;
    o: out BIT );
end and_no_3;
architecture arch_and_no_3 of and_no_3 is
 begin
     o<= not (x1 and x2 and x3) after 2 ps; -- delay - ???????? ?? ????????
 end arch_and_no_3;

architecture arch_MS_JK_FF_NAND of MS_JK_FF_NAND is
   component and_no_3
          port (
             x1: in BIT;
             x2: in BIT;
             x3: in BIT;
             o: out BIT
              );
    end component;
    signal Y: bit_vector(1 to 8);
    begin
		
	  assert not (C = '0' or (J = '0' and K = '0'))
	  report ("storage mode")
	  severity warning;
	
	  assert ((not (C'EVENT and C = '1')) or (J'EVENT or K'EVENT)) report ("synchronous error") severity warning;

          E1: and_no_3
                port map (Y(8), J, C, Y(1));
          E2: and_no_3
                port map (Y(7), K, C, Y(2));

	  assert not (Y(1) = '1' and Y(2) = '1')
	  report ("master RS trigger unstable")
	  severity warning;

          E3: and_no_3
                port map (S, Y(1), Y(4), Y(3));
          E4: and_no_3
                port map (Y(3), Y(2), R, Y(4));
          E5: and_no_3
                 port map (Y(2), Y(3), Y(1), Y(5));
          E6: and_no_3
                 port map (Y(2), Y(4), Y(1), Y(6));

	  assert (not (Y(5)='1' and Y(6)='1'))
	  report ("slave RS trigger unstable")
	  severity warning;

          E7: and_no_3
                 port map (S, Y(5), Y(8), Y(7));
          E8: and_no_3
                 port map (Y(7), Y(6), R, Y(8));

	  assert (not (Y(7) = Y(8))) report ("output error") severity warning;

          Q <= Y(7);
          NQ <= Y(8);
 end arch_MS_JK_FF_NAND;
