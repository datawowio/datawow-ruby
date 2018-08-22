# Table of Content
- [How to use it](#create)
#### [Type of AI](#response-of-each-type-ai)
- [Standard Criteria](#standard-criteria)
- [Nudity/Sexual](#nuditysexual)
- [Demographic](#demographic)
- [Standard Criteria & Human](#standard-criteria--human)
- [Common function](#common-function)

### Prediction Images (AI Beta / 95% accuracy)
 - [nanameue]Standard Criteria (~1 min)
 - [sexual]Nudity/Sexual (~1 min)
 - [demographic]Demographic (~3 mins)
 - [ai_human]Standard Criteria & Human

#### Create prediction
**Note**: For creation of prediction, a type of AI will be separated by token. Once, you sent request to server your token will be used for find AI'type automatically and you will get response upon your token type 

```ruby
params = { ..., token: '_token' }
Datawow.prediction.create(params)
```
#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      | No | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

## Response of each type AI
#### [nanameue]Standard Criteria (~1 min)
```json
{
  "data": {
    "id": "5a41c388aa05617baa283457",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "processing"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### [sexual]Nudity/Sexual (~1 min)
```json
{
  "data": {
    "id": "5a41ce6eaa05617baa2836aa",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "processing"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### [demographic]Demographic (~3 mins)
```json
{
  "data": {
    "id": "5a41d011fb9d7f273a75a62d",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "processing"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### [ai_human]Standard Criteria & Human
```json
{
  "data": {
    "id": "5a41d10efb9d7f27354c8963",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "processing"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
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
| id	     | string  |   **Yes** | Image's ID or custom ID which is you were assigned|
