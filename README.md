# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.3.6

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Instruction
Make a Rails App that can accept GPS waypoints associated to a vehicle, and then show them in a map

# The problem
Write a rails app that can accept GPS waypoints associated to a vehicle, and then show them in a map. 
A GPS waypoint represents a location based on a latitude/longitude pair, and a point in time. 
A vehicle is represented by a unique alphanumeric identifier, and can have multiple GPS waypoints.

Specifically, the app consists of the following endpoints:

- A JSON API endpoint named /api/v1/gps that accepts GPS waypoints associated to a vehicle. The following format must be used:
```json
{
  "latitude": 20.23,
  "longitude": -0.56,
  "sent_at": "2016-06-02 20:45:00",
  "vehicle_identifier": "HA-3452"
}
```
If no vehicle exists with that identifier, create it.

- An HTML endpoint named /show that shows for all vehicles their **most recent coordinate** in a map (choose any map provider you want, such as Google Maps, Open Street Map, Bing Maps, Mapbox, etc.).

# Things to consider
1. All historical waypoints must be stored.
2. No authentication is required for the endpoints.
3. Waypoints received through the API must be processed in a background job processing framework.
4. Display (position and name) and filter vehicles on the map using React as a frontend library.


# Recommended configuration
- Ruby >= 2.5.2
- Ruby on Rails >= 6
- Postgres database
- Sidekiq
- Redis
- Docker && Docker-Compose
- Google Maps API

# Instructions
1. Run
```bash
bundle install
yarn install
```
2. Generate key
```bash
VISUAL="code --wait" bin/rails credentials:edit
```
This will generate a key located in `config/master.key`
2. Create an .env file with
```bash
POSTGRES_HOST=db
POSTGRES_DB=vehicle_map
POSTGRES_USER=user
POSTGRES_PASSWORD=strongpassword
RAILS_ENV=production
REDIS_URL=redis://redis:6379/0
SECRET_KEY_BASE="RAILS KEY GENERATED IN STEP 2"
GOOGLE_MAPS_API_KEY="GOOGLE API KEY"
```
3. Run docker compose
```bash
docker compose up -d
```

# Features

- Endpoint POST `/api/v1/gps` to save waypoints
- Endpoint HTML `/show` to see waypoints on the map
