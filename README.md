# dartserver

Simple web server for Dart. Server entry point is 'bin/dartserver.dart' main() function.

## TODO

- [*] Model, DB の追加
  - 改善が必要
- [*] 認証の追加
- [] CORS の動作確認
- [] gRPC

## run

```shell
$ dart run bin/dartserver.dart (or dart run)
```

## compile

```shell
$ dart compile exe bin/dartserver.dart -o bin/dartserver
$ ./bin/dartserver
```

## run on docker

```shell
$ docker build -t dartserver:1.0.0 .
$ docker run -d -p 8080:8080 dartserver:1.0.0
```

## deploy to GCP(Cloud Run)

```shell
$ gcloud config set project {PROJECT_ID}
$ gcloud run deploy --region asia-northeast1 --platform managed --source .
```
