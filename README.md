# dartserver

simple web server for Dart.

## run

```shell
$ dart run bin/main.dart
```

## compile

```shell
$ dart compile exe bin/main.dart -o bin/main
$ ./bin/main
```

## run on docker

```shell
$ docker build -t dartserver:1.0.0 .
$ docker run -d -p 8080:8080 dartserver:1.0.0
```

## deploy to GCP(Cloud Run)

```shell
$ gcloud config set project {PROJECT_ID}
$ gcloud run deploy --region asia-northeast1 --platform managed
```
