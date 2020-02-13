# Envoy-App

This is an app for seeing the closest coffee shops to Envoy HQ using Foursquare. 

## Installation

run `pod install` in the directory to install Cocoapods (dependencies). 

## Notes

Foursquare doesn't return photos in the `/venues/search` endpoint. Therefore in order to see the photo, you have to tap the cell. I thought that was a better solution instead of making a request for each location. 

Not all listings have a location. Here's what Foursquare says about it: 

> Note that most of the fields returned inside a venue can be optional. The user may create a venue that has no address, city, or state (the venue is created instead at the lat/long specified) - https://developer.foursquare.com/docs/api/venues/search

