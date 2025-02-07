import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class RegPageWidget extends StatefulWidget {
  const RegPageWidget({super.key});

  @override
  State<RegPageWidget> createState() => _RegPageWidgetState();
}

class _RegPageWidgetState extends State<RegPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void dispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
    signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFE08A2A),
         leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 2,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: textController,
                      focusNode: textFieldFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Enter Name here',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text('John Mark Madera', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Bunga-Ilaya, Jagna, Bohol', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(''),
                      backgroundColor: Colors.grey[300],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Camera'),
                    ),
                    Signature(
                      controller: signatureController,
                      backgroundColor: Colors.white,
                      height: 120,
                    ),
                    _buildButton('Attendance Slip'),
                    _buildButton('Meal Coupon'),
                    _buildButton('Raffle Ticket'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.blue,
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
