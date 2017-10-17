# Legal Housing App

[Legal Housing App](http://legalhousing.herokuapp.com/)

## Status
Currently we have a basic rails app up and running with a small sample dataset of Craigslist postings.

## Purpose of the App
The purpose of the app is to search housing listings in the Boston area to find discriminatory postings.

## How to Contribute
If you wish to contribute to the project please read this README and follow the getting started instructions.

## Getting Started
1. Join the discriminatory housing channel in Slack by selecting Channels and searching for `#discriminatoryhousing`. You should have already joined the Code for Boston slack channel as directed by the [new members set up](http://www.codeforboston.org/new-members/). If you have not done that already do that.
2. Follow the instructions at [install Rails](http://installrails.com) to get Rails working on your local machine. Make sure to install [RVM](https://rvm.io).
3. Clone the repo to your directory.
4. Set up and populate database
```
rails db:
python assets/upload_to_local_db.py 1000
rake db:seed
rake classify_listings:initial_set
```

## License
[MIT License](LICENSE)
