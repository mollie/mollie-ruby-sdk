# AccountDetails

The account holder details and bank account information for the business account.


## Fields

| Field                                                        | Type                                                         | Required                                                     | Description                                                  | Example                                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `account_holder_name`                                        | *::String*                                                   | :heavy_check_mark:                                           | The name of the account holder.                              | Mollie B.V.                                                  |
| `name`                                                       | *T.nilable(::String)*                                        | :heavy_minus_sign:                                           | A name of the account.                                       | Main Checking Account                                        |
| `currency`                                                   | *::String*                                                   | :heavy_check_mark:                                           | The currency of the account in ISO 4217 format.              | EUR                                                          |
| `iban`                                                       | *::String*                                                   | :heavy_check_mark:                                           | The IBAN (International Bank Account Number) of the account. | NL95MLLE1234567890                                           |
| `bic`                                                        | *T.nilable(::String)*                                        | :heavy_minus_sign:                                           | The BIC (Bank Identifier Code) of the account.               | MLLENL2AXXX                                                  |