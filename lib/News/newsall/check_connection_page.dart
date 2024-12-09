import 'package:flutter/material.dart';




class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({Key? key, this.onPressed}) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 200,
              child: Image.asset('assets/images/no_connection.jpg')),
          const SizedBox(height: 32),
          const Text(
            'ओहो!     ❌',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'यो सुविधा बनाउने क्रम अन्तर्गत छ〡',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            '🍷 App Develop by Bhupendra Dahal 🍷',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);


            },
            child: const Text(
              "Close",
              style: TextStyle(

                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
          ),
        ],
      ),


    );


  }
}
