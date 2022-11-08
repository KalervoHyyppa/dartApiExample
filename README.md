## To Run:

To start server run  `dart run`

Runs on Port 8080

### Make curl requests to the port

`curl -X GET "http://localhost:8080/search?keyWords=iphone&keyWords=apple"`

### Requests that should fail

Missing Keywords:

`curl -X GET "http://localhost:8080/search?author=Bob Smith"`

Only get requests are allowed:

`curl -X POST "http://localhost:8080/search?keyWords=iphone&keyWords=apple"`


## To test:

Run `flutter test`

---

## Assumptions

1. `keyWords` is a required argument
2. 

## What I would spend more time on:

Error Handling:

Probably handle and respond each error to the client versus blanket catches

Word count parser:

Testing:

Write a more comprehensive test suit that captures all edge cases 




