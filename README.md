# Datawow-ruby

HTTP RESTFul for calling DataWow APIs

###### support or question support@datawow.io

# Installation
```ruby
gem 'datawow', '~> 1.3.2'
```

### Rails project

```console
$ rails generate datawow:install
```
The generator will install an initializer which describes ALL of library's configuration options. It is *imperative* that you take a look at it. When you are done, you are ready to call it to any of your codes.

**Note**: Our library work with Rails 4.1 or above

# Usage

To call our module use `Datawow` and follow by class of APIs which we're going to explain what API we have

## Class explanation
These classes it's a instant method that we have prepare to you. You can use our provider or the recommanded way [read](#dynamic_method)
#### Image classe `Datawow.image_*`
There are 4 APIs fo

## instant method
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

#### Prediction classe `Datawow.prediction`
There are 1 API for prediction class

```ruby
Datawow.prediction
```

Those method, it's a shortcut for calling these class
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
## Avalabile method for an APIs
Every classes there are 3 function that is `create`, `find_by` and `all`
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
## Nanameue with Consensus

We have initiated each modules since the library being called, so you could call from package that we provided [here](#class_explanation)
##### Setting project key
```ruby
Datawow.project_key = '_token'
```
##### Start working with provided methods
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


## Dynamically object with many token

If you have many projects to work with. It's not proper to use above example to call our service. If you would like to create an object and change a token ([How to setting token]) dynamically, We perfer to use like above example

```ruby
Datawow::[class].new('_token').create({data: "image URL"})
```
or
```ruby
model = Datawow::[class].new
model.project_key = '_token'
model.create()
```

For available method find in [calling APIs](#calling_apis) section


# Setting default token for rails project

If you have only one token that use on your project, you could config auto append or set token by default. This for Ruby On Rails project.

`config/initializers/datawow.rb`

```ruby
Datawow.setup do |config|
  # ==> Secret key Configuration
  # You can change it below and use your own secret key.
  config.project_key = 'your token'
end
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
