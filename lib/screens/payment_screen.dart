import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class Upi extends StatefulWidget {
  const Upi({super.key});

  @override
  State<Upi> createState() => _UpiState();
}

class _UpiState extends State<Upi> {
  Future<UpiResponse>? _transation;
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _fetchUpiApps();
  }

  Future<void> _fetchUpiApps() async {
    try {
      final value =
          await _upiIndia.getAllUpiApps(mandatoryTransactionId: false);
      setState(() {
        apps = value;
      });
    } catch (e) {
      print("Error fetching UPI apps: $e");
      setState(() {
        apps = [];
      });
    }
  }

  Future<void> _initiateTransaction(UpiApp app) async {
    try {
      _transation = (await initiateTransaction(app)) as Future<UpiResponse>?;
    } catch (e) {
      print("Error initiating transaction: $e");
    }
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    try {
      return await _upiIndia.startTransaction(
        app: app,
        receiverUpiId: "Receiver Upi Id",
        receiverName: "Receive name",
        transactionRefId: "just something",
        transactionNote: "note Anything",
        amount: 23, // Add from cart
      );
    } catch (e) {
      print("Error during transaction: $e");
      // Handle the error as needed, e.g., show an error message to the user.
      throw e;
    }
  }

  Widget display() {
    if (apps == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (apps!.isEmpty) {
      return Center(
        child: Text("No Apps Found"),
      );
    } else {
      return Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Wrap(
            children: apps!.map((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _initiateTransaction(app);
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name)
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.pink[50],
      ),
      body: display(),
    );
  }
}
