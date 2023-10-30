# Use the official Flutter SDK image as base
FROM ghcr.io/cirruslabs/flutter:latest

# Set the environment variables for Flutter China community storage
ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
ENV PUB_HOSTED_URL=https://pub.flutter-io.cn

# Install basic command-line tools, JDK and unzip (required for the Android SDK)
RUN sudo apt-get update && sudo apt-get install -y curl unzip xz-utils git openssh-client libglu1-mesa

# Install Android SDK
# Replace "6200805" with the actual SDK command line tools version you want to use
RUN wget -O cmdline-tools.zip "https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip" && \
    mkdir -p /usr/local/android/cmdline-tools && \
    unzip cmdline-tools.zip -d /usr/local/android/cmdline-tools && \
    rm cmdline-tools.zip

# Set the environment variable for the Android SDK location
ENV ANDROID_SDK_ROOT /usr/local/android
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin"

# Accept licenses before installing components, no need to echo y for each component
RUN yes | sdkmanager --licenses

# Install Android build tools and platforms
RUN sdkmanager "build-tools;30.0.3" "platforms;android-30" "platform-tools"

# Install JDK (OpenJDK 11 is already part of cirrusci/flutter Docker image)
# If you need a specific version of JDK, install it here

# Set the environment variable for Java Home
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Add your Android SDK location to PATH
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/platform-tools"

# Create and set the app directory as the working directory
RUN mkdir /app
WORKDIR /app

# Copy your Flutter app to the container
COPY . /app

# Get Flutter dependencies
RUN flutter pub get

# Run Flutter doctor
RUN flutter doctor

# Run Flutter tests (if you have them)
RUN flutter test

# Build the APK
RUN flutter build apk

# (Optional) If you're using Flutter web, you can build the web app
# RUN flutter build web

# Set the entry point for the container
ENTRYPOINT ["flutter"]
