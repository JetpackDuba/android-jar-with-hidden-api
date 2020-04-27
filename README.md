# Custom android.jar

Steps to generate an android.jar with access to AOSP hidden API

- Uncompress the original `android.jar` from your SDK directory (/home/user/Android/Sdk/platforms/android-XX/android.jar where XX is your SDK API version) into a new folder, for example a folder called `new_android_jar`.

- Uncompress the content of `classes-header.jar` located in /your_path/aosp/out/target/common/obj/JAVA_LIBRARIES/framework_intermediates into the same folder as `android.jar` (new_android_jar in this case).

- Then generate a new `android.jar` using the following command: `jar cvf android.jar -C new_android_jar/ .`

- Place the new `android.jar` into the same folder as the previous one (instead of overriding the original one, rename it in case something fails).
