# ANSIエスケープシーケンス チートシート

| 用途       | 色コード         | 説明                   |
|------------|------------------|------------------------|
| RESET      | `[0m`        | リセット（色を戻す）  |
| ERROR      | `[31m`       | エラーメッセージ（赤）|
| CAUTION    | `[33m`       | 警告メッセージ（黄色）|
| LOG        | `[32m`       | 正常ログメッセージ（緑）|
| DEBUG      | `[34m`       | デバッグ情報（青）    |
| IMPORTANT  | `[36m`       | 重要な情報（シアン）  |

## 使い方例

```batch
echo !ERROR![ERROR]!RESET!エラーメッセージ
echo !CAUTION![CAUTION]!RESET!警告メッセージ
echo !LOG![LOG]!RESET!正常ログメッセージ
echo !DEBUG![DEBUG]!RESET!デバッグ情報
echo !IMPORTANT![IMPORTANT]!RESET!これは重要な情報です
