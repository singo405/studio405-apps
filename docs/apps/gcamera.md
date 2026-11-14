# Gcamera 紹介ページ

更新日: 2026-11-14

## 現在の構成

- 上部: スカイツリーの既存構図を活かした紹介画像。日英それぞれに、実スクショの操作UIを合成。写真プレビューは3:4。
- できること: グリッド切替・グリッド付き保存・Instagramを含む共有。
- 画面紹介: 最新ストア用iPhoneスクショ3枚（傘と水たまり／桜と橋／スクエアの猫）。日英切替対応。
- サポートとプライバシーポリシーの共通フッターを維持。

## 素材の出典

### 上部の紹介画像

`images/gcamera/hero-{ja,en}.jpg`。合成方法と検証内容は [../marketing/gcamera/README.md](../marketing/gcamera/README.md)。

旧 `screen-01-{ja,en}.jpg` は比較用に保持。現ページからは参照しない。

### ストア用スクショ

元ディレクトリ: `/Users/STUDiO405/Development/iOS/App/Gcamera/output/app-store/upload/`

- 言語: `ja` / `en-US`
- `01-puddle-1206x2622.png`
- `02-sakura-bridge-1206x2622.png`
- `03-cat-square-1206x2622.png`

Web用は `images/gcamera/store-01〜03-{ja,en}.jpg` へ660×1434px、JPEG品質85で縮小。写真・コピー・UIの配置は変更せず、元素材も変更していない。iPad版と海のストアヘッダは今回のページには追加していない。

## Instagramの確認

`Gcamera+/preViewPhotoController.m` の `photoAppLink:` / `openInstagram:` を確認。Instagramが利用可能な場合のみ専用共有項目を追加し、写真のLocalIdentifierを付けてInstagramを開く。WebにはInstagramアプリのインストールが必要なことを明記。実機でのInstagram側の挙動は今回未検証。

## ローカルプレビュー

`python3 scripts/create-previews.py` → `preview/gcamera.html`。
CSS、JavaScript、画像を内包し、単体保存したファイルでも日英切替できる。公開サイトへの反映は未実施。
