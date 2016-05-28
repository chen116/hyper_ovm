import sys

infile = str(sys.argv[1])
print infile
with open(infile, "r") as ins:
    array = []
    for line in ins:
        array.append(line)
useful_lines =[]
domain_wakes = []
enter_scheduler =[]
formatted_lines = []
domUid = "1"#int(sys.argv[2])
for line in array:
  line = line[0:-1]
  #taking domain_wakes
  if '28004(' in line:
    if line[-5]== domUid and line[-6]== " " and line[-4]== " ":
      domain_wakes.append(line)
      useful_lines.append(line)
  # taking enter_scheduler
  if '2800a(' in line: 
    if line[-5]== domUid and line[-6]== " " and line[-4]== " ":
      enter_scheduler.append(line)
      useful_lines.append(line)
print len(useful_lines)
i=0
match = 0
total_t = 0
formatted_lines=[]
overheads=[]
while i < len(useful_lines):
  if( '28004(' in useful_lines[i]):
    j=i
    while ( j <len(useful_lines) ):
      if( '2800a(' in useful_lines[j] and useful_lines[i][-3]==useful_lines[j][-3] ):
        overhead = float(useful_lines[j][3:14])-float(useful_lines[i][3:14])
        match=match+1
        overheads.append(overhead)
        total_t=total_t+overhead
        formatted_lines.append(useful_lines[i][-5]+' '+useful_lines[i][-3] +'  '+str(overhead))
        break
      else:
        j=j+1
  i=i+1
f = open(str(sys.argv[2]), 'w')
f.write('-total num of scheduling:'+ str(match)+'\n')
f.write('-avg overhead:'+ str(total_t/match)+'\n')
print ('\ntotal num of scheduling:'+ str(match))
print ('avg overhead:'+ str(total_t/match)+'\n')
for line in formatted_lines:
  f.write(line+'\n')


f.close()

