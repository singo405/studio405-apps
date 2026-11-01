# STUDiO405 Applications

GitHub Pages向けの静的サイト。index.htmlは初回リリース順の5アプリ一覧、remaining/はRemaining専用紹介ページ。

assets/site.cssとassets/language.jsを共有（国内専用の「帰りますよ？」紹介ページは日本語固定）。日本語／英語はブラウザーの言語で初期選択、手動切替可能。?lang=jaまたは?lang=enでリンク先にも言語を引き継ぐ。

一覧で他アプリの「特徴を見る」はその場で展開。全5アプリの専用紹介ページへリンク。全5ページに既存の紹介画像・画面画像を掲載。SnowTracksはプロジェクト内の機能資料も反映。他3アプリの説明は公開中の紹介内容に基づき、現行アプリとの詳細照合は今後実施する。確認資料はdocs/apps/に置く。

ローカル確認: python3 -m http.server 8766 --bind 127.0.0.1
外部フレームワーク・分析ツール・フォント配信なし。公開はGitHub Pagesの既存設定を使用。
