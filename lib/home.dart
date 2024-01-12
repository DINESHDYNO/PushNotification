import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailVerification = TextEditingController();
   var emailid='';
  void emailValidate(BuildContext context) {
    final bool isValid = EmailValidator.validate(emailVerification.text.trim());
    setState(() {
      if (isValid) {
        emailid = emailVerification.text;
      }else{
        setState(() {
          emailid='';
        });
      }
    });
    if (isValid) {
      Fluttertoast.showToast(
        msg: 'Valid Email',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Not a Valid Email',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Google Email Validate",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 90),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: emailVerification,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email, size: 23),
              suffixIcon: IconButton(onPressed: (){
                emailVerification.text="";
              }, icon:const  Icon(Icons.cancel_outlined)),
                hintText: 'Enter your Google Email',
                hintStyle:const TextStyle(fontSize: 13),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             /* TextButton(
                onPressed: () {
                  if (emailVerification.text.isNotEmpty) {
                    emailVerification.text = emailVerification.text
                        .substring(0, emailVerification.text.length - 1);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Clear ⌫',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 50),*/
              TextButton(
                onPressed: () {
                  emailValidate(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Click Me',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(emailid,style:TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),)
        ],
      ),
    );
  }
}
