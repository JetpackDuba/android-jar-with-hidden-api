# Android Jar With Hidden API

NOTE: Tested with API 35, Android 15, Android Studio 2024.1.1 and Gradle 9.0.

This repo contains the steps to generate an android.jar with access to AOSP's hidden APIs. You can use the already modified android.jar, use the script to create a custom one or simply do manually the steps.

# How to generate a custom android.jar using the Script

The script requires unzip to be installed (obviously also java to use the jar tool). You will have to pass the path of the folder where the original android.jar is contained and your AOSP path (previously built to generate all the framework files).

# How to generate a custom android.jar manually

Steps to generate an android.jar with access to AOSP hidden API

- Uncompress the original `android.jar` from your SDK directory (/home/user/Android/Sdk/platforms/android-XX/android.jar where XX is your SDK API version) into a new folder, for example a folder called `new_android_jar`.

- Uncompress the content of `classes-header.jar` located in `aosp/out/target/common/obj/JAVA_LIBRARIES/framework-minus-apex_intermediates` (it could also be in `framework_intermediates`) into the same folder as `android.jar` (new_android_jar in this case).

- Then generate a new `android.jar` using the following command: `jar cvf android.jar -C new_android_jar/ .`

- Place the new `android.jar` into the same folder as the previous one (instead of overriding the original one, rename it in case something fails).
