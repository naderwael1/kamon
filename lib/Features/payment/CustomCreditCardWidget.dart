import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  final Function(CreditCardModel) onCreditCardModelChange;

  CustomCreditCard(
      {required this.onCreditCardModelChange,
      required String cardNumber,
      required String expiryDate,
      required String cardHolderName,
      required String cvvCode,
      required bool isCvvFocused});

  @override
  _CustomCreditCardState createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  final FocusNode cardNumberNode = FocusNode();
  final FocusNode expiryDateNode = FocusNode();
  final FocusNode cardHolderNode = FocusNode();
  final FocusNode cvvNode = FocusNode();

  @override
  void dispose() {
    cardNumberNode.dispose();
    expiryDateNode.dispose();
    cardHolderNode.dispose();
    cvvNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          obscureCardNumber: true,
          obscureCardCvv: true,
          cardBgColor: const Color.fromARGB(255, 7, 105, 150),
          labelCardHolder: 'Card Holder',
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          height: 200,
          width: MediaQuery.of(context).size.width,
          animationDuration: const Duration(milliseconds: 1000),
          onCreditCardWidgetChange: (CreditCardBrand) {},
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CreditCardForm(
            formKey: GlobalKey<FormState>(),
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (CreditCardModel) {
              {
                cardNumber = CreditCardModel.cardNumber;
                expiryDate = CreditCardModel.expiryDate;
                cardHolderName = CreditCardModel.cardHolderName;
                cvvCode = cvvCode;
                showBackView = CreditCardModel.isCvvFocused;
                setState(() {});
              }
              ;
            },
          ),
        ),
      ],
    );
  }
}
