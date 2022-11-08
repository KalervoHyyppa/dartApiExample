## To Run:

To start server run  `dart run`

Runs on Port 8080

### Make curl requests

**Parameters**

1. *keyWords* REQUIRED
2. *author*
3. *maxArticles*

`curl -X GET "http://localhost:8080/search?keyWords=iphone&keyWords=apple"`

### Example requests that should fail

Missing parameter *keyWords*:

`curl -X GET "http://localhost:8080/search?author=Bob Smith"`

Only *GET* requests are allowed:

`curl -X POST "http://localhost:8080/search?keyWords=iphone&keyWords=apple"`


## To test:

Run `flutter test`

---

## Assumptions

1. `keyWords` is a required argument
2. Only 1 GET endpoint that will handle all arguments
3. Caching results based on requests vs individual articles

## What I would spend more time on:
For the sake of time, there were some places I didn't fully build out; here are some explanations of what I would do.

**Error Handling:**

Handle and respond each error to the client versus blanket catches. 

**Testing:**

Write a more comprehensive test suit that captures all edge cases.




