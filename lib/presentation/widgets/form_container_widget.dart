import 'package:flutter/material.dart';

  class FormContainerWidget extends StatefulWidget{

    final TextEditingController controller;
    final Key? fieldKey;
    final bool? isPassword;
    final String? hintText;
    final Icon? icon;
    final String? labelText;
    final String? helperText;
    final FormFieldSetter<String>? onSaved;
    final FormFieldValidator<String>? validator;
    final ValueChanged<String>? onFieldSubmitted;
    final TextInputType? inputType;

    FormContainerWidget({
      required this.controller,
      this.fieldKey,
      this.isPassword,
      this.hintText,
      this.icon,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType,
    });


  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _osbscureText = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        onSaved: widget.onSaved,
        obscureText: widget.isPassword == true ? _osbscureText : false,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.amber,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              _osbscureText = !_osbscureText;
            }),
            child: 
            widget.isPassword == true 
            ? Icon(_osbscureText ? Icons.visibility_off 
            : Icons.visibility,
            color: _osbscureText == true ? Colors.grey : Colors.black,
          ): const Text(''),
        ),
       ),
     ),
    );
  }
}