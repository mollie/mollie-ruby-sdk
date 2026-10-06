# ListEntityMethodId

The unique identifier of the payment method. When used during [payment creation](create-payment), the payment
method selection screen will be skipped.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ListEntityMethodId::ALMA

# Open enum: use .deserialize() to create instances from custom string values
custom = ListEntityMethodId.deserialize("custom_value")
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `ALMA`         | alma           |
| `APPLEPAY`     | applepay       |
| `BACS`         | bacs           |
| `BANCOMATPAY`  | bancomatpay    |
| `BANCONTACT`   | bancontact     |
| `BANKTRANSFER` | banktransfer   |
| `BELFIUS`      | belfius        |
| `BILLIE`       | billie         |
| `BILLINK`      | billink        |
| `BIZUM`        | bizum          |
| `BLIK`         | blik           |
| `CREDITCARD`   | creditcard     |
| `DIRECTDEBIT`  | directdebit    |
| `EPS`          | eps            |
| `GIFTCARD`     | giftcard       |
| `GOOGLEPAY`    | googlepay      |
| `IDEAL`        | ideal          |
| `IN3`          | in3            |
| `KBC`          | kbc            |
| `KLARNA`       | klarna         |
| `MBWAY`        | mbway          |
| `MOBILEPAY`    | mobilepay      |
| `MULTIBANCO`   | multibanco     |
| `MYBANK`       | mybank         |
| `PAYBYBANK`    | paybybank      |
| `PAYPAL`       | paypal         |
| `PAYSAFECARD`  | paysafecard    |
| `PRZELEWY24`   | przelewy24     |
| `RIVERTY`      | riverty        |
| `SATISPAY`     | satispay       |
| `SWISH`        | swish          |
| `TRUSTLY`      | trustly        |
| `TWINT`        | twint          |
| `VIPPS`        | vipps          |
| `VOUCHER`      | voucher        |
| `WERO`         | wero           |