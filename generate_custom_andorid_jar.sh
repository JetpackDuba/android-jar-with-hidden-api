#!/bin/sh

if ! [ -x "$(command -v unzip)" ]; then
  echo 'Error: unzip package is not installed.' >&2
  exit 1
fi

tmp_android_jar_dir="tmp_android_jar_dir/"

read -p "Folder of the original android.jar path (example /home/user/Android/Sdk/platforms/android-29): " android_jar_path
read -p "AOSP root path (example /home/user/Projects/AOSP/aosp_10_r30): " aosp_path

echo "Generating new jar..."

unzip -qq $android_jar_path/android.jar -d $tmp_android_jar_dir
unzip -qq -o  $aosp_path/out/target/common/obj/JAVA_LIBRARIES/framework_intermediates/classes-header.jar -d $tmp_android_jar_dir

jar cvf android.jar -C $tmp_android_jar_dir . &> /dev/null

rm -rf $tmp_android_jar_dir

echo "New android.jar generated"
read -p "Do you want to replace the original android.jar (the original one will be renamed to android.jar_backup)? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

mv $android_jar_path/android.jar $android_jar_path/android.jar_backup
cp android.jar $android_jar_path/android.jar

echo "Process completed"