library ieee;
use ieee.std_logic_1164.all;
entity machine is
    port
    (
        clk         : in    std_logic;
        data_in     : in    std_logic;
        reset       : in    std_logic;
        student_id  : out   std_logic_vector(3 downto 0);
        current_state: out  std_logic_vector(3 downto 0));
end entity;

architecture fsm of machine is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s_err);
    -- Register to hold the current state
    signal yfsm : state_type;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            yfsm <= s0;
        elsif (clk'EVENT AND clk = '1') then
            -- Determine the next state synchronously, based on
            -- the current state and the input
            case yfsm is
                when s0 => 
					 if data_in='1' then yfsm <= s1;
					 end if;
                when s1 =>
					 if data_in='1' then yfsm <= s2;
					 end if;
                when s2 =>
					 if data_in='1' then yfsm <= s3;
					 end if;
                when s3 =>
					 if data_in='1' then yfsm <= s4;
					 end if;
					 when s4 =>
					 if data_in='1' then yfsm <= s5;
					 end if;
					 when s5 =>
					 if data_in='1' then yfsm <= s6;
					 end if;
					 when s6 =>
					 if data_in='1' then yfsm <= s7;
					 end if;
					 when s7 =>
					 if data_in='1' then yfsm <= s8;
					 end if;
                when s8 =>
					 if data_in='1' then yfsm <= s0;
					 end if;
					 when others =>
					 yfsm <= s_err;
            end case;
        end if;
    end process;
	 
    process (yfsm, data_in) -- data_in if reqd only 
    begin
        case yfsm is
            when s0 => student_id <= "0101";
            when s1 => student_id <= "0000";
            when s2 => student_id <= "0001";
				when s3 => student_id <= "0011";
				when s4 => student_id <= "0001";
            when s5 => student_id <= "0100";
				when s6 => student_id <= "0110";
				when s7 => student_id <= "0111";
				when s8 => student_id <= "1001";
				when s_err => student_id <= "1110";
        end case;
    end process;
				with yfsm select
						current_state <= "0000" when s0,
												"0001" when s1,
												"0010" when s2,
												"0011" when s3,
												"0100" when s4,
												"0101" when s5,
												"0110" when s6,
												"0111" when s7,
												"1000" when s8,
												"1110" when s_err;
end architecture;