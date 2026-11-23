# Won’t Buy（もう買わない）紹介

更新日: 2026-11-23

トップの一覧にカードを追加し、専用紹介ページ wontbuy/index.html を作成（gcameraと同じ構成：ヒーロー／できること／画面／CTA／フッター、日英切替）。カードに「詳しく見る」リンク（wontbuy/）を追加。プライバシーポリシーの対象表と広告配信の節に追加し、最終更新日を2026年11月23日に変更。

## 掲載内容

- カテゴリ: 買い物の記録・家族共有 ／ Shopping record & family sharing
- 名前: もう買わない ／ Won’t Buy（英語名はShingo決定）
- タグライン: もう、買わない。 ／ Never buy it again.
- アクセント色: #2f8e9f（青緑）
- App Storeのサブタイトル（EN「Shopping regrets: never again」／JA「買い物の失敗を写真で記録・家族と共有」）はストア用の文言のため、サイトには載せない。

## アイコン

確定版（青緑の背景・白いポラロイド風の枠・赤い画鋲、ライト版）を256×256pxに縮小して images/icon-wontbuy.png に配置。元画像はプロジェクト共有フォルダの dontbuy/appicon/AppIcon.appiconset/AppIcon_light.png（1024px）。

## 専用ページの画像

元ディレクトリ: /Users/STUDiO405/Library/CloudStorage/Dropbox/Dev/Design/Apps/DontBuy/AppStoreConnect/

- ヒーロー: ヘッダ/header-21x9-{ja,en}.png（3840×1646、21:9）→ images/wontbuy/hero-{ja,en}.jpg（1672×717、JPEG品質85）。指示は16:9だったが、フォルダにあるのは21:9のみ。
- 画面: スクショ/iPhone_{ja,en}/shot1-list・shot2-add・shot3-send・shot4-search・shot5-widgets（1320×2868）→ images/wontbuy/store-01〜05-{ja,en}.jpg（660×1434、JPEG品質85）。
- 元素材は変更していない。スクショフォルダはShingoが修正版で上書き済み（2026-11-22更新：英語shot1・2・3・5、日本語shot5）。
- キャプション: 1. もう、買わない。／Never buy it again. 2. 撮って、ひとこと。／Snap it. Say why. 3. 家族にも教えよう。／Warn your family, too. 4. 売り場ですぐ検索。／Find it in the aisle. 5. ウィジェットとSiriでも。／On your Home Screen and Siri.
- 注記: 画面内の商品は紹介用の架空のものです。／Products shown in the app screens are fictional examples.

## ページに載せていない情報

- 料金: 無料（バナー広告）＋有料版500円買い切り
- 対応: iPhone・iPad、iOS 27.2以上

## 公開前に差し替える項目

- [ ] App Storeリンク: index.htmlのカード、wontbuy/index.htmlのヒーローとCTAの計3か所の「App Storeで近日公開」のspanを、他アプリと同じ `<a class="store-link" href="…">` に置き換え
- [ ] サポートページの更新履歴リストにWon’t Buyを追加
- [ ] 公開後、App Store Connectのマーケティング・サポート・プライバシーポリシーURLを登録

## 英語版からの「帰りますよ？」の除外（2026-11-23 Shingo指示）

日本国内のみのアプリのため、プライバシーポリシーの対象表の行（class="ja"）と英語の広告配信の文、サポートの更新履歴リスト（class="ja"）から英語表示を除外。一覧のカードは元から日本語のみ。

## プライバシーポリシー

Analytics・Crashlytics・AdMob（無料版のバナー広告、メイン画面下端）をすべて使用。
