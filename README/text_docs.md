## Texts class
  
We're going to explant about parameter for creation and example of use

# Table of Content
- [Category class](#category-class)
- [Closed Question class](#closed-question-class)
- [Conversation class](#conversation-class)
- [Common function](#common-function)


## Category class
Description: Classify type in many level of category type
```ruby
params = { ..., token: '_token' }
Datawow.text_category.create(params)
```

|Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| conversation| array of dict|**Yes**| Example: `[{ "name": "...", "message": "..." }]`|
|title|string|**Yes**|Title of conversation|
|allow_empty |bool| |No|Answer can be empty|
|postback_url|string|No|URL for callback|
|postback_method| string|No| Configuration HTTP method GET POST PUT PATCH|
|custom_id| string|No| Custom ID that used for search|


## Closed Question class
Description: Classify inappropriate conversation
```ruby
params = { ..., token: '_token' }
Datawow.text_closed_question.create(params)
```

|Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
|data|string|**Yes**|Stream of text to moderate|
|postback_url|string|No|URL for callback|
|postback_method| string|No| Configuration HTTP method GET POST PUT PATCH|
|custom_id| string|No| Custom ID that used for search|


## Conversation class
Description: Classify conversation
```ruby
params = { ..., token: '_token' }
Datawow.text_conversation.create(params)
```

|Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
|conversation| array of dict|**Yes**| Example: `["foo", "bar"]`|
|custom_conversation_ids|string|**Yes**|Example: `['1','2']`|
|postback_url|string|No|URL for callback|
|postback_method| string|No| Configuration HTTP method GET POST PUT PATCH|
|custom_id| string|No| Custom ID that used for search|

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


## Find data with ID by  `find_id()`
```ruby
params = { id: '_id', token: '_token' }
Datawow.[model].find_by(params)
```
#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string  |   **Yes** | Text's ID or custom ID which is you were assigned|
