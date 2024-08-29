# Open the file in read mode
with open("ingestionFiles/allmodels.txt", "r") as f:
    # Read the entire content of the file
    data = f.read()
# Split the content by newline character
lines = data.split('\n')
lines=lines[:-2]
executionCommand="DROP DATAVERSE Heterog;\nCREATE DATAVERSE Heterog;\nUSE Heterog;\n"
# Print each line separately
for line in lines:
    #CREATE TYPE Dns AS{
    #  _path:string?
    #};
    print(line)
    executionCommand+="CREATE TYPE "+line+ " AS{\n _path:string?\n};\n"
    #create external dataset Dns(Dns) 
    # using localfs
    # (
    #     ("path"="127.0.0.1:///Users/skamboj2022/Downloads/ERSP/zed-usability-testing/Hybrid/siya/AsterixDB/ingestionFiles/heterogeneous/Dns.ndjson"),
    #     ("format"="json")
    # );
    executionCommand+=(f'create external dataset {line} ({line})\n using localfs( ("path"="127.0.0.1:///Users/skamboj2022/Downloads/ERSP/zed-usability-testing/Hybrid/siya/AsterixDB/ingestionFiles/heterogeneous/{line}.ndjson"), ("format"="json") );\n')
with open("ingesting.txt", "w") as f:
    f.write(executionCommand)