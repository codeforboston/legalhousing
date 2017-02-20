import requests, sys, json, time
from datetime import datetime

class Listing:
    def __init__(self, address, listed_at, latitude, longitude, description, heading):
        self.address = address
        self.listed_at = datetime.fromtimestamp(float(listed_at)).strftime('%Y-%m-%d %H:%M:%S %Z')
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.discriminatory = False
        self.heading = heading

    def to_json(self):
        return {
            'address': self.address,
            'listed_at': self.listed_at,
            'latitude': self.latitude,
            'longitude': self.longitude,
            'description': self.description,
            'heading': self.heading,
            'discriminatory': self.discriminatory
            }

if __name__ == '__main__':
    json_name = sys.argv[1]

    with open(json_name) as f:
        data = json.load(f)

    url = 'https://legalhousing.herokuapp.com/listings'

    for i in range(1000):
        listing = data[i]
        listing_model = Listing(listing['address'], listing['timestamp'], listing['lat'], listing['long'],
            listing['description'], listing['heading'])

        headers = {'content-Type': 'application/json'}
        r = requests.post(url,
            headers=headers,
            json=listing_model.to_json())

    print 'Finished'
