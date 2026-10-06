# Totals

Totals are grouped according to the chosen grouping rule. The example response should give a good idea of what a
typical grouping looks like.

If grouping `status-balances` is chosen, the main grouping is as follows:

* `pendingBalance` containing an `open`, `pending`, `movedToAvailable`, and `close` sub-group
* `availableBalance` containing an `open`, `movedFromPending`, `immediatelyAvailable`, and `close` sub-group

If grouping `transaction-categories` is chosen, the main grouping is as follows:

* `open` and `close` groups, each containing a `pending` and `available` sub-group
* Transaction type groups such as `payments`, `refunds`, `chargebacks`, `capital`, `transfers`, `fee-prepayments`, `corrections`, `topups`
each containing a `pending`, `movedToAvailable`, and
`immediatelyAvailable` sub-group

Each sub-group typically has:

* An `amount` object containing the group's total amount
* A `count` integer if relevant (for example, counting the number of refunds)
* A `subtotals` array containing more sub-group objects if applicable


## Fields

| Field                                                                                      | Type                                                                                       | Required                                                                                   | Description                                                                                |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| `pending_balance`                                                                          | [T.nilable(Models::Components::PendingBalance)](../../models/shared/pendingbalance.md)     | :heavy_minus_sign:                                                                         | The pending balance. Only available if grouping is `status-balances`.                      |
| `available_balance`                                                                        | [T.nilable(Models::Components::AvailableBalance)](../../models/shared/availablebalance.md) | :heavy_minus_sign:                                                                         | The available balance. Only available if grouping is `status-balances`.                    |
| `open`                                                                                     | [T.nilable(Models::Components::Open)](../../models/shared/open.md)                         | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `close`                                                                                    | [T.nilable(Models::Components::Close)](../../models/shared/close.md)                       | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `payments`                                                                                 | [T.nilable(Models::Components::Payments)](../../models/shared/payments.md)                 | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `refunds`                                                                                  | [T.nilable(Models::Components::Refunds)](../../models/shared/refunds.md)                   | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `chargebacks`                                                                              | [T.nilable(Models::Components::Chargebacks)](../../models/shared/chargebacks.md)           | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `capital`                                                                                  | [T.nilable(Models::Components::Capital)](../../models/shared/capital.md)                   | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `transfers`                                                                                | [T.nilable(Models::Components::Transfers)](../../models/shared/transfers.md)               | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `fee_prepayments`                                                                          | [T.nilable(Models::Components::FeePrepayments)](../../models/shared/feeprepayments.md)     | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `corrections`                                                                              | [T.nilable(Models::Components::Corrections)](../../models/shared/corrections.md)           | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |
| `topups`                                                                                   | [T.nilable(Models::Components::Topups)](../../models/shared/topups.md)                     | :heavy_minus_sign:                                                                         | Only available on `transaction-categories` grouping.                                       |