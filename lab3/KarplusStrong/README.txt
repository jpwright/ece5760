DE2_Default
-----------

This design is the initial design when the board is powered-up. It increments a counter and displays the value on the
7-segment displays and LEDs. An image is also displayed on the VGA port.

Running the Design
------------------

1) Launch the Quartus II software.
2) Open the DE2_Default.qpf project located in the <install path>\DE2_Default folder. (File menu -> Open Project)
3) Open the Programmer window. (Tools menu -> Programmer)
4) The DE2_Default.sof programming file should be listed.
   Check the 'Program/Configure' box and set up the JTAG programming hardware connection via the 'Hardware Setup' button.
5) Press 'Start' to start programming. The design should now be programmed and running.

User Inputs to the Design
-------------------------

None.

Compiling the Design
--------------------

1) Launch the Quartus II software.
2) Open the DE2_Default.qpf project located in the <install path>\DE2_Default folder. (File menu -> Open Project)
3) Start compilation. (Processing -> Start Compilation)
4) After compilation is finished, you can run the design with the generated SOF file. See 'Running the Design' above.
