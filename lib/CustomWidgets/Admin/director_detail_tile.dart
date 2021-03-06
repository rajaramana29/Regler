import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';

class DirDetailTile extends StatefulWidget {
  final UserData user;
  final Function block;
  final Function delete;
  final Function changeLimit;
  DirDetailTile(this.user, this.block, this.delete, this.changeLimit);

  @override
  _DirDetailTileState createState() => _DirDetailTileState();
}

class _DirDetailTileState extends State<DirDetailTile> {
  @override
  Widget build(BuildContext context) {
    String strblock;

    if (widget.user.isBlcked) {
      strblock = Strings.unblock;
    } else {
      strblock = Strings.block;
    }
    if (widget.user.role == Strings.roleDirector) {
      return InkWell(
          onTap: () {},
          child: Card(
              color: Colors.black12,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  child: AppExpansionTile(
                    title: Row(
                      children: <Widget>[
                        CircularImage(
                          NetworkImage(widget.user.url),
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(widget.user.name),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          widget.user.institute,
                          style: TextStyle(color: Colors.tealAccent),
                        )
                      ],
                    ),
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Column(
                          children: <Widget>[
                            Text(
                              Strings.usage,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              widget.user.used.toString() + Strings.m,
                              style: TextStyle(color: Colors.white70),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: RawMaterialButton(
                              onPressed: () {
                                widget.block(widget.user);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.block,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 2.0,
                                    ),
                                    Text(strblock),
                                  ],
                                ),
                              ),
                              fillColor: Colors.orange,
                              splashColor: Colors.orangeAccent,
                              shape: const StadiumBorder(),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: RawMaterialButton(
                              onPressed: () {
                                widget.delete(widget.user);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.delete,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 2.0,
                                    ),
                                    Text(Strings.delete),
                                  ],
                                ),
                              ),
                              fillColor: Colors.red,
                              splashColor: Colors.redAccent,
                              shape: const StadiumBorder(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))));
    } else {
      return Container();
    }
  }
}
