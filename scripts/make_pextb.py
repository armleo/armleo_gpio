import sys

# sys.argv[1] -> dut name
# sys.argv[2] -> dut_pexnetlist
# sys.argv[3] -> tb name
# sys.argv[4] -> output tb name

inside_target = False

with open(sys.argv[2]) as pexfile:
	with open(sys.argv[3]) as tb_file:
		with open(sys.argv[4], "w+") as result_file:
			lines = tb_file.readlines()
			for line in lines:
				if line.startswith(f".subckt {sys.argv[1]} "):
					inside_target = True
					result_file.write(line)
					result_file.write(pexfile.read())
				elif inside_target and line.startswith(".ends"):
					inside_target = False
					result_file.write(line)
				elif inside_target:
					pass # Skip entire inside of target subckt
				else:
					result_file.write(line)
			# write every file to result file
			# if found like that contains ".subckt {top_name}"
			# then copy content of pexspice
			# and read everything to result file
			# iterate thru tb_file until reach .ends
			

def replaceTextBetween(originalText, delimeterA, delimterB, replacementText):
    leadingText = originalText.split(".subckt")[0]
    trailingText = originalText.split(delimterB)[1]

    return leadingText + delimeterA + replacementText + delimterB + trailingText
