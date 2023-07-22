import json

class Assembler:
    def __init__(self, input_path = "code.txt", output_path = "output.text", mode = "memory", instance = "/ram/ram") :

        # Setting the Commands into map to use them
        self.commands = {
        "ADD" : "0000001", "INC" : "0000011", "SUB" : "0001001",
        "AND" : "0001101", "NOT" : "0010001", "MOV" : "0010101", "IN" : "0011000",
        "OUT" : "0011001", "IADD" : "0100000", "LDM" : "0110101", "LDD" : "0100010", "STD" : "0100011",
        "JZ" : "1010100", "JN" : "1010101", "JC" : "1010110", "JMP" : "1010111",
        "NOP" : "1101000", "HLT" : "1100001", "SETC" : "1100010", "PUSH" : "1110010",
        "POP" : "1110101", "CALL" : "1111010", "RET" : "1111100", "INT" : "1111110", "RTI" : "1111100"
        }

        self.register_addresses = {
            "r0" : "000",
            "r1" : "001",
            "r2" : "010",
            "r3" : "011",
            "r4" : "100",
            "r5" : "101",
            "r6" : "110",
            "r7" : "111"
        }

        self.memory_size = 1048576
        self.mode = mode
        self.instance = instance
        self.instructinons = []
        self.integrate(input_path, output_path)
    
    def seperate_instruction(self, command : str):
        '''
        This Function is used to seperate the instruction into Command and Operands
        Ex: MOV 000, 001
        NOTE: Seperation can be either by Space, or by Comma 

        Return: Command as splitted to list
        '''
        command_splitted : list = command.replace(',', ' ').split() # list of strings

        if len(command_splitted) == 0:
            return []

        if command_splitted[0].upper() != '.ORG': # Converting to List String if not ORG

            try: # The Try Except Handles if the first operand is Number
                # Parse the first Item into the OPERAND
                command_splitted[0] = self.commands[command_splitted[0].upper()]
            except:
                pass
            
        return command_splitted
    
    def generate_binary(self, command_as_list : list):

        # Double Check if the input is 1 String, without being HLT, NOP, SETC, RET, Or RTI
        # Convert to Hexa and return it
        if len(command_as_list) == 1 and command_as_list[0].upper() not in [self.commands['HLT'], self.commands['NOP'], self.commands['SETC'], self.commands["RET"], self.commands["RTI"]]:
            command = command_as_list[0].replace("\n", "")
            hexa_int = int(command, 16)
            binary  = binary = bin(hexa_int)
            padded_binary = binary[2:].zfill(16) + '\n'
            return padded_binary

        # Otherwise: Not Number Not .ORG
        operand = command_as_list[0]

        # Check for Operand
        if operand in [self.commands['AND'], self.commands['SUB'], self.commands['ADD']]:
            return command_as_list[0] + self.check_operand(command_as_list[1]) + self.check_operand(command_as_list[2]) + self.check_operand(command_as_list[3]) + " \n"
        
        elif operand in [self.commands['INC'], self.commands['NOT']]:
            return command_as_list[0] + self.check_operand(command_as_list[1]) + "000000" + " \n"
        
        elif operand in [self.commands['MOV']]:
            return command_as_list[0] + self.check_operand(command_as_list[1]) + self.check_operand(command_as_list[2]) + "000" + " \n"

        elif operand in [self.commands["JZ"], self.commands["JN"], self.commands["JC"], self.commands["JMP"], self.commands["OUT"], self.commands["PUSH"], self.commands["CALL"]]:
            return command_as_list[0] + "000" + self.check_operand(command_as_list[1]) + "000" + " \n"
        
        elif operand in [self.commands["NOP"], self.commands["HLT"], self.commands["SETC"], self.commands["RET"], self.commands["RTI"]]:
            return command_as_list[0] + "000000000" + " \n"
        
        elif operand in [self.commands['POP'],  self.commands['IN']]: # Register
            return command_as_list[0] + self.check_operand(command_as_list[1]) + "000000" + " \n"

        elif operand in [self.commands['INT']]: # Register
            addresses = {
                "0" : "000",
                "1" : "001",
                "2" : "010"
            }
            return command_as_list[0] + addresses[command_as_list[1]] + "000000" + " \n"
        
        elif operand in [self.commands["IADD"]]:
            return command_as_list[0] + self.check_operand(command_as_list[1]) + self.check_operand(command_as_list[2]) + "000" + self.check_operand(command_as_list[3])
        
        elif operand == self.commands["LDM"] : 
            return command_as_list[0] + self.check_operand(command_as_list[1]) + "000" + "000" + self.check_operand(command_as_list[2]) 
        
        elif operand in [self.commands["STD"], self.commands["LDD"]] : 
            return command_as_list[0] + "000" + self.check_operand(command_as_list[1]) + self.check_operand(command_as_list[3]) + self.check_operand(command_as_list[2])
        
        return "xxxxxxxxxxxxxxxx" + " \n"
    
    def read_code_file(self, path):
        file = open(path, 'r')

        instructions = [line for line in file]

        file.close()

        return instructions

    def assemble(self, output_path, binary_instructions : list):

        file = open(output_path, 'w')

        if self.mode == 'memory' :
            file.write("// memory data file (do not edit the following line - required for mem load use) \n")
            file.write(f"// instance={self.instance} \n")
            file.write("// format=mti addressradix=d dataradix=b version=1.0 wordsperline=1 \n")
        
        for index, ins in enumerate(binary_instructions):
            if self.mode == 'memory':
                file.write(f"{index}: ")

            file.write(ins)
        file.close()
    
    def integrate(self, input_path, output_path):
        
        # Read Instructions:
        instructions = self.read_code_file(input_path)

        binary_instructions = ['0000000000000000\n'] * self.memory_size

        index = 0

        for instruction in instructions:

            if instruction[0] == '#': # Handle Comments to be not assembled
                continue

            # If not Comment [instruction: Line String]
            instruction = instruction.replace('(', ',')
            instruction = instruction.replace(')', '')
            seperated_instruction = self.seperate_instruction(instruction)
            # Seperated Instruction: List of Strings for operands, and operators

            if seperated_instruction == []:
                continue

            if seperated_instruction[0].lower() == '.org': # Check if first Operand is .ORG
                index = int(seperated_instruction[1], 16) # If Org: Read the second Operand as the index

            else: # If not Org
                if len(seperated_instruction) == 1 and seperated_instruction[0] not in [self.commands['HLT'] , self.commands['NOP'], self.commands['SETC'], self.commands["RET"], self.commands["RTI"]]:
                    try: # Numeric Insturction
                        hexa_command = instruction
                        hexa = int(hexa_command, 16)
                        hex_as_binary = bin(hexa)
                        padded_binary = hex_as_binary[2:].zfill(16) + '\n'
                        binary_instructions[index] = padded_binary
                        index += 1
                    except:
                        pass

                else: # Neither Org, or 1 Hexa Operand
                    
                    # Generate the Binary from the Operand
                    binary_instruction = self.generate_binary(seperated_instruction)
                    if len(binary_instruction) > 20:
                        binary_instructions[index] = binary_instruction[0:16] + "\n"
                        binary_instructions[index + 1] = binary_instruction[16:32] + "\n"
                        index += 2

                    else:
                        binary_instructions[index] = binary_instruction
                        index += 1
                
            
        self.assemble(output_path, binary_instructions)
    

    def check_operand(self, operand):
        # Check if Register:
        if operand[0].lower() == 'r':
            return self.register_addresses[operand.lower()]
        else:
            hexa = int(operand, 16)
            hex_as_binary = bin(hexa)
            padded_binary = hex_as_binary[2:].zfill(16) + '\n'
            return str(padded_binary)

        

        
if __name__ == '__main__' : 
    file = open('configurations.json')

    configurations = json.load(file)
    
    assembler = Assembler(configurations["input_path"], configurations["output_path"], configurations["mode"], configurations["instance"])