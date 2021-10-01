import 'package:flutter/material.dart';
import 'package:flutter_api/data/api/api_helper.dart';
import 'package:flutter_api/data/api/api_helper_impl.dart';
import 'package:flutter_api/data/model/member.dart';
import 'package:flutter_api/data/repository/member_repository.dart';
import 'package:flutter_api/presentation/member/member_view_model.dart';
import 'package:flutter_api/widget/text_field_widget.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MemberFormScreen extends StatefulWidget {
  late MemberViewModel _memberViewModel;
  BookFormScreen(){
    ApiHelper apiHelper = ApiHelperImpl.INSTANCE;
    MemberRepository _memberRepository = MemberRepository(apiHelper);
    _memberViewModel = MemberViewModel(_memberRepository);
  }

  @override
  _MemberFormScreenState createState() => _MemberFormScreenState();
}

class _MemberFormScreenState extends State<MemberFormScreen> {

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController status = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Member'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      con: firstName,
                      hint: 'Enter First Name',
                      validate: MultiValidator([
                        RequiredValidator(errorText: "Please enter First Name"),
                      ]),
                    ),
                    TextFieldWidget(
                      con: lastName,
                      hint: 'Enter Last Name',
                    ),
                    TextFieldWidget(
                      con: email,
                      hint: 'Enter Email',
                      validate: MultiValidator([
                        RequiredValidator(errorText: "Please enter email"),
                      ]),
                    ),
                    TextFieldWidget(
                      con: password,
                      hint: 'Enter Password',
                      validate: MultiValidator([
                        RequiredValidator(errorText: "Please enter password"),
                      ]),
                    ),
                    TextFieldWidget(
                      con: status,
                      hint: 'Enter Status, 1 for active and 0 for inactive',
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              widget._memberViewModel.addMember(Member(
                                firstName: firstName.text,
                                lastName: lastName.text,
                                email: email.text,
                                password: password.text,
                                status: int.parse(status.text),
                              ));
                            });
                            Navigator.pop(context, 'done');
                          }
                        },
                        child: Text('Submit')),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
