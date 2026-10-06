# DraftTransferParty

A party involved in the draft transfer, representing either the debtor (sender) or creditor
(recipient). Contains the party's name and account details.


## Fields

| Field                                                                                             | Type                                                                                              | Required                                                                                          | Description                                                                                       | Example                                                                                           |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `full_name`                                                                                       | *::String*                                                                                        | :heavy_check_mark:                                                                                | The full name of the account holder.                                                              | Jan Jansen                                                                                        |
| `account`                                                                                         | [Models::Components::DraftTransferPartyAccount](../../models/shared/drafttransferpartyaccount.md) | :heavy_check_mark:                                                                                | The bank account details of the party.                                                            |                                                                                                   |