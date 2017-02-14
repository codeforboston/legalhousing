import requests, sys, json

class Listing:
    def __init__(self, address, listed_at, latitude, longitude, description, discriminatory, heading):
        self.address = address
        self.listed_at = listed_at
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.discriminatory = discriminatory
        self.heading = heading

    def to_json(self):
        return {
            "address": self.address,
            "listed_at": self.listed_at,
            "latitude": self.latitude,
            "longitude": self.longitude,
            "description": self.description,
            "heading": self.heading,
            "discriminatory": self.discriminatory
            }

if __name__ == '__main__':
    json_name = sys.argv[1]

    with open(json_name) as f:
        data = json.load(f)

    url = "https://legalhousing.herokuapp.com/listings/new"

    for i in range(1):
        listing = data[i]
        listing_model = Listing("1 Awesome Ave", "02/07/17", 0, 0,
            listing["description"], "false", listing["heading"])

        headers = {'content-type': 'application/json'}
        r = requests.post(url,headers=headers,
            data=listing_model.to_json())
        print(r.status_code, r.reason)
