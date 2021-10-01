import 'package:flutter/material.dart';
import 'package:flutter_api/data/api/api_helper.dart';
import 'package:flutter_api/data/api/api_helper_impl.dart';
import 'package:flutter_api/data/model/member.dart';
import 'package:flutter_api/data/repository/member_repository.dart';
import 'package:flutter_api/presentation/member/member_view_model.dart';

class MemberListScreen extends StatefulWidget {
  late MemberViewModel _memberViewModel;
  BookFormScreen(){
    ApiHelper apiHelper = ApiHelperImpl.INSTANCE;
    MemberRepository _memberRepository = MemberRepository(apiHelper);
    _memberViewModel = MemberViewModel(_memberRepository);
  }

  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  @override
  void initState() {
    super.initState();
    _getListMember();
  }

  List<dynamic> listMember = <Member>[];

  _getListMember() async {
    listMember = await widget._memberViewModel.getMember();
    Future.delayed(const Duration(microseconds: 500), () {
      setState(() {
        listMember = listMember.where((element) => element.status!=0).toList();
        //listMember = listMember;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Member List', style: TextStyle(fontSize: 24, color: Colors.blue) ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () async {
                      final status =
                      await Navigator.pushNamed(context, '/add-member');
                      if (status == 'done') {
                        setState(() {
                          _getListMember();
                        });
                      }
                    },
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 34),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Card(
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Row(
                        children: [
                          Expanded(
                              child: ListTile(
                            leading: Icon(
                              Icons.perm_identity,
                              size: 40.0,
                            ),
                            title: Text(listMember[index].firstName),
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget._memberViewModel.deleteMember(listMember[index].id);
                                  });
                                },
                                icon: const Icon(Icons.delete)),
                          )),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.cyan,
                      )
                    ]);
                  },
                  itemCount: listMember.length,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
