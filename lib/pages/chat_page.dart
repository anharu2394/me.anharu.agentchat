import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/constants.dart';
import 'package:flutter_chat_demo/constants/router.dart';
import 'package:flutter_chat_demo/models/models.dart';
import 'package:flutter_chat_demo/providers/providers.dart';
import 'package:flutter_chat_demo/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulHookConsumerWidget {
  const ChatPage({super.key, required this.arguments});

  final ChatPageArguments arguments;

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends ConsumerState<ChatPage> {
  List<QueryDocumentSnapshot> _listMessage = [];
  int _limit = 20;
  final _limitIncrement = 20;
  String _groupChatId = "";

  File? _imageFile;
  bool _isLoading = false;
  bool _isShowSticker = false;
  String _imageUrl = "";

  final _chatInputController = TextEditingController();
  final _listScrollController = ScrollController();
  final _focusNode = FocusNode();

  get _chatProvider => ref.watch(chatProvider.notifier);
  AsyncValue<UserChat?> get _authProvider => ref.watch(authProvider);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _listScrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _chatInputController.dispose();
    _listScrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!_listScrollController.hasClients) return;
    if (_listScrollController.offset >=
            _listScrollController.position.maxScrollExtent &&
        !_listScrollController.position.outOfRange &&
        _limit <= _listMessage.length) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        _isShowSticker = false;
      });
    }
  }

  void _readLocal() {
    _authProvider.whenOrNull(data: (UserChat? _auth) {
      if (_auth == null) {
        context.pushReplacement(Routes.loginPage);
      }
      String peerId = widget.arguments.peerId;
      final _currentUserId = _auth!.id;
      if (_auth.id.compareTo(peerId) > 0) {
        setState(() {
          _groupChatId = '$_currentUserId-$peerId';
        });
      } else {
        setState(() {
          _groupChatId = '$peerId-$_currentUserId';
        });
      }

      _chatProvider.updateDataFirestore(
        FirestoreConstants.pathUserCollection,
        _currentUserId,
        {FirestoreConstants.chattingWith: peerId},
      );
    });
  }

  Future<bool> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedXFile = await imagePicker
        .pickImage(source: ImageSource.gallery)
        .catchError((err, stackTrace) {
      print(err);
      print(stackTrace);
      Fluttertoast.showToast(msg: err.toString());
      return null;
    });
    if (pickedXFile != null) {
      final imageFile = File(pickedXFile.path);
      setState(() {
        _imageFile = imageFile;
        _isLoading = true;
      });
      return true;
    } else {
      return false;
    }
  }

  void _getSticker() {
    // Hide keyboard when sticker appear
    _focusNode.unfocus();
    setState(() {
      _isShowSticker = !_isShowSticker;
    });
  }

  Future<void> _uploadFile() async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final uploadTask = _chatProvider.uploadFile(_imageFile!, fileName);
    try {
      final snapshot = await uploadTask;
      _imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        _isLoading = false;
        _onSendMessage(_imageUrl, TypeMessage.image);
      });
    } on FirebaseException catch (e) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }

  void _onSendMessage(String content, int type) {
    if (content.trim().isNotEmpty) {
      _chatInputController.clear();
      _authProvider.whenOrNull(data: (auth) {
        if (auth == null) {
          context.pushReplacement(Routes.loginPage);
        }
        _chatProvider.sendMessage(
            content, type, _groupChatId, auth!.id, widget.arguments.peerId);
        if (_listScrollController.hasClients) {
          _listScrollController.animateTo(0,
              duration: Duration(milliseconds: 300), curve: Curves.easeOut);
        }
      });
    } else {
      Fluttertoast.showToast(
          msg: 'Nothing to send', backgroundColor: ColorConstants.greyColor);
    }
  }

  Widget _buildItemMessage(int index, DocumentSnapshot? document) {
    if (document == null) return SizedBox.shrink();
    final messageChat = MessageChat.fromDocument(document);
    return _authProvider.when(
      data: (auth) {
        if (auth == null) {
          context.pushReplacement(Routes.loginPage);
        }
        return _buildItemMessageContent(index, messageChat, auth!.id);
      },
      loading: () => SizedBox.shrink(),
      error: (error, stackTrace) {
        Fluttertoast.showToast(msg: error.toString());
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildItemMessageContent(
      int index, MessageChat messageChat, String _currentUserId) {
    if (messageChat.idFrom == _currentUserId) {
      // Right (my message)
      return Row(
        children: [
          messageChat.type == TypeMessage.text
              // Text
              ? Container(
                  child: Text(
                    messageChat.content,
                    style: TextStyle(color: ColorConstants.primaryColor),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  width: 200,
                  decoration: BoxDecoration(
                      color: ColorConstants.greyColor2,
                      borderRadius: BorderRadius.circular(8)),
                  margin: EdgeInsets.only(
                      bottom: _isLastMessageRight(index) ? 20 : 10, right: 10),
                )
              : messageChat.type == TypeMessage.image
                  // Image
                  ? Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        child: Image.network(
                          messageChat.content,
                          loadingBuilder: (_, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              decoration: BoxDecoration(
                                color: ColorConstants.greyColor2,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              width: 200,
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorConstants.themeColor,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (_, __, ___) {
                            return Image.asset(
                              'images/img_not_available.jpeg',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            );
                          },
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          context.push(Routes.chatPage,
                              extra: messageChat.content);
                        },
                      ),
                      margin: EdgeInsets.only(
                          bottom: _isLastMessageRight(index) ? 20 : 10,
                          right: 10),
                    )
                  // Sticker
                  : Container(
                      child: Image.asset(
                        'images/${messageChat.content}.gif',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      margin: EdgeInsets.only(
                          bottom: _isLastMessageRight(index) ? 20 : 10,
                          right: 10),
                    ),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      );
    } else {
      // Left (peer message)
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: _isLastMessageLeft(index)
                      ? Image.network(
                          widget.arguments.peerAvatar,
                          loadingBuilder: (_, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: ColorConstants.themeColor,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (_, __, ___) {
                            return Icon(
                              Icons.account_circle,
                              size: 35,
                              color: ColorConstants.greyColor,
                            );
                          },
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        )
                      : Container(width: 35),
                ),
                messageChat.type == TypeMessage.text
                    ? Container(
                        child: Text(
                          messageChat.content,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        width: 200,
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        margin: EdgeInsets.only(left: 10),
                      )
                    : messageChat.type == TypeMessage.image
                        ? Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: GestureDetector(
                              child: Image.network(
                                messageChat.content,
                                loadingBuilder: (_, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstants.greyColor2,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    width: 200,
                                    height: 200,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: ColorConstants.themeColor,
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (_, __, ___) => Image.asset(
                                  'images/img_not_available.jpeg',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                context.push(Routes.chatPage,
                                    extra: messageChat.content);
                              },
                            ),
                            margin: EdgeInsets.only(left: 10),
                          )
                        : Container(
                            child: Image.asset(
                              'images/${messageChat.content}.gif',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            margin: EdgeInsets.only(
                                bottom: _isLastMessageRight(index) ? 20 : 10,
                                right: 10),
                          ),
              ],
            ),

            // Time
            _isLastMessageLeft(index)
                ? Container(
                    child: Text(
                      DateFormat('dd MMM kk:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              int.parse(messageChat.timestamp))),
                      style: TextStyle(
                          color: ColorConstants.greyColor,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                    margin: EdgeInsets.only(left: 50, top: 5, bottom: 5),
                  )
                : SizedBox.shrink()
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10),
      );
    }
  }

  bool _isLastMessageLeft(int index) {
    return _authProvider.maybeWhen(
        data: (auth) {
          if (auth == null) {
            context.pushReplacement(Routes.loginPage);
          }
          if ((index > 0 &&
                  _listMessage[index - 1].get(FirestoreConstants.idFrom) !=
                      auth!.id) ||
              index == 0) {
            return true;
          } else {
            return false;
          }
        },
        orElse: () => false);
  }

  bool _isLastMessageRight(int index) {
    return _authProvider.maybeWhen(
      data: (auth) {
        if (auth == null) {
          context.pushReplacement(Routes.loginPage);
        }
        if ((index > 0 &&
                _listMessage[index - 1].get(FirestoreConstants.idFrom) !=
                    auth!.id) ||
            index == 0) {
          return true;
        } else {
          return false;
        }
      },
      orElse: () => false,
    );
  }

  void _onBackPress() {
    _authProvider.maybeWhen(data: (auth) {
      if (auth == null) {
        context.pushReplacement(Routes.loginPage);
      }
      _chatProvider.updateDataFirestore(
        FirestoreConstants.pathUserCollection,
        auth!.id,
        {FirestoreConstants.chattingWith: null},
      );
      context.pop();
    }, orElse: () {
      context.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readLocal();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.arguments.peerNickname,
          style: TextStyle(color: ColorConstants.primaryColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: PopScope(
          child: Stack(
            children: [
              Column(
                children: [
                  _buildListMessage(),
                  _isShowSticker ? _buildStickers() : SizedBox.shrink(),
                  _buildInput(),
                ],
              ),
              Positioned(
                child: _isLoading ? LoadingView() : SizedBox.shrink(),
              ),
            ],
          ),
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) return;
            _onBackPress();
          },
        ),
      ),
    );
  }

  Widget _buildStickers() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              _buildItemSticker("mimi1"),
              _buildItemSticker("mimi2"),
              _buildItemSticker("mimi3"),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Row(
            children: [
              _buildItemSticker("mimi4"),
              _buildItemSticker("mimi5"),
              _buildItemSticker("mimi6"),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Row(
            children: [
              _buildItemSticker("mimi7"),
              _buildItemSticker("mimi8"),
              _buildItemSticker("mimi9"),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: ColorConstants.greyColor2, width: 0.5)),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
    );
  }

  Widget _buildItemSticker(String stickerName) {
    return TextButton(
      onPressed: () => _onSendMessage(stickerName, TypeMessage.sticker),
      child: Image.asset(
        'images/$stickerName.gif',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      child: Row(
        children: [
          // button send image
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: Icon(Icons.image),
                onPressed: () {
                  _pickImage().then((isSuccess) {
                    if (isSuccess) _uploadFile();
                  });
                },
                color: ColorConstants.primaryColor,
              ),
            ),
            color: Colors.white,
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: Icon(Icons.face),
                onPressed: _getSticker,
                color: ColorConstants.primaryColor,
              ),
            ),
            color: Colors.white,
          ),

          // chat input
          Flexible(
            child: Container(
              child: TextField(
                onSubmitted: (_) {
                  _onSendMessage(_chatInputController.text, TypeMessage.text);
                },
                style:
                    TextStyle(color: ColorConstants.primaryColor, fontSize: 15),
                controller: _chatInputController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: ColorConstants.greyColor),
                ),
                focusNode: _focusNode,
              ),
            ),
          ),

          // Button send message
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () =>
                    _onSendMessage(_chatInputController.text, TypeMessage.text),
                color: ColorConstants.primaryColor,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: ColorConstants.greyColor2, width: 0.5)),
          color: Colors.white),
    );
  }

  Widget _buildListMessage() {
    return Flexible(
      child: _groupChatId.isNotEmpty
          ? Consumer(
              builder: (context, ref, _) {
                final snapshotAsyncValue =
                    ref.watch(chatStreamProvider(_groupChatId, _limit));
                return snapshotAsyncValue.when(
                  data: (snapshot) {
                    _listMessage = snapshot.docs;
                    if (_listMessage.length > 0) {
                      return ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemBuilder: (_, index) =>
                            _buildItemMessage(index, snapshot.docs[index]),
                        itemCount: snapshot.docs.length,
                        reverse: true,
                        controller: _listScrollController,
                      );
                    } else {
                      return Center(child: Text("No message here yet..."));
                    }
                  },
                  loading: () => Center(
                    child: CircularProgressIndicator(
                      color: ColorConstants.themeColor,
                    ),
                  ),
                  error: (error, stackTrace) {
                    Fluttertoast.showToast(msg: error.toString());
                    return Center(
                      child: Text("Error: $error"),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                color: ColorConstants.themeColor,
              ),
            ),
    );
  }
}

class ChatPageArguments {
  final String peerId;
  final String peerAvatar;
  final String peerNickname;

  ChatPageArguments(
      {required this.peerId,
      required this.peerAvatar,
      required this.peerNickname});
}
