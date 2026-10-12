# STUDiO405 Applications

GitHub Pages向けの静的サイト。index.htmlは初回リリース順の5アプリ一覧、remaining/はRemaining専用紹介ページ。

assets/site.cssとassets/language.jsを共有。日本語／英語はブラウザーの言語で初期選択、手動切替可能。?lang=jaまたは?lang=enでリンク先にも言語を引き継ぐ。

一覧で他アプリの「特徴を見る」はその場で展開。全5アプリの専用紹介ページへリンク。Remaining以外の4ページは公開中の紹介内容に基づく仮版で、各アプリのプロジェクトで後日正式化する。確認資料はdocs/apps/に置く。

ローカル確認: python3 -m http.server 8766 --bind 127.0.0.1
外部フレームワーク・分析ツール・フォント配信なし。公開はGitHub Pagesの既存設定を使用。
