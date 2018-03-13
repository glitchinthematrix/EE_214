-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"

-- DATE "03/10/2018 11:08:53"

-- 
-- Device: Altera 5M1270ZT144C5 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	DUT IS
    PORT (
	input_vector : IN std_logic_vector(7 DOWNTO 0);
	output_vector : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END DUT;

-- Design Ports Information


ARCHITECTURE structure OF DUT IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input_vector : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_output_vector : std_logic_vector(3 DOWNTO 0);
SIGNAL \dut|x_4|x_1|x_1|c~combout\ : std_logic;
SIGNAL \dut|x_6|x_1|x_1|c~combout\ : std_logic;
SIGNAL \dut|x_8|x_1|x_1|c~combout\ : std_logic;
SIGNAL \dut|x_4|x_2|x_2|c~combout\ : std_logic;
SIGNAL \dut|x_6|x_2|x_2|c~combout\ : std_logic;
SIGNAL \dut|x_8|x_2|x_2|c~combout\ : std_logic;
SIGNAL \dut|x_8|x_1|x_3|c~combout\ : std_logic;
SIGNAL \dut|x_7|x_1|x_3|c~combout\ : std_logic;
SIGNAL \dut|x_4|x_3|x_2|c~0_combout\ : std_logic;
SIGNAL \dut|x_6|x_3|x_2|c~0_combout\ : std_logic;
SIGNAL \dut|x_6|x_3|x_2|c~1_combout\ : std_logic;
SIGNAL \dut|x_8|x_3|x_2|c~combout\ : std_logic;
SIGNAL \dut|x_8|x_4|x_2|c~combout\ : std_logic;
SIGNAL \input_vector~combout\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_input_vector <= input_vector;
output_vector <= ww_output_vector;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(6),
	combout => \input_vector~combout\(6));

-- Location: PIN_39,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(7),
	combout => \input_vector~combout\(7));

-- Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(5),
	combout => \input_vector~combout\(5));

-- Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(4),
	combout => \input_vector~combout\(4));

-- Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(2),
	combout => \input_vector~combout\(2));

-- Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(3),
	combout => \input_vector~combout\(3));

-- Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(1),
	combout => \input_vector~combout\(1));

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(0),
	combout => \input_vector~combout\(0));

-- Location: LC_X11_Y4_N5
\dut|x_4|x_1|x_1|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_4|x_1|x_1|c~combout\ = \input_vector~combout\(2) $ (\input_vector~combout\(3) $ (\input_vector~combout\(1) $ (\input_vector~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6996",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datab => \input_vector~combout\(3),
	datac => \input_vector~combout\(1),
	datad => \input_vector~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_4|x_1|x_1|c~combout\);

-- Location: LC_X9_Y4_N1
\dut|x_6|x_1|x_1|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_6|x_1|x_1|c~combout\ = (\input_vector~combout\(5) $ (\input_vector~combout\(4) $ (\dut|x_4|x_1|x_1|c~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c33c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \input_vector~combout\(5),
	datac => \input_vector~combout\(4),
	datad => \dut|x_4|x_1|x_1|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_6|x_1|x_1|c~combout\);

-- Location: LC_X9_Y4_N3
\dut|x_8|x_1|x_1|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_8|x_1|x_1|c~combout\ = \input_vector~combout\(6) $ (\input_vector~combout\(7) $ (((\dut|x_6|x_1|x_1|c~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9966",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(6),
	datab => \input_vector~combout\(7),
	datad => \dut|x_6|x_1|x_1|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_8|x_1|x_1|c~combout\);

-- Location: LC_X11_Y4_N4
\dut|x_4|x_2|x_2|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_4|x_2|x_2|c~combout\ = (\input_vector~combout\(2) & ((\input_vector~combout\(3) & ((!\input_vector~combout\(0)) # (!\input_vector~combout\(1)))) # (!\input_vector~combout\(3) & ((\input_vector~combout\(1)) # (\input_vector~combout\(0)))))) # 
-- (!\input_vector~combout\(2) & ((\input_vector~combout\(3) & ((\input_vector~combout\(1)) # (\input_vector~combout\(0)))) # (!\input_vector~combout\(3) & (\input_vector~combout\(1) & \input_vector~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datab => \input_vector~combout\(3),
	datac => \input_vector~combout\(1),
	datad => \input_vector~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_4|x_2|x_2|c~combout\);

-- Location: LC_X9_Y4_N8
\dut|x_6|x_2|x_2|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_6|x_2|x_2|c~combout\ = \dut|x_4|x_2|x_2|c~combout\ $ (((\input_vector~combout\(5) & ((\input_vector~combout\(4)) # (\dut|x_4|x_1|x_1|c~combout\))) # (!\input_vector~combout\(5) & (\input_vector~combout\(4) & \dut|x_4|x_1|x_1|c~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "566a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dut|x_4|x_2|x_2|c~combout\,
	datab => \input_vector~combout\(5),
	datac => \input_vector~combout\(4),
	datad => \dut|x_4|x_1|x_1|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_6|x_2|x_2|c~combout\);

-- Location: LC_X9_Y4_N9
\dut|x_8|x_2|x_2|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_8|x_2|x_2|c~combout\ = \dut|x_6|x_2|x_2|c~combout\ $ (((\input_vector~combout\(7) & ((\input_vector~combout\(6)) # (\dut|x_6|x_1|x_1|c~combout\))) # (!\input_vector~combout\(7) & (\input_vector~combout\(6) & \dut|x_6|x_1|x_1|c~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "566a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dut|x_6|x_2|x_2|c~combout\,
	datab => \input_vector~combout\(7),
	datac => \input_vector~combout\(6),
	datad => \dut|x_6|x_1|x_1|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_8|x_2|x_2|c~combout\);

-- Location: LC_X9_Y4_N5
\dut|x_8|x_1|x_3|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_8|x_1|x_3|c~combout\ = (\input_vector~combout\(7) & (\input_vector~combout\(6) $ (((\dut|x_6|x_1|x_1|c~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4488",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(6),
	datab => \input_vector~combout\(7),
	datad => \dut|x_6|x_1|x_1|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_8|x_1|x_3|c~combout\);

-- Location: LC_X9_Y4_N2
\dut|x_7|x_1|x_3|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_7|x_1|x_3|c~combout\ = (\input_vector~combout\(6) & (\input_vector~combout\(5) $ (\input_vector~combout\(4) $ (\dut|x_4|x_1|x_1|c~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8228",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(6),
	datab => \input_vector~combout\(5),
	datac => \input_vector~combout\(4),
	datad => \dut|x_4|x_1|x_1|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_7|x_1|x_3|c~combout\);

-- Location: LC_X11_Y4_N2
\dut|x_4|x_3|x_2|c~0\ : maxv_lcell
-- Equation(s):
-- \dut|x_4|x_3|x_2|c~0_combout\ = (\input_vector~combout\(2) & (\input_vector~combout\(3) & (\input_vector~combout\(1) & \input_vector~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datab => \input_vector~combout\(3),
	datac => \input_vector~combout\(1),
	datad => \input_vector~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_4|x_3|x_2|c~0_combout\);

-- Location: LC_X9_Y4_N0
\dut|x_6|x_3|x_2|c~0\ : maxv_lcell
-- Equation(s):
-- \dut|x_6|x_3|x_2|c~0_combout\ = (\input_vector~combout\(4) & ((\dut|x_4|x_1|x_1|c~combout\ & ((!\dut|x_4|x_3|x_2|c~0_combout\))) # (!\dut|x_4|x_1|x_1|c~combout\ & (\input_vector~combout\(5))))) # (!\input_vector~combout\(4) & (\input_vector~combout\(5) & 
-- ((\dut|x_4|x_1|x_1|c~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3aa0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(5),
	datab => \dut|x_4|x_3|x_2|c~0_combout\,
	datac => \input_vector~combout\(4),
	datad => \dut|x_4|x_1|x_1|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_6|x_3|x_2|c~0_combout\);

-- Location: LC_X9_Y4_N4
\dut|x_6|x_3|x_2|c~1\ : maxv_lcell
-- Equation(s):
-- \dut|x_6|x_3|x_2|c~1_combout\ = (\dut|x_4|x_3|x_2|c~0_combout\ $ (((\dut|x_6|x_3|x_2|c~0_combout\ & \dut|x_4|x_2|x_2|c~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3ccc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \dut|x_4|x_3|x_2|c~0_combout\,
	datac => \dut|x_6|x_3|x_2|c~0_combout\,
	datad => \dut|x_4|x_2|x_2|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_6|x_3|x_2|c~1_combout\);

-- Location: LC_X9_Y4_N6
\dut|x_8|x_3|x_2|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_8|x_3|x_2|c~combout\ = \dut|x_6|x_3|x_2|c~1_combout\ $ (((\dut|x_8|x_1|x_3|c~combout\ & ((\dut|x_7|x_1|x_3|c~combout\) # (\dut|x_6|x_2|x_2|c~combout\))) # (!\dut|x_8|x_1|x_3|c~combout\ & (\dut|x_7|x_1|x_3|c~combout\ & 
-- \dut|x_6|x_2|x_2|c~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1e78",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dut|x_8|x_1|x_3|c~combout\,
	datab => \dut|x_7|x_1|x_3|c~combout\,
	datac => \dut|x_6|x_3|x_2|c~1_combout\,
	datad => \dut|x_6|x_2|x_2|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_8|x_3|x_2|c~combout\);

-- Location: LC_X9_Y4_N7
\dut|x_8|x_4|x_2|c\ : maxv_lcell
-- Equation(s):
-- \dut|x_8|x_4|x_2|c~combout\ = (\dut|x_6|x_3|x_2|c~1_combout\ & ((\dut|x_8|x_1|x_3|c~combout\ & ((\dut|x_7|x_1|x_3|c~combout\) # (\dut|x_6|x_2|x_2|c~combout\))) # (!\dut|x_8|x_1|x_3|c~combout\ & (\dut|x_7|x_1|x_3|c~combout\ & 
-- \dut|x_6|x_2|x_2|c~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dut|x_8|x_1|x_3|c~combout\,
	datab => \dut|x_7|x_1|x_3|c~combout\,
	datac => \dut|x_6|x_3|x_2|c~1_combout\,
	datad => \dut|x_6|x_2|x_2|c~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \dut|x_8|x_4|x_2|c~combout\);

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \dut|x_8|x_1|x_1|c~combout\,
	oe => VCC,
	padio => ww_output_vector(0));

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \dut|x_8|x_2|x_2|c~combout\,
	oe => VCC,
	padio => ww_output_vector(1));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \dut|x_8|x_3|x_2|c~combout\,
	oe => VCC,
	padio => ww_output_vector(2));

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \dut|x_8|x_4|x_2|c~combout\,
	oe => VCC,
	padio => ww_output_vector(3));
END structure;


