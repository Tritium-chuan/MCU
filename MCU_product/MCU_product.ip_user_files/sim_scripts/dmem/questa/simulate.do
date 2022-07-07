onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dmem_opt

do {wave.do}

view wave
view structure
view signals

do {dmem.udo}

run -all

quit -force
