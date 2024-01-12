# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## メリット

- アクセシビリティを高める: Flutter を使うことで、アプリのアクセシビリティはデフォルトで確保される。アプリのすべてのテキストと対話的要素が、TalkBack や VoiceOver などのスクリーン リーダーから認識できるようになっている。

## Widget

### Scaffold

Scaffold は Flutter フレームワークで使用されるウィジェットの一つで、基本的なアプリケーションの骨格（スケルトン）を提供
アプリケーションのトップレベルのウィジェットとして使用され、多くの一般的な機能を提供

       ・AppBar（アプリケーションバー）:
        アプリの上部に表示されるバーで、通常はアプリのタイトルやアクションを配置するために使用されます。

       ・Body:
        アプリケーションのメインコンテンツが配置される領域です。
        通常は Container や他のウィジェットを使用してレイアウトが構築されます。

       ・FloatingActionButton（浮動アクションボタン）:
        通常はアプリケーションの主要なアクションを実行するための円形のボタンです。

       ・BottomNavigationBar（ボトムナビゲーションバー）:
        アプリケーションの下部に表示され、複数の画面やセクションにナビゲートするためのボタンを提供します。

       ・Drawer: アプリケーションの左側からスライドインするサイドメニューを表示します。

       ・SnackBar: 画面の一番下に短いメッセージを表示するための小さなウィジェット。

### Column

Flutter における非常に基本的なレイアウト ウィジェット
任意の数の子を従え、それらを上から下へ一列に配置
デフォルトでは、その子を上に寄せる
