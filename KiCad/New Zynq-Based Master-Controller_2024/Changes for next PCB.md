# Changes to be Implemented for Next Version of PCB

- TX_EN from JX1.20 to U1302.23 (Ethernet PHY KSZ8081MNX) must be same length as TXD signals for optimum performance.
- All TX signals from JX1 and JX3 to U1302 must be impedance-matched to 50 Ω (single-ended).

- A larger filter IC should be found for the USB lines.
- USB lines must be impedance-matched to 90 Ω (differential).

- A larger filter IC should be found for the SDIO lines.
- SDIO lines must be impedance-matched to 50 Ω (single-ended).

- RC filters from PROFET current measurements to JX2 must be placed close to JX2.

- 12 V ESD diodes must be placed by the CMC connector for all connections with the expansion board.
- A high-frequency RC filter must be placed by AUX14 on JX2, which connects to the expansion board.

- A 1 µF capacitor must be placed near the CMC connector for all sensor supply connections.

- Tests should be performed to understand whether the components added for EMC are sufficient.
- Tests should be performed to understand whether Sallen-Key filter accuracies are sufficient, or would improve by supplying with 12 V and placing them before the voltage dividers. Additionally, placing them close to the CMC may result in better performance than close to the JX header, and vice versa.
- The operational amplifiers used for the Sallen-Key filters may not be good enough, and the footprint-compatible MCP607T may be used instead.

- Make markings for coin cell battery positive and negative pins.
- Adjust coin cell battery footprint to both allow for rechargeable and non-rechargeable battery (rechargeable has one pin that is larger).

- Add silk screen text for Steering Wheel voltage divider pin header.

- Make wide traces on both upper and lower layer for for example Shutdown Circuit and PROFET outputs.
