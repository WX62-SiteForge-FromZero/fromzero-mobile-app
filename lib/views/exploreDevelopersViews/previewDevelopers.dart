import 'package:flutter/material.dart';
import 'package:fromzero_app/models/company_model.dart';
import '../../models/developer_model.dart';
import 'developerProjects.dart';
import 'package:fromzero_app/api/chatService.dart';
import 'package:fromzero_app/views/messages/MessageView.dart';
import 'package:fromzero_app/models/chat_model.dart';

class PreviewDeveloper extends StatelessWidget {
  final Developer developer;
  final Company currentUser;

  const PreviewDeveloper({
    super.key,
    required this.developer,
    required this.currentUser
  });
  Future<Chat?> _createOrOpenChat(String currentUserId, Developer developer) async {
    final ChatService chatService = ChatService();
    try {
      // Check if a chat already exists
      final chat = await chatService.getChatByDeveloperAndCompany(currentUser.profileId, developer.profileId);
      if (chat != null) {
        return chat;
      }

      // If no existing chat, create a new one
      final newChat = await chatService.createChat(developer.profileId, currentUser.profileId);
      return newChat;
    } catch (e) {
      print("Error creating or opening chat: $e");
      return null; // Return null in case of error
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(developer.profileImgUrl),
              radius: 60,
            ),
            const SizedBox(height: 16),
            Text(
              '${developer.firstName} ${developer.lastName}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              developer.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final chat = await _createOrOpenChat(currentUser.profileId, developer );
                if (chat != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessagesView(chatId: chat.id, senderId: currentUser.profileId),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                "Chatear",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeveloperProjectsScreen(
                      developerId: developer.profileId,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'Ver Proyectos',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
