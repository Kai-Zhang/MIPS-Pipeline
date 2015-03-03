file = open (r'Decode.csv','r')
last_op = ''
ind = ' '
for line in file:
    data = line.split (',')
    if last_op != data[0]:
        ind = '   '
        print ('end')
        last_op = data[0]
        print ("6'b" + str(data[0]) + ':')
        print ('begin')
        if data[1] != 'x':
            print (ind + "6'b" + str(data[1]) + ':')
            print (ind + 'begin')
            ind = '      '
    else:
        print (ind + "6'b" + str(data[1]) + ':')
        print (ind + 'begin')
        ind = '      '
    if data[2] != 'x':
        print (ind + "ALUSrcB = 2'd" + str(data[2]) + ';')
    if data[3] != 'x':
        print (ind + "Ext_op = 1'b" + str(data[3]) + ';')
    if data[4] != 'xxxx':
        print (ind + "ALU_op = 4'b" + str(data[4]) + ';')
    if data[5] != 'x':
        print (ind + "RegDst = 1'b" + str(data[5]) + ';')
    if data[6] != 'x':
        print (ind + "Shift_amountSrc = 1'b" + str(data[6]) + ';')
    if data[7] != 'x':
        print (ind + "Jump = 1'b" + str(data[7]) + ';')
    if data[8] != 'x':
        print (ind + "ALU_Shift_Sel = 1'b" + str(data[8]) + ';')
    if data[9] != 'x':
        print (ind + "Shift_op = 2'd" + str(data[9]) + ';')
    if data[10] != 'x':
        print (ind + "condition = 3'd" + str(data[10]) + ';')
    if data[11] != 'x':
        print (ind + "RegDt0 = 1'b" + str(data[11]) + ';')
    print (ind + "MemWr = 1'b" + str(data[12]) + ';')
    print (ind + "MemtoReg = 1'b" + str(data[13]) + ';')
    ind = '   '
    if 'x' != data[1]:
        print (ind + 'end')
        
