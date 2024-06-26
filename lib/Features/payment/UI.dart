import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:kamon/Features/payment/CustomCreditCardWidget.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _selectedIndex = 0;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Payment Method'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: const Icon(Icons.money),
                  title: const Text('Cash'),
                  selected: _selectedIndex == 0,
                  onTap: () => _onItemTapped(0),
                ),
                ListTile(
                  leading: const Icon(Icons.credit_card),
                  title: const Text('Credit Card'),
                  selected: _selectedIndex == 1,
                  onTap: () => _onItemTapped(1),
                ),
              ],
            ),
            if (_selectedIndex == 1)
              CustomCreditCard(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                isCvvFocused: isCvvFocused,
                onCreditCardModelChange: (CreditCardModel data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                    isCvvFocused = data.isCvvFocused;
                  });
                },
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment method selection
                  if (_selectedIndex == 0) {
                    // Cash selected
                    print('Cash selected');
                  } else {
                    // Card selected
                    print('Card selected with details:');
                    print('Card Number: $cardNumber');
                    print('Expiry Date: $expiryDate');
                    print('Card Holder Name: $cardHolderName');
                    print('CVV Code: $cvvCode');
                  }
                },
                child: const Text('Confirm Payment Method'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
