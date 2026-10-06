# Profiles

## Overview

### Available Operations

* [create](#create) - Create profile
* [list](#list) - List profiles
* [get](#get) - Get profile
* [update](#update) - Update profile
* [delete](#delete) - Delete profile
* [get_current](#get_current) - Get current profile

## create

Create a profile to process payments on.

Profiles are required for payment processing. Normally they are created via the Mollie dashboard. Alternatively, you
can use this endpoint to automate profile creation.

### Example Usage: create-profile-201-1

<!-- UsageSnippet language="ruby" operationID="create-profile" method="post" path="/v2/profiles" example="create-profile-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.profiles.create(body: Models::Components::ProfileRequest.new(
  name: 'My website name',
  website: 'https://example.com',
  email: 'test@mollie.com',
  phone: '+31208202070',
  description: 'My website description',
  countries_of_activity: [
    'NL',
    'GB',
  ],
  business_category: 'OTHER_MERCHANDISE'
), idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.profile_response.nil?
  # handle response
end

```
### Example Usage: create-profile-201-2

<!-- UsageSnippet language="ruby" operationID="create-profile" method="post" path="/v2/profiles" example="create-profile-201-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.profiles.create(body: Models::Components::ProfileRequest.new(
  name: 'My website name',
  website: 'https://example.com',
  email: 'test@mollie.com',
  phone: '+31208202070',
  description: 'My website description',
  countries_of_activity: [
    'NL',
    'GB',
  ],
  business_category: 'OTHER_MERCHANDISE'
), idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.profile_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                        | Type                                                                             | Required                                                                         | Description                                                                      | Example                                                                          |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `body`                                                                           | [Models::Components::ProfileRequest](../../models/shared/profilerequest.md)      | :heavy_check_mark:                                                               | N/A                                                                              |                                                                                  |
| `idempotency_key`                                                                | *T.nilable(::String)*                                                            | :heavy_minus_sign:                                                               | A unique key to ensure idempotent requests. This key should be a UUID v4 string. | 123e4567-e89b-12d3-a456-426                                                      |

### Response

**[T.nilable(Models::Operations::CreateProfileResponse)](../../models/operations/createprofileresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 403, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all of your profiles.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-profiles" method="get" path="/v2/profiles" example="list-profiles-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.profiles.list(limit: 50, idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                      | Type                                                                                                                           | Required                                                                                                                       | Description                                                                                                                    | Example                                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ |
| `from`                                                                                                                         | *T.nilable(::String)*                                                                                                          | :heavy_minus_sign:                                                                                                             | Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the<br/>result set. |                                                                                                                                |
| `limit`                                                                                                                        | *T.nilable(::Integer)*                                                                                                         | :heavy_minus_sign:                                                                                                             | The maximum number of items to return. Defaults to 50 items.                                                                   | 50                                                                                                                             |
| `idempotency_key`                                                                                                              | *T.nilable(::String)*                                                                                                          | :heavy_minus_sign:                                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                               | 123e4567-e89b-12d3-a456-426                                                                                                    |

### Response

**[T.nilable(Models::Operations::ListProfilesResponse)](../../models/operations/listprofilesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single profile by its ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-profile" method="get" path="/v2/profiles/{profileId}" example="get-profile-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.profiles.get(profile_id: 'pfl_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.profile_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                               | Type                                                                                                                                                                    | Required                                                                                                                                                                | Description                                                                                                                                                             | Example                                                                                                                                                                 |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `profile_id`                                                                                                                                                            | *::String*                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                      | Provide the ID of the related profile.                                                                                                                                  | pfl_5B8cwPMGnU                                                                                                                                                          |
| `testmode`                                                                                                                                                              | *T.nilable(T::Boolean)*                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                      | You can enable test mode by setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                         |
| `idempotency_key`                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                             |

### Response

**[T.nilable(Models::Operations::GetProfileResponse)](../../models/operations/getprofileresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 410, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Update an existing profile.

Profiles are required for payment processing. Normally they are created and updated via the Mollie dashboard.
Alternatively, you can use this endpoint to automate profile management.

### Example Usage: update-profile-200-1

<!-- UsageSnippet language="ruby" operationID="update-profile" method="patch" path="/v2/profiles/{profileId}" example="update-profile-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.profiles.update(profile_id: 'pfl_5B8cwPMGnU', body: Models::Operations::UpdateProfileRequestBody.new(
  name: 'My new website name',
  website: 'https://example.com',
  email: 'test@mollie.com',
  phone: '+31208202071',
  description: 'My website description',
  countries_of_activity: [
    'NL',
    'GB',
  ],
  business_category: 'OTHER_MERCHANDISE'
), idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.profile_response.nil?
  # handle response
end

```
### Example Usage: update-profile-200-2

<!-- UsageSnippet language="ruby" operationID="update-profile" method="patch" path="/v2/profiles/{profileId}" example="update-profile-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.profiles.update(profile_id: 'pfl_5B8cwPMGnU', body: Models::Operations::UpdateProfileRequestBody.new(
  name: 'My new website name',
  website: 'https://example.com',
  email: 'test@mollie.com',
  phone: '+31208202071',
  description: 'My website description',
  countries_of_activity: [
    'NL',
    'GB',
  ],
  business_category: 'OTHER_MERCHANDISE'
), idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.profile_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         | Example                                                                                             |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `profile_id`                                                                                        | *::String*                                                                                          | :heavy_check_mark:                                                                                  | Provide the ID of the related profile.                                                              | pfl_5B8cwPMGnU                                                                                      |
| `body`                                                                                              | [Models::Operations::UpdateProfileRequestBody](../../models/operations/updateprofilerequestbody.md) | :heavy_check_mark:                                                                                  | N/A                                                                                                 |                                                                                                     |
| `idempotency_key`                                                                                   | *T.nilable(::String)*                                                                               | :heavy_minus_sign:                                                                                  | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                    | 123e4567-e89b-12d3-a456-426                                                                         |

### Response

**[T.nilable(Models::Operations::UpdateProfileResponse)](../../models/operations/updateprofileresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 403, 404, 410, 422, 429       | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## delete

Delete a profile. A deleted profile and its related credentials can no longer be used for accepting payments.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="delete-profile" method="delete" path="/v2/profiles/{profileId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.profiles.delete(profile_id: 'pfl_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426')

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                        | Type                                                                             | Required                                                                         | Description                                                                      | Example                                                                          |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `profile_id`                                                                     | *::String*                                                                       | :heavy_check_mark:                                                               | Provide the ID of the related profile.                                           | pfl_5B8cwPMGnU                                                                   |
| `idempotency_key`                                                                | *T.nilable(::String)*                                                            | :heavy_minus_sign:                                                               | A unique key to ensure idempotent requests. This key should be a UUID v4 string. | 123e4567-e89b-12d3-a456-426                                                      |

### Response

**[T.nilable(Models::Operations::DeleteProfileResponse)](../../models/operations/deleteprofileresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 410, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get_current

Retrieve the currently authenticated profile. A convenient alias of the [Get profile](get-profile)
endpoint.

For a complete reference of the profile object, refer to the [Get profile](get-profile) endpoint
documentation.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-current-profile" method="get" path="/v2/profiles/me" example="get-current-profile-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.profiles.get_current(idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.profile_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                        | Type                                                                             | Required                                                                         | Description                                                                      | Example                                                                          |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `idempotency_key`                                                                | *T.nilable(::String)*                                                            | :heavy_minus_sign:                                                               | A unique key to ensure idempotent requests. This key should be a UUID v4 string. | 123e4567-e89b-12d3-a456-426                                                      |

### Response

**[T.nilable(Models::Operations::GetCurrentProfileResponse)](../../models/operations/getcurrentprofileresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 429                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |