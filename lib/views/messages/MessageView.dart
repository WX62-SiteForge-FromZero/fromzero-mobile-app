import 'package:flutter/material.dart';
import 'package:fromzero_app/api/messageService.dart';
import 'package:fromzero_app/api/profilesService.dart';
import 'package:fromzero_app/api/chatService.dart';
import 'package:fromzero_app/models/message_model.dart';
import 'package:fromzero_app/models/chat_model.dart';

class MessagesView extends StatefulWidget {
  final int chatId;
  final String senderId;

  const MessagesView({
    Key? key,
    required this.chatId,
    required this.senderId,
  }) : super(key: key);

  @override
  _MessagesViewState createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  final MessageService _messageService = MessageService();
  final ProfilesService _profilesService = ProfilesService();
  final ChatService _chatService = ChatService();
  final TextEditingController _messageController = TextEditingController();
  List<Message> _messages = [];
  String? companyName;
  String? developerName;
  String? companyId;
  String? developerId;

  @override
  void initState() {
    super.initState();
    _loadChatDetails();
  }

  Future<void> _loadChatDetails() async {
    try {
      Chat chat = await _chatService.getChatById(widget.chatId);
      setState(() {
        companyId = chat.company;
        developerId = chat.developer;
      });
      _loadMessages();
    } catch (e) {
      print("Error loading chat details: $e");
    }
  }

  Future<void> _loadMessages() async {
    try {
      List<Message> messages = await _messageService.getMessagesByChatId(widget.chatId);
      print("Messages: $messages");
      for (var message in messages) {
        if (message.senderId == companyId) {
          final company = await _profilesService.getCompany(companyId!);
          setState(() {
            companyName = company.companyName;
          });
        } else if (message.senderId == developerId) {
          final developer = await _profilesService.getDeveloper(developerId!);
          setState(() {
            developerName = developer.firstName + ' ' + developer.lastName;
          });
        }
      }
      setState(() {
        _messages = messages;
      });
    } catch (e) {
      print("Error loading messages: $e");
    }
  }

  Future<void> _sendMessage() async {
    if (_messageController.text.isEmpty) return;

    try {
      await _messageService.createMessage(
        widget.chatId,
        widget.senderId,
        _messageController.text,
      );
      _messageController.clear();
      _loadMessages(); // Refresh messages after sending
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messages")),
      body: Column(
        children: [
          Expanded(
            child: _messages.isNotEmpty
                ? ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final senderName = message.senderId == companyId
                    ? companyName ?? 'Unknown'
                    : message.senderId == developerId
                    ? developerName ?? 'Developer'
                    : 'Unknown';
                final isCurrentUser = message.senderId == widget.senderId;
                return ListTile(
                  tileColor: isCurrentUser ? Colors.blue[100] : null,
                  title: Text(message.content),
                  subtitle: Text("Sender: $senderName"),
                );
              },
            )
                : Center(child: Text("No messages available")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "Enter message..."),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}