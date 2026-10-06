# EntityPairingCodeDetails

Additional pairing code data, present only when requested via the `include` parameter.


## Fields

| Field                                                                                                    | Type                                                                                                     | Required                                                                                                 | Description                                                                                              |
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `qr_code`                                                                                                | [T.nilable(Models::Components::EntityPairingCodeQrCode)](../../models/shared/entitypairingcodeqrcode.md) | :heavy_minus_sign:                                                                                       | The QR code representation of the pairing code.                                                          |