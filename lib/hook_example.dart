import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStatePage extends HookWidget {
  const UseStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useState(0);

    return Scaffold(
        appBar: AppBar(title: const Text('UseState Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Count: ${count.value}',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => count.value++,
                child: const Text('Increment'),
              ),
            ],
          ),
        ));
  }
}
