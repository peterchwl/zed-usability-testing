import json

heterogeneous = ["conn", "dce_rpc", "dns", "dpd", "files", "ftp", "http", "kerberos", "modbus", "notice", "ntlm", "ntp",
                 "pe", "rdp", "smb_files", "smb_mapping", "smtp", "snmp", "ssh", "ssl", "syslog", "weird", "x509"]

path = 'C:\\ucsd\\Winter-2024\\CSE 198\\zed-usability-testing\\DataSet\\heterogeneous.ndjson'


# Function to check if an element exists in the ndjson file
def element_exists(element):
    with open(path, 'r') as file:
        for line in file:
            data = json.loads(line)
            if data["_path"] == element:
                return True
    return False


# Check if each element exists in the file
for element in heterogeneous:
    if element_exists(element):
        print(f"{element} exists in the file")
    else:
        print(f"{element} does not exist in the file")

'''
homogeneous_path = 'C:\\ucsd\\Winter-2024\\CSE 198\\zed-usability-testing\\' \
                   'JSON\\Querying\\brandon\\homogeneous\\analy1.txt'

heterogeneous_path = 'C:\\ucsd\\Winter-2024\\CSE 198\\zed-usability-testing\\' \
                     'JSON\\Querying\\brandon\\heterogeneous\\analy1.txt'

with open(heterogeneous_path, 'r') as file:
    # Read all lines from the file
    lines = file.readlines()

# Process the lines and save into a list
data_list = [line.strip() for line in lines]
data_list = [element.strip('"[],') for element in data_list]
data_list = [item for item in data_list if item != '']

# Print the list to verify
print(data_list)
'''
