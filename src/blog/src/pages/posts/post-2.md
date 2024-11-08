---
layout: ../../layouts/MarkdownPostLayout.astro
title: 'StepFuncsionsの組み込み関数はChoiceの条件式で使えない'
pubDate: 2024-11-09 20:00:00
description: 'エラーがわかりにくい'
author: 'ささきよ'
tags: ["aws", "stepfunctions"]
---

## 組み込み関数を使おうとした

AWS Step Functionsで、Choiceの条件式に組み込み関数を使おうとしたところわかりにくいエラーが発生しました。

フローを書く時、一気に上から下までざざっざーと書いていくので、デプロイなどの段階でエラーに気づくことが多いです。

<br>

## 組み込み関数とは

StepFunctionsではフロー内で利用することのできる[組み込み関数](https://docs.aws.amazon.com/ja_jp/step-functions/latest/dg/intrinsic-functions.html)が用意されています。

Lambdaなどを利用して加工したりせずとも、直接フロー内で利用できるのでとても便利です。

<br>

## エラーがわかりにくい

StepFunctionsのフロー内で、特定のステップで取得した配列の長さを評価し、条件によって次のステップを分岐させたかったのですがエラーで小一時間悩みました。

```yaml
Choice:
  Type: Choice
  Choices:
    - Variable: States.ArrayLength($.Arns)
      NumericEquals: 0
      Next: Success
   Default: Failure
```
<br>

```
Error: invalid Step Functions State Machine definition: ERROR (SCHEMA_VALIDATION_FAILED): Value is not a Reference Path: Reference path didn't start with '$'
```

<br>

Terraform実行時にこの様なエラー

組み込み関数の部分が誤っているのだろう思いましたが、修正してエラーが解消されず小一時間悩いろいろ試してみましたが解決できませんでした。

<br>

## 解決方法

下記の様に、条件の前にPassステップで組み込み関数の結果を変数に格納してからChoiceの条件式に変数を利用するとエラーが解消されました。

```yaml
SetArnsLength:
  Type: Pass
  Result:
    ArnsLength.$: States.ArrayLength($.Arns)
  Next: Choice
Choice:
  Type: Choice
  Choices:
    - Variable: $.ArnsLength
      NumericEquals: 0
      Next: Success
   Default: Failure
```

<br>

ちなみに執筆では実行できていないので動くかどうか、、、

それでは、また次回。
