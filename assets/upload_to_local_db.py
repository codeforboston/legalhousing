#command line usage: python script_filename int
#sys.argv[1] is the number of listings to upload to the local database

import requests, sys, json, time
from datetime import datetime

class Listing:
    def __init__(self, address, listed_at, latitude, longitude, description, heading):
        self.address = address
        self.listed_at = listed_at
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
            'discriminatory': self.discriminatory,
            'listed_at': self.listed_at
            }

if __name__ == '__main__':

    j = int(sys.argv[1])

    get_data = requests.get('https://legalhousing.herokuapp.com/listings.json')
    data = json.loads(get_data.content)

    #local database url to post to - change port if necessary
    url = 'http://localhost:3000/listings.json'

    for i in range(j):
        listing = data[i]
        listing_model = Listing(listing['address'], listing['listed_at'], listing['latitude'], listing['longitude'],
        listing['description'], listing['heading'])

        headers = {'content-Type': 'application/json'}
        r = requests.post(url,
            headers=headers,
            json=listing_model.to_json())

    print ('Finished')
