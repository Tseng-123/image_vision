import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('响应式布局示例'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              // 当屏幕宽度大于 600 时，显示两列组件
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '第一列第一个组件',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          '第一列第二个组件',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '第二列第一个组件',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          '第二列第二个组件',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // 当屏幕宽度小于等于 600 时，显示一列组件
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '第一个组件',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    '第二个组件',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    '第三个组件',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    '第四个组件',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
