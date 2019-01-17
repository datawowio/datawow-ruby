# Datawow-ruby

HTTP RESTFul for calling DataWow APIs

###### support or question support@datawow.io

# Installation
```ruby
gem 'datawow', '~> 1.3.2'
```

### Rails

```console
$ rails generate datawow:install
```
**Note**: Rails 4.1 or above

# Usage

To call our module, use `Datawow` followed by any of the classes provided in our APIs

## Classes explanation
These classes are instance methods we have created for you. You can use our provider or the recommended methods, [here](#dynamically_token_setting), when using our APIs

#### Image classes `Datawow.image_*`
There are 4 APIs for image class

## instance method
```ruby
Datawow.image_closed_question
Datawow.image_photo_tag
Datawow.image_choice
Datawow.image_message
Datawow.nanameue_human
```
---

#### Video classe `Datawow.video_*`
There is 1 API for video class

```ruby
Datawow.video_classification
```
---
#### Text classe `Datawow.text_*`
There are 3 APIs for text class

```ruby
Datawow.text_closed_question
Datawow.text_category
Datawow.text_conversation
Datawow.text_ja
```

---

#### Prediction classes `Datawow.prediction`
There are 1 API for prediction class

```ruby
Datawow.prediction
```

Above methods are shortcuts for calling the following classes
```ruby
Datawow::ImageClosedQuestion
Datawow::PhotoTag
Datawow::ImageChoice
Datawow::ImageMessage
Datawow::NanameueHuman
Datawow::VideoClassification
Datawow::TextClosedQuestion
Datawow::TextCategory
Datawow::TextConversation
Datawow::TextJa
Datawow::Prediction
```
---
## Available methods in our APIs
There are 3 main functions for each class: `create`, `find_by` and `all`
#### `create`
```ruby
Datawow.[class].create(data: {})
```

#### `find_by`
```ruby
Datawow.[class].find_by({id: "_image_id"})
```

#### `all`
```ruby
Datawow.[class].all()
```


---
## Example

After the library has been called for the first time, the associated modules will be initialized and you could then call using the package name instead. [here](#class_explanation)
##### Setting the project key
```ruby
Datawow.project_key = '_token'
```
##### Working with the methods
#### `create`
```ruby
Datawow.[class].create({data: "image URL"})
```

#### `find_by`
```ruby
Datawow.[class].find_by({id: "_image_id"})
```

#### `all`
```ruby
Datawow.[class].all({page: '_page', per_page: '_per_page'})
```
---


## Dynamically setting the token

If you have many projects, we recommend using the following example instead of the one shown above if you would like to create an object and change its token dynamically

```ruby
Datawow::[class].new('_token').create({data: "image URL"})
```
or
```ruby
model = Datawow::[class].new
model.project_key = '_token'
model.create()
```

For available method, see [calling APIs](#avalabile_method_for_apis) section


# Setting default token for rails project

`config/initializers/datawow.rb`

```ruby
Datawow.setup do |config|
  # ==> Secret key Configuration
  # You can change it below and use your own secret key.
  config.project_key = 'your token'
end
```

# Response

Response is a module and it contains data including: data, meta-data, message, and status
#### Example of a response module
```ruby
<Datawow::Response @status=200, @message="success" @meta={"code"=>200, "message"=>"success"}, @data={...}, />
```
You can call the `data` property to get the data, which would return in the format as shown below

```json
{
  "data": {
    "image": {
      "id": "5a40be59fb9d7f27354c5efa",
      "answer": "approved",
      "credit_charged": 1,
      "custom_id": "custom_id",
      "data": "image_url",
      "postback_url": "postback_url",
      "processed_at": "2017-12-25T16:02:00.599+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Checking status with `successful?`
```ruby
if response.successful?
  # Do stuff
else
  log.error("Request was not successful, something went wrong.")
end
```

# Demo and Usage
 - Image Documentation [link](README/image_docs.md)
 - Video Documentation [link](README/video_docs.md)
 - Text Documentation [link](README/text_docs.md)
 - AI/Prediction Documentation [link](README/ai_docs.md)
