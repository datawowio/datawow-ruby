# Datawow-ruby

HTTP RESTFul for calling DataWow APIs

###### support or question support@datawow.io

# Installation
```ruby
gem 'datawow', '~> 0.0.2'
```

#### Generate setting

```console
$ rails generate datawow:install
```
The generator will install an initializer which describes ALL of library's configuration options. It is *imperative* that you take a look at it. When you are done, you are ready to call it to any of your codes.

**Note**: Our library work with Rails 4.1 or above

# Usage

To call our module use `Datawow` and follow by class of APIs which we're going to explain what API we have

## Class explanation
#### Image classe `Datawow.image_*`
There are 4 APIs for image class

```ruby
Datawow.image_closed_question
Datawow.image_photo_tag
Datawow.image_choice
Datawow.image_message
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
```
---

#### Prediction classe `Datawow.prediction`
There are 1 API for prediction class

```ruby
Datawow.prediction
```
---
## Calling APIs
Every classes there are 3 function that is `create`, `find_by` and `all`
#### `create`
```ruby
Datawow.[class].create({data: "image URL", token: '_token'})
```

#### `find_by`
```ruby
Datawow.[class].find_by({id: "_image_id", token: '_token'})
```

#### `all`
```ruby
Datawow.[class].all({token: '_token'})
```

# Setting default token

If you have only one token that use on your project, you could config auto append or set token by default. This for Ruby On Rails project.

`config/initializers/datawow.rb`

```ruby
Datawow.setup do |config|
  # ==> Secret key Configuration
  # You can change it below and use your own secret key.
  config.project_key = 'your token'
end
```

After configuration has been set. You can calling APIs by not insert token like this
```ruby
Datawow.[class].create({data: "image URL"})
```
The system will be looking for your token by automatically

# Response

Response is a module and it contain such as meta-data, message, status and data.
#### Example of response module
```ruby
<Datawow::Response @status=200, @message="success" @meta={"code"=>200, "message"=>"success"}, @data={...}, />
```
you can use data whit calling `data` property and you will be get data like a example below

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
