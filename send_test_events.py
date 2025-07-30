import json
import random
import time
import requests

# Configuration
API_URL = "https://7a94ak51u0.execute-api.us-east-1.amazonaws.com/prod/busEventProcessorv2"
NUM_EVENTS = 3
DELAY_BETWEEN_EVENTS = 2  # seconds

# If your API requires Cognito Auth, paste your access token here.
# Leave it as None if auth is not required.
ACCESS_TOKEN = None  # Replace with token string if needed

# Send high-priority events
for i in range(NUM_EVENTS):
    breakdown_id = random.randint(1000, 9999)
    payload = {
        "Busbreakdown_ID": breakdown_id,
        "Route_Number": f"TestRoute{i}",
        "Reason": "Mechanical Problem"  # High-priority reason
    }

    headers = {
        "Content-Type": "application/json"
    }
    if ACCESS_TOKEN:
        headers["Authorization"] = f"Bearer {ACCESS_TOKEN}"

    response = requests.post(API_URL, headers=headers, data=json.dumps(payload))
    print(f"[{i+1}] Sent Breakdown ID {breakdown_id}: Status Code {response.status_code}")
    print(response.text)
    time.sleep(DELAY_BETWEEN_EVENTS)
