/**
 1.检查ruby环境应大于2.0.0
 2.安装xcode-select： xcode-select —install
 3.安装Fastlane：sudo gem install fastlane 或  brew cask install fastlane
 4.确认安装成功：fastlane -v
 5.cd到iOS工程根目录，执行：fastlane init
 6.cd到fastlane文件夹，分别vim Appfile&Fastfile两个文件
 Appfile模板：
     # app_identifier(“***BundleID***") # The bundle identifier of your app,也就是BundleID
     # apple_id(“***AppID***") # Your Apple email address,就是你的AppID，苹果开发者账号
     # For more information about the Appfile, see:
     # [<u>https://docs.fastlane.tools/advanced/#appfile</u>](https://docs.fastlane.tools/advanced/#appfile)
 Fastfile模板：
     default_platform(:ios)

 platform :ios do #打包平台

   desc "Description of what the lane does” #打包描述

   lane :test do #打包方法

     # add actions here: [https://docs.fastlane.tools/actions](https://docs.fastlane.tools/actions)

       gym(

     scheme: "", #项目名称

     export_method:"development",#打包输出种类

     output_directory: "", # 打包后的 ipa 文件存放的目录

     output_name: ""  # ipa文件名

     )

   end

 end

 export_method：app-store,   #AppStore正式生产环境包
 ad-hoc,  #生产测试包
 enterprise,  #企业包(299美刀账号)
 development  #开发测试包

 7.执行脚本：fastlane test


 参考资料：
 https://www.jianshu.com/p/19ae8cc865b0
 https://www.jianshu.com/p/af6079b5e762

 gym(# use_legacy_build_api: true,  # Xcode 9之后，需要去掉
         output_name: "appstore",  # 输出的ipa名称
         silent: true,  # 隐藏没有必要的信息
         clean: true,  # 在构建前先clean
         configuration: "Release",  # 配置为Release版本
         codesigning_identity: "iPhone Distribution: xxx Co.,Ltd. (5JC8GZ432G)",  # 代码签名证书
         buildlog_path: "./fastlanelog",  # fastlane构建ipa的日志输出目录
         export_method: "app-store", # Xcode 9增加export_method标签
         output_directory: "/Users/xxx/Desktop")  # ipa输出目录

 Fastlane：https://docs.fastlane.tools/getting-started/android/setup/
 */
