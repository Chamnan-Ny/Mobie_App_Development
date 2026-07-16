import 'package:flutter/material.dart';
import 'package:week10/EX-1%20-%20AUTHENTICATION/1%20-%20START%20CODE/data/repositories/scores_repository.dart';
import 'package:week10/EX-1%20-%20AUTHENTICATION/1%20-%20START%20CODE/data/services/auth_service.dart';

import '../model/score.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({super.key,required this.onLogout});
  final VoidCallback onLogout;

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  List<Score>? scores;
  String? error;


  @override
  void initState() {
    super.initState();

    fetchSCores();
  }

  void fetchSCores() async {
    try {
      // Get the token from the existing session
      final token = AuthenticationService.instance.session?.token;

      // Ask the repository to fetch the data
      final data = await ScoresRepository.instance.getScores(token!);

      // Success: update the list and refresh
      setState(() {
        scores = data;
      });
    } catch (e) {
      // Failure: update the error and refresh
      setState(() {
        error = "Failed to load scores: $e";
      });
    }
  }

  String? get userName {
    // Ask the AuthenticationService instance the current user nale (if any)

    return AuthenticationService.instance.session?.user.name;
  }

  Widget get content {
    // if error, display the error in red, centered
    if (error != null) {
      return Center(
        child: Text(error!, style: const TextStyle(color: Colors.red)),
      );
    }
    // If scores list => dispaly the list using the ScoreTile
    if (scores != null) {
      return ListView.builder(
        itemCount: scores!.length,
        itemBuilder: (context, index) => ScoreTile(score: scores![index]),
      );
    }

    // otherwise, we disaply the  CircularProgressIndicator
    return const Center(child: CircularProgressIndicator());
  }

  String get welcomeLabel => "Welcome ${userName != null ? userName! : ""} !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(welcomeLabel),
      actions: [
        IconButton(onPressed: widget.onLogout, icon: const Icon(Icons.logout))
      ],),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20.0), child: content),
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  const ScoreTile({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(title: Text(score.title)),
    );
  }
}
