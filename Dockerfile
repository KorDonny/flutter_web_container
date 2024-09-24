# Environemnt to install flutter and build web

# FROM debian:latest AS build-env

# install all needed stuff

# RUN apt-get update
# RUN apt-get install -y curl git unzip

# define variables

# ARG FLUTTER_SDK=/usr/local/flutter
# ARG FLUTTER_VERSION=3.10.5

# ARG APP=/app/

#clone flutter
# RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
# change dir to current flutter folder and make a checkout to the specific version
# RUN cd $FLUTTER_SDK && git fetch && git checkout $FLUTTER_VERSION

# setup the flutter path as an enviromental variable
# ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Start to run Flutter commands
# doctor to see if all was installes ok
# RUN flutter doctor -v

# create folder to copy source code
# RUN mkdir $APP
# copy source code to folder
# COPY . $APP
# stup new folder as the working directory
# WORKDIR $APP

# Run build: 1 - clean, 2 - pub get, 3 - build web
# RUN flutter clean
# RUN flutter pub get
# RUN flutter build web

# once heare the app will be compiled and ready to deploy

# use nginx to deploy
# FROM nginx:1.25.2-alpine

# copy the info of the builded web app to nginx
# COPY --from=build-env /app/build/web /usr/share/nginx/html

# Expose and run nginx
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]


# changed dockerfile
# 베이스 이미지로 Flutter를 포함한 Dart SDK를 사용합니다.
FROM cirrusci/flutter:latest

# 환경 변수 설정
ENV FLUTTER_SDK=/flutter

# Dart SDK 버전 확인
RUN dart --version

# Flutter 버전 확인
RUN flutter --version

# 필요한 추가 패키지 설치
RUN flutter pub get

# 앱 소스 복사
COPY . /app

# 작업 디렉토리 설정
WORKDIR /app

# 앱 빌드
RUN flutter build web

# 웹 서버 실행 (예: dhttpd 사용)
RUN pub global activate dhttpd
CMD ["dhttpd", "--path", "build/web"]