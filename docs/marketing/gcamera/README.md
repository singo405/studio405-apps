# Gcamera Web画像案（日本語）

2026-11-14。公開前の確認用。

- `hero-ja-review.png`: 採用候補のスカイツリー構図に実際の撮影UIを合成。1672×941px。
- 写真プレビューは1206×1608px（3:4）の領域へ、縦横同倍率・上寄せで切り抜き。
- 写真・背景・日本語コピーは生成案を維持。写真内の旧横グリッド線を周辺画素で補間し、十字グリッドは実スクショの線を合成。縦線はスカイツリーの中心に揃える。
- 操作部分とステータス表示は実スクショを使用。縮小前の写真領域外について、元スクショと全画素一致を検証。
- 画面全体を0.31倍で等倍比率のまま合成。端末枠・Dynamic Islandは紹介用モックアップ。
- 合成画像であり、Gcameraで実際にこの風景を撮影したスクショではない。
- 旧画像ファイルは保持。英語版を作成し、日英のWeb用JPEGと最新ストアスクショをローカルの紹介ページに反映。公開は未実施。

再生成（プロジェクトルート）:

```sh
swift -module-cache-path /tmp/gcamera-hero-module-cache scripts/render-gcamera-hero.swift generated_images/exec-2b623c93-8e45-47b5-bd62-9dcf03452985.png /Users/STUDiO405/Development/iOS/App/Gcamera/output/app-store/en-US/iphone-17-pro-original.png docs/marketing/gcamera/hero-ja-review.png
```

実スクショの出典: GcameraのApp Store画像制作で取得したiPhone 17 Proシミュレーター画面（1206×2622px）。
