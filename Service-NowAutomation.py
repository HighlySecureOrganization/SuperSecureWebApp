# Project: Servicenow Automation

# Set the request parameters
url = 'https://redacted.service-now.com/api/now/table/sys_user?sysparm_fields=first_name%2Clast_name%2Cemail%2Chome_phone%2Cstreet%2Ccity%2Cstate%2Czip&sysparm_limit=20'

# Eg. User name="admin", Password="admin" for this code sample.
user = 'Johnathan'
pwd = 'incID2!nts'

# Set proper headers
headers = {"Content-Type": "application/json", "Accept": "application/json"}

# Do the HTTP request
response = requests.get(url, auth=(user, pwd), headers=headers)

# Check for HTTP codes other than 200
if response.status_code != 200:
    print('Status:', response.status_code, 'Headers:', response.headers, 'Error Response:', response.json())
    exit()

# Decode the JSON response into a dictionary and use the data
data = response.json()
print(data)