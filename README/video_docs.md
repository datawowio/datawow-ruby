## Videos class
  
We're going to explant about parameter for creation and example of use

# Table of Content
- [Video classification class](#video-classification-class)
- [Common function](#common-function)

## Video Classification class
Description: Video classification - Answer can be only approved, declined or ban
### Create
```ruby
params = { ..., token: '_token' }
Datawow.video_classification.create(params)
```

#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data     | 	string | **Yes** |URL of Video|
| play_at | float |No |Setting video start time|
| allow_seeking |bool| No |Allow seeking video player (default `true`)|
|muted |bool|No| Mute video on start (default: `true`)|
| postback_url	     | string      | No | URL for answer callback once video has been checked|
| postback_method     | 	string | No |Configuration HTTP method GET POST PUT PATCH|
| custom_id	     | string      |   No |Custom ID that used for search|

---
# Common function
For every classes there are common functions to get list of data and find by ID. We're going to show you how to use it.

## Query list of data by  `all()`

```ruby
params = { ..., token: '_token' }
Datawow.[model].all(params)
```
#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| page     | 	interger | No | default 0|
| per_page 	     | string      | No | default 20 |


## Find data with ID by  `find_by()`
```ruby
params = { id: '_id', token: '_token' }
Datawow.[model].find_by(params)
```
#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string  |   **Yes** | Video's ID or custom ID which is you were assigned|
