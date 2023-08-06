import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStatePage extends HookWidget {
  UseStatePage({super.key});
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final count = useState(value);

    useEffect(() {
      print("useEffect");
      return null;
    }, [count.value]);

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
