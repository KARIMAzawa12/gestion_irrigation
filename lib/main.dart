import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'package:lepfe/sections/chat.dart';
import 'package:lepfe/sections/chat_stream.dart';
import 'package:lepfe/sections/embed_batch_contents.dart';
import 'package:lepfe/sections/embed_content.dart';
import 'package:lepfe/sections/response_widget_stream.dart';
import 'package:lepfe/sections/stream.dart';
import 'package:lepfe/sections/text_and_image.dart';
import 'package:lepfe/sections/text_only.dart';
import 'binding.dart';
import 'constans/colors.dart';
import 'core/localisation/changelocal.dart';
import 'core/localisation/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  Gemini.init(apiKey: 'AIzaSyCoJR7Xaw8PJuX5HjuNx-rzdWUazMbGOwA');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF90CAF9)
        ,
        hintColor: Color(0xFFDCD3D3),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: mainText,
            fontFamily: 'Inter',
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            color: mainText,
            fontFamily: 'Inter',
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          headline3: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: SecondaryText,
            fontFamily: 'Inter',
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        // Add colorScheme and cardTheme here
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        cardTheme: CardTheme(color: Colors.blue.shade900),
      ),
      translations: MyTranslation(),
      locale: controller.language,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}

class SectionItem {
  final int index;
  final String title;
  final Widget widget;

  SectionItem(this.index, this.title, this.widget);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;

  final _sections = <SectionItem>[
    SectionItem(0, 'Stream text', const SectionTextStreamInput()),
    SectionItem(1, 'textAndImage', const SectionTextAndImageInput()),
    SectionItem(2, 'chat', const SectionChat()),
    SectionItem(3, 'Stream chat', const SectionStreamChat()),
    SectionItem(4, 'text', const SectionTextInput()),
    SectionItem(5, 'embedContent', const SectionEmbedContent()),
    SectionItem(6, 'batchEmbedContents', const SectionBatchEmbedContents()),
    SectionItem(
        7, 'response without setState()', const ResponseWidgetSection()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_selectedItem == 0
            ? 'irrigation intelligente'
            : _sections[_selectedItem].title),
        actions: [
          PopupMenuButton<int>(
            initialValue: _selectedItem,
            onSelected: (value) => setState(() => _selectedItem = value),
            itemBuilder: (context) => _sections.map((e) {
              return PopupMenuItem<int>(value: e.index, child: Text(e.title));
            }).toList(),
            child: const Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedItem,
        children: _sections.map((e) => e.widget).toList(),
      ),
    );
  }
}

