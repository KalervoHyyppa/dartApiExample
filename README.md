## To Run:

To start server run  `dart run`

Runs on Port 8080

### Make curl requests

**Parameters**

1. *keyWords* | REQUIRED | List String
2. *author* | String
3. *maxArticles* | int

`curl -X GET "http://localhost:8080/search?keyWords=iphone&keyWords=apple"`

### Example requests that should fail

Missing parameter *keyWords*:

`curl -X GET "http://localhost:8080/search?author=Bob Smith"`

Only *GET* requests are allowed:

`curl -X POST "http://localhost:8080/search?keyWords=iphone&keyWords=apple"`


## To test:

Run `dart test`





