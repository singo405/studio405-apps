# STUDiO405 Applications

GitHub Pages向けの静的サイト。index.htmlは初回リリース順のアプリ一覧（日本語6件・英語5件。「帰りますよ？」は日本語のみ）、remaining/はRemaining専用紹介ページ。

assets/site.cssとassets/language.jsを共有（国内専用の「帰りますよ？」紹介ページは日本語固定）。日本語／英語はブラウザーの言語で初期選択、手動切替可能。?lang=jaまたは?lang=enでリンク先にも言語を引き継ぐ。

一覧で他アプリの「特徴を見る」はその場で展開。全6アプリの専用紹介ページへリンク。Won’t Buy（もう買わない、wontbuy/）はApp Storeリンクが仮置き（docs/apps/wontbuy.md）。全5ページに既存の紹介画像・画面画像を掲載。SnowTracksはプロジェクト内の機能資料も反映。他3アプリの説明は公開中の紹介内容に基づき、現行アプリとの詳細照合は今後実施する。確認資料はdocs/apps/に置く。

ローカル確認: python3 -m http.server 8766 --bind 127.0.0.1
外部フレームワーク・分析ツール・フォント配信なし。公開はGitHub Pagesの既存設定を使用。

共通窓口: support/（日本語・英語）。問い合わせフォームとメール、App Storeの更新履歴へのリンクを掲載。
共通プライバシーポリシー: privacy/（日本語・英語）。対象アプリとAnalytics・Crashlytics・AdMobの利用状況を明記。新アプリ追加・SDKや情報の取り扱い変更時は対象表と説明を更新する。

App Store Connect登録用（公開反映後に変更）:
- サポートURL 日本語: https://singo405.github.io/studio405-apps/support/?lang=ja
- サポートURL 英語: https://singo405.github.io/studio405-apps/support/?lang=en
- プライバシーポリシーURL 日本語: https://singo405.github.io/studio405-apps/privacy/?lang=ja
- プライバシーポリシーURL 英語: https://singo405.github.io/studio405-apps/privacy/?lang=en

問い合わせフォームは既存の https://forms.gle/Fao1qzH4spZdDSTh7 を使用。フォームの共通化（タイトル変更・アプリ名選択の追加）は所有者が実施。
Handworksのみ、更新判定用のFirebase Remote Configについても記載。

単体HTMLでの確認: `python3 scripts/create-previews.py` で preview/support.html と preview/privacy.html を生成。CSS・JavaScriptを内包し、HTMLだけを保存してSafariで開いても言語切替が可能。変更後は再生成する。preview/ はGit管理対象外。

## 次回のストア更新で忘れずに変更する項目

Gcamera・Remainingは、App Store ConnectのサポートURLとマーケティングURLを日本語・英語ともに新サイトへ変更する（2026-11-14時点で未完了）。Handworksは2026-11-15に日英の登録値・保存済み状態を確認済み。各アプリのチェックリストは次の資料にある。

- [Gcamera](docs/apps/gcamera.md#次回のストア更新で変更するurl)
- [Remaining](docs/apps/remaining.md#次回のストア更新で変更するurl)
- [Handworks](docs/apps/handworks.md#次回のストア更新で変更するurl)
