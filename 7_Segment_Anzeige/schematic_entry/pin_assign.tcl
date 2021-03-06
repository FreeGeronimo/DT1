###############################################################################
# pin_assign.tcl
#
#
# Autor: Prof. Walter Lindermeir
# 8/08
#
#
# You can run this script from Quartus by observing the following steps:
# 1. Place this TCL script in your project directory
# 2. Open your project
# 3. Go to the View Menu and Auxilary Windows -> TCL console
# 4. In the TCL console type:
#						source pin_assign.tcl
# 5. The script will assign pins and return an "assignment made" message.
###############################################################################
puts "Assigning pins to project ...."
set top_name Seven_Seg_System

########## Set the pin location variables ############
### Control Pins
set clk K17
set reset_n AC9

### PIOs
set button_0 W5
set button_1 W6
set button_2 AB2
set button_3 AB1

set seven_seg_1_a   B18
set seven_seg_1_b   B20
set seven_seg_1_c   A20
set seven_seg_1_d   C20
set seven_seg_1_e   A21
set seven_seg_1_f   B21
set seven_seg_1_g   C21
set seven_seg_1_dot D21

set seven_seg_10_a   A18
set seven_seg_10_b   C18
set seven_seg_10_c   D18
set seven_seg_10_d   A19
set seven_seg_10_e   B19
set seven_seg_10_f   C19
set seven_seg_10_g   E19
set seven_seg_10_dot D19

set led_0 H27
set led_1 H28
set led_2 L23
set led_3 L24
set led_4 J25
set led_5 J26
set led_6 L20
set led_7 L19


#################################
#### Make the PIO pin assignments
set_location -to b0 "Pin_$button_3" 
set_location -to b1 "Pin_$button_2" 
set_location -to b2 "Pin_$button_1" 
set_location -to b3 "Pin_$button_0" 

#################################
#### Make the LED pin assignments

set_location -to x0 "Pin_$led_7" 
set_location -to x1 "Pin_$led_6" 
set_location -to x2 "Pin_$led_5" 
set_location -to x3 "Pin_$led_4" 

set_location -to seg_c "Pin_$seven_seg_1_c"

puts "Assigning pins finished"
