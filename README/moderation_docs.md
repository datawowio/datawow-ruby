# Moderation class

We're going to explain about how to and example of usage

# Table of Content
- [How to use](#how-to-use)
- [Create](#create)
- [All](#all)
- [Find by](#find-by)

## How to Use
There are 3 methods available in moderation class (create, all, find_by). Each
method return a response of type `Datawow::Response`, which has two attributes,
`body` and `code`. You can simply access response's body by calling `.body`

### Create
```ruby
Datawow.project_key = YOUR_PROJECT_KEY
params = {
  data: data,
  postback_url: postback_url,
  postback_method: postback_method,
  custom_id: custom_id,
  info: info,
  sandbox: sandbox
}
Datawow.moderation.create(params)
```

Data could be text or image or else according to your project's input type

#### params

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data | string | **Yes** | URL of image |
| postback_url| string| No | URL for answer callback once image has been checked |
| postback_method| string | No | Configuration HTTP method GET POST PUT PATCH |
| custom_id | string | No | Custom ID that used for search |
| info | json | No | Additional info for Document Verification |
| sandbox | boolean | No | Moderate data using sandbox credit |

#### result
```
response = Datawow.moderation.create({
  data: YOUR_DATA,
  custom_id: 'data-1'
})

print(response.body)
```
If you could create moderation successfully, you will receive response like below:

```ruby
{
  "data" => {
    "id" => "5dbab19ebbadfc32kefb56bf",
    "type" => "moderation",
    "attributes" => {
      "custom_id" => "data-1",
      "data" => YOUR_DATA,
      "postback_url" => YOUR_POSTBACK_URL,
      "postback_method" => YOUR_POSTBACK_METHOD,
      "result" => nil,
      "type" => YOUR_PROJECT_INPUT_TYPE, # your project's input type
      "info" => {},
      "created_at" => "2019-10-31T17:04:14.540+07:00",
      "processed_at" => nil,
      "status" => "unprocessed",
      "dataset_id" => nil,
      "id" => "5dbab19ebbadfc32kefb56bf",
      "project_id" => YOUR_PROJECT_ID,
      "sent_postback_yet" => false
    }
  },
  "meta" => {
    "code" => 201,
    "message" => "Created"
  }
}
```

### All
Method `all` is used to retrieve all of your moderations

```ruby
Datawow.project_key = YOUR_PROJECT_KEY
Datawow.moderation.all
```

#### result
```ruby
{
  "data" => [
    {
      "id" => "5dbab19ebbadfc32kefb56bf",
      "type" => "moderation",
      "attributes" => {
        "custom_id" => "data-1",
        "data" => YOUR_DATA,
        "postback_url" => YOUR_POSTBACK_URL,
        "postback_method" => YOUR_POSTBACK_METHOD,
        "result" => {
          "approved" => 0.97
        },
        "type" => YOUR_PROJECT_INPUT_TYPE,
        "info" => {},
        "created_at" => "2019-10-31T17:15:15.302+07:00",
        "processed_at" => "2019-10-31T17:16:15.814+07:00",
        "status" => "processed",
        "dataset_id" => nil,
        "id" => "5dbab19ebbadfc32kefb56bf",
        "project_id" => YOUR_PROJECT_ID,
        "sent_postback_yet" => false
      }
    }
  ],
  "meta" => {
    "code" => 200,
    "message" => "OK"
  }
}
```

Fields `result` and `processed_at` will be present if your data was successfully processed.

### Find by
Method `find_by` is used to find a particular moderation. you can use either its
ID or Custom ID. This method will return only moderation with fully matched ID.

```ruby
Datawow.project_key = YOUR_PROJECT_KEY
id = 'data-1' # or use an ID from creation response (example: '5dbab19ebbadfc32kefb56bf')
Datawow.moderation.find_by(id: id)
```

#### params

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| id | string | **Yes** | ID or Custom ID of a moderation |

#### result
```ruby
{
  "data" => {
    "id" => "5dbab19ebbadfc32kefb56bf",
    "type" => "moderation",
    "attributes" => {
      "custom_id" => "tp-1",
      "data" => YOUR_DATA,
      "postback_url" => YOUR_POSTBACK_URL,
      "postback_method" => YOUR_POSTBACK_METHOD,
      "result" => {
        "approved" => 0.97
      },
      "type" => YOUR_PROJECT_INPUT_TYPE,
      "info" => {},
      "created_at" => "2019-10-31T17:04:14.540+07:00",
      "processed_at" => "2019-10-31T17:05:16.243+07:00",
      "status" => "processed",
      "dataset_id" => nil,
      "id" => "5dbab19ebbadfc32kefb56bf",
      "project_id" => YOUR_PROJECT_ID,
      "sent_postback_yet" => false
    }
  },
  "meta" => {
    "code" => 200,
    "message" => "OK"
  }
}
```
