# Master-Slave-JK-Flip-Flop

model of stand for student to check the work of MS JK FF trigger with custom element NAND.

created structural, behavioral and process form of MS JK FF trigger, custom NAND with 3 inputs, custom impulse generator, trigger mode observer, and stand for students to test any trigger

* MS_JK_FF.vhd -- MS JK FF behavioral and process form with different delayes from '0' to '1' and from '1' to '0'
* tb_trigger.vhd -- testbench for it

* MS_JK_FF_NAND -- structural for of MS JK FF trigger, using custom made NAND element
* tb_nand_trigger -- testbench for it

* generator.vhd -- custom input signal generator
* observer.vhd -- entity that can detect different modes of trigger, eg toggle, set, reset, storage
* stend.vhd -- stand for students convenience, that collect generator, observer and any trigger and test it (in this example i'm using trigger from MS_JK_FF.vhd) 
