import serial           # Import the pyserial module for serial communication
import struct          # Import struct for packing and unpacking binary data
import time            # Import time module (not used in this script)

# Open serial communication on COM8
ComPort = serial.Serial('COM8')  
ComPort.baudrate = 115200  # Set baud rate to 115200
ComPort.bytesize = 8       # Set data bits to 8
ComPort.parity = 'N'       # Set parity to None
ComPort.stopbits = 1       # Set stop bits to 1

# Display instructions to the user
print("Press 'q' to exit the infinite loop at any time")

while True:  
    x = input("Press Enter ")  # Wait for user command
    if x == 'q':  # Check if user wants to exit
        break  
    
    for  i in range(16):
        ot = ComPort.write(struct.pack('h', int(0))) #the current verilog file is coded to recieve input first and then provide output, Altough this user input is not being used anywhere
    time.sleep(0.1)

    it = ComPort.read(16)  # Read the output from FPGA

    # Convert received bytes to integer and print result
    print(f" text : {hex(int.from_bytes(it, byteorder='big'))}")

# Close the serial port after exiting the loop
ComPort.close()  
