set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports { clk }]; # 100MHz

set_property -dict { PACKAGE_PIN R2 IOSTANDARD LVCMOS33 PULLUP TRUE } [get_ports { rst }];

## Valeurs à afficher, LEDs
set_property -dict { PACKAGE_PIN U16  IOSTANDARD LVCMOS33 } [get_ports { leds[0] }];
set_property -dict { PACKAGE_PIN E19  IOSTANDARD LVCMOS33 } [get_ports { leds[1] }];
set_property -dict { PACKAGE_PIN U19  IOSTANDARD LVCMOS33 } [get_ports { leds[2] }];
set_property -dict { PACKAGE_PIN V19  IOSTANDARD LVCMOS33 } [get_ports { leds[3] }];
set_property -dict { PACKAGE_PIN W18  IOSTANDARD LVCMOS33 } [get_ports { leds[4] }];
set_property -dict { PACKAGE_PIN U15  IOSTANDARD LVCMOS33 } [get_ports { leds[5] }];
set_property -dict { PACKAGE_PIN U14  IOSTANDARD LVCMOS33 } [get_ports { leds[6] }];
set_property -dict { PACKAGE_PIN V14  IOSTANDARD LVCMOS33 } [get_ports { leds[7] }];

## Debug LEDS
set_property -dict { PACKAGE_PIN V13  IOSTANDARD LVCMOS33 } [get_ports { debug_leds[0] }];
set_property -dict { PACKAGE_PIN V3  IOSTANDARD LVCMOS33 } [get_ports { debug_leds[1] }];
set_property -dict { PACKAGE_PIN W3  IOSTANDARD LVCMOS33 } [get_ports { debug_leds[2] }];
set_property -dict { PACKAGE_PIN U3  IOSTANDARD LVCMOS33 } [get_ports { debug_leds[3] }];
set_property -dict { PACKAGE_PIN P3  IOSTANDARD LVCMOS33 } [get_ports { debug_leds[4] }];
set_property -dict { PACKAGE_PIN N3  IOSTANDARD LVCMOS33 } [get_ports { debug_leds[5] }];
set_property -dict { PACKAGE_PIN P1  IOSTANDARD LVCMOS33 } [get_ports { debug_leds[6] }];
set_property -dict { PACKAGE_PIN L1  IOSTANDARD LVCMOS33 } [get_ports { debug_leds[7] }];

## clk_debug
#set_property -dict { PACKAGE_PIN L1  IOSTANDARD LVCMOS33 } [get_ports { clk_debug }];

## Segmeents 7 segments (seg[6:0] = {a,b,c,d,e,f,g})
set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports { segments[6] }]; # a
set_property -dict { PACKAGE_PIN W6   IOSTANDARD LVCMOS33 } [get_ports { segments[5] }]; # b
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports { segments[4] }]; # c
set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports { segments[3] }]; # d
set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports { segments[2] }]; # e
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports { segments[1] }]; # f
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports { segments[0] }]; # g

## Anodes 7 segments
set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports { anodes[0] }];
set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports { anodes[1] }];
set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports { anodes[2] }];
set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports { anodes[3] }];

## Interrupteurs
## On utilise que les 8 premiers
set_property -dict { PACKAGE_PIN V17  IOSTANDARD LVCMOS33 } [get_ports { sw[0] }];
set_property -dict { PACKAGE_PIN V16  IOSTANDARD LVCMOS33 } [get_ports { sw[1] }];
set_property -dict { PACKAGE_PIN W16  IOSTANDARD LVCMOS33 } [get_ports { sw[2] }];
set_property -dict { PACKAGE_PIN W17  IOSTANDARD LVCMOS33 } [get_ports { sw[3] }];
set_property -dict { PACKAGE_PIN W15  IOSTANDARD LVCMOS33 } [get_ports { sw[4] }];
set_property -dict { PACKAGE_PIN V15  IOSTANDARD LVCMOS33 } [get_ports { sw[5] }];
set_property -dict { PACKAGE_PIN W14  IOSTANDARD LVCMOS33 } [get_ports { sw[6] }];
set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS33 } [get_ports { sw[7] }];
set_property -dict { PACKAGE_PIN V2   IOSTANDARD LVCMOS33 } [get_ports { sw[8] }];
set_property -dict { PACKAGE_PIN T3   IOSTANDARD LVCMOS33 } [get_ports { sw[9] }];
set_property -dict { PACKAGE_PIN T2   IOSTANDARD LVCMOS33 } [get_ports { sw[10] }];
set_property -dict { PACKAGE_PIN R3   IOSTANDARD LVCMOS33 } [get_ports { sw[11] }];
set_property -dict { PACKAGE_PIN W2   IOSTANDARD LVCMOS33 } [get_ports { sw[12] }];
set_property -dict { PACKAGE_PIN U1   IOSTANDARD LVCMOS33 } [get_ports { sw[13] }];
set_property -dict { PACKAGE_PIN T1   IOSTANDARD LVCMOS33 } [get_ports { sw[14] }];
set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS33 } [get_ports { sw[15] }];