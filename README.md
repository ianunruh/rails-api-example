This repository contains a series of changes that makes Rails suitable for use as an API-only web application.

Much of the functional changes are to bring Rails in line with the way that [GitHub](https://developer.github.com)
serves up their API. I use GitHub's API as a reference because it seems to be the most extensive, RESTful API
I've interacted with.

- Disables browser-related middleware and headers
- Forces all errors to be returned as JSON
- Removes anything related to the asset pipeline

More changes are on the way, like:

- API versioning
- Basic OAuth 2.0 authentication and authorization
- User registration
