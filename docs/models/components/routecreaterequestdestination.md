# RouteCreateRequestDestination

The destination of the route.


## Fields

| Field                                                                                     | Type                                                                                      | Required                                                                                  | Description                                                                               | Example                                                                                   |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `type`                                                                                    | [Models::Components::RouteDestinationType](../../models/shared/routedestinationtype.md)   | :heavy_check_mark:                                                                        | The type of destination. Currently only the destination type `organization` is supported. | organization                                                                              |
| `organization_id`                                                                         | *::String*                                                                                | :heavy_check_mark:                                                                        | N/A                                                                                       | org_1234567                                                                               |