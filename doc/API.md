# Client API

## Authorization

Use Basic HTTP Authorization with API_KEY
Send default login=qwerty1234567890

## Create a user

    GET /create_user

### Input (url params)

Any information provided in the body will be stored for the user. Like for example:

Example: http://localhost:8888/create_user/?email=deafultmail@gmail.com

Name | Type | Description
-----|------|--------------
`email`|`string` | user email.

### Response

``` json
{
  "message": "new user recorded 1",
  "user_id": 1
}
```

## Retrieve all users

    GET /get_users

Example: http://localhost:8888/get_users

### Response

``` json
{
  "users": {
    "1": {
      "email": "admin@example.com"
    }
  }
}
```

## Retrieve user

    GET /get_user/<em>:id</em>

Example: http://localhost:8888/get_user/1

### Response

``` json
{
  "email": "admin@example.com"
}
```

## Update user

    GET /update_user/

Example: http://localhost:8888/update_user/?id=1&email=defaultemail@gmail.com

### Input (request url params)

Any information provided in the body will be stored for the user.

### Response

``` json
{
  "message": "user updated 1",
  "user_id": 1
}
```

## Delete user

    GET /delete_user/<em>:id</em>

    Example: http://localhost:8888/delete_user/1

### Response

``` json
{
  "message": "user deleted 1",
  "user_id": 1
}
```
