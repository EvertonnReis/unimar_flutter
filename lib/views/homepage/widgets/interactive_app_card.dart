import 'package:flutter/material.dart';
import 'package:unimar_sab_19/models/user_app.dart';

class InteractiveAppCard extends StatefulWidget {
  const InteractiveAppCard({super.key, required this.userApp});
  final UserApp userApp;

  @override
  State<InteractiveAppCard> createState() => _InteractiveAppCardState();
}

class _InteractiveAppCardState extends State<InteractiveAppCard> {
  bool isTapped = false;

  void toggleCard() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCard,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isTapped
              ? const Color.fromARGB(255, 180, 220, 200)
              : const Color.fromARGB(255, 222, 173, 173),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/0.jpg', width: 100, height: 100),
                const SizedBox(width: 20),
                Text(
                  widget.userApp.name ?? '',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            Text(widget.userApp.role ?? '',
                style: const TextStyle(fontSize: 20)),
            Text(widget.userApp.email ?? '',
                style: const TextStyle(fontSize: 14)),
            Image.network(widget.userApp.imageUrl ?? '',
                width: 50, height: 50),
            const SizedBox(height: 10),
            Text(
              isTapped ? 'Você clicou no card!' : 'Toque para interagir',
              style: TextStyle(
                fontSize: 16,
                color: isTapped ? Colors.green : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}