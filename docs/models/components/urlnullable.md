# UrlNullable

In v2 endpoints, URLs are commonly represented as objects with an `href` and `type` field.


## Fields

| Field                                                       | Type                                                        | Required                                                    | Description                                                 | Example                                                     |
| ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- |
| `href`                                                      | *T.nilable(::String)*                                       | :heavy_minus_sign:                                          | The actual URL string.                                      | https://...                                                 |
| `type`                                                      | *T.nilable(::String)*                                       | :heavy_minus_sign:                                          | The content type of the page or endpoint the URL points to. | application/hal+json                                        |