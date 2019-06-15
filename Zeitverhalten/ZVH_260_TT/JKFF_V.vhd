-- WARNING: Do NOT edit the input and output ports in this file in a text
-- editor if you plan to continue editing the block that represents it in
-- the Block Editor! File corruption is VERY likely to occur.

-- Copyright (C) 1991-2010 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.


-- Generated by Quartus II Version 9.1 (Build Build 304 01/25/2010)
-- Created on Thu May 13 11:56:09 2010
--
-- Hochschule Esslingen, Fakult�t IT
-- Copyright W. Zimmermann, W. Lindermeir, R. Keller   04/2010
-- Letzte �nderung: R. Keller  05/2010
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration

ENTITY JKFF_V IS
	-- {{ALTERA_IO_BEGIN}} DO NOT REMOVE THIS LINE!
	GENERIC(TP_CLK_Q_LH : INTEGER := 1;
			TP_CLK_Q_HL : INTEGER := 1;
			TP_CLK_Qn_LH : INTEGER := 1;
			TP_CLK_Qn_HL : INTEGER := 1);
	PORT
	(
		J : IN STD_LOGIC;
		K : IN STD_LOGIC;
		SET_n : IN STD_LOGIC;
		CLR_n : IN STD_LOGIC;
		CLK_n : IN STD_LOGIC;
		Q : OUT STD_LOGIC;
		Q_n : OUT STD_LOGIC
	);
	-- {{ALTERA_IO_END}} DO NOT REMOVE THIS LINE!
	
END JKFF_V;
--
--  Architecture Body
ARCHITECTURE JKFF_V_architecture OF JKFF_V IS

 signal Q_Act: STD_LOGIC;
 signal in_vec: STD_LOGIC_VECTOR (1 DOWNTO 0);
	
BEGIN

    in_vec <= (K, J);  -- Eingabesignale in Vektorform

	JKFF_Tp:  PROCESS (J, K, CLK_n, CLR_n, SET_n)
	  variable Q_var: std_logic;
	BEGIN
	  IF (CLR_n = '0') THEN
	     Q_var := '0';
	  ELSIF (SET_n = '0') THEN
	     Q_var := '1';
	  ELSIF (Falling_Edge(CLK_n)) THEN
	    CASE (in_vec) IS
	      WHEN "00" => Q_var := Q_act;     -- Speichern
	      WHEN "01" => Q_var := '1';       -- Setzen     
	      WHEN "10" => Q_var := '0';       -- R�cksetzen
	      WHEN "11" => Q_var := NOT Q_act; -- Toggeln
	      WHEN OTHERS => Q_var := Q_act;
	    END CASE;
	  END IF;
	  --
	  -- Ausg�nge in der Simulation verz�gert schalten
	  IF (Q_var = '0') THEN
	    Q   <= Q_var     after (TP_CLK_Q_HL * 1ns);
	    Q_n <= NOT Q_var after (TP_CLK_Qn_LH * 1ns);
	  ELSE
	    Q   <= Q_var     after (TP_CLK_Q_LH * 1ns);
	    Q_n <= NOT Q_var after (TP_CLK_Qn_HL * 1ns);
	  END IF;
	  Q_Act <= Q_var;
	END PROCESS JKFF_Tp;
END JKFF_V_architecture;