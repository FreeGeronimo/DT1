-- WARNING: Do NOT edit the input and output ports in this file in a text
-- editor if you plan to continue editing the block that represents it in
-- the Block Editor! File corruption is VERY likely to occur.

-- Copyright (C) 1991-2004 Altera Corporation
-- Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
-- support information,  device programming or simulation file,  and any other
-- associated  documentation or information  provided by  Altera  or a partner
-- under  Altera's   Megafunction   Partnership   Program  may  be  used  only
-- to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
-- other  use  of such  megafunction  design,  netlist,  support  information,
-- device programming or simulation file,  or any other  related documentation
-- or information  is prohibited  for  any  other purpose,  including, but not
-- limited to  modification,  reverse engineering,  de-compiling, or use  with
-- any other  silicon devices,  unless such use is  explicitly  licensed under
-- a separate agreement with  Altera  or a megafunction partner.  Title to the
-- intellectual property,  including patents,  copyrights,  trademarks,  trade
-- secrets,  or maskworks,  embodied in any such megafunction design, netlist,
-- support  information,  device programming or simulation file,  or any other
-- related documentation or information provided by  Altera  or a megafunction
-- partner, remains with Altera, the megafunction partner, or their respective
-- licensors. No other licenses, including any licenses needed under any third
-- party's intellectual property, are provided herein.


-- Generated by Quartus II Version 4.0 (Build Build 190 1/28/2004)
-- Created on Sun Aug 29 18:04:51 2004

LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration

ENTITY Toggle_REG IS
	-- {{ALTERA_IO_BEGIN}} DO NOT REMOVE THIS LINE!
	PORT
	(
		clk : IN STD_LOGIC;
		buttons_entprellt : IN STD_LOGIC_VECTOR(3 downto 0);
		state : OUT STD_LOGIC_VECTOR(3 downto 0)
	);
	-- {{ALTERA_IO_END}} DO NOT REMOVE THIS LINE!
	
END Toggle_REG;


--  Architecture Body

ARCHITECTURE Toggle_REG_architecture OF Toggle_REG IS

-- Der Zustand state wird bitweise getoggelt, falls 
-- buttons_entprellt '0' ist
	
signal int_state : bit_vector(3 downto 0);

BEGIN

PROCESS (clk)
BEGIN
IF (clk'event AND clk = '1') THEN
   int_state <= int_state XOR NOT To_bitvector(buttons_entprellt, '0');
END IF;
END PROCESS;

state <= to_stdlogicvector(int_state);

END Toggle_REG_architecture;
