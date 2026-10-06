# PayoutStatusReason

The reason for the payout's current status.


## Fields

| Field                                                                                       | Type                                                                                        | Required                                                                                    | Description                                                                                 | Example                                                                                     |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `code`                                                                                      | [Models::Components::PayoutStatusReasonCode](../../models/shared/payoutstatusreasoncode.md) | :heavy_check_mark:                                                                          | A machine-readable code describing the reason for the payout's current status.              | requested                                                                                   |
| `message`                                                                                   | *::String*                                                                                  | :heavy_check_mark:                                                                          | A human-readable description of the status reason.                                          | The payout has been requested.                                                              |