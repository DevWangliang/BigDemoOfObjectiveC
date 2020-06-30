/**
 1、监测Java环境：java —version 下载安装地址：https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
 2、安装Jenkins
  2.1 官网下载：https://jenkins.io/download/
  2.2 通过Homebrew安装：
   a.安装Homebrew：https://brew.sh/index_zh-cn
   b.brew install Jenkins || cd /usr/local/Cellar/jenkings/{{版本号}}/libexec/jenkins.war java -jar./jenkins.war
  c.启动：jenkins
 3、安装iOS自动打包相关插件：
  插件管理：安装Keychains and Provisioning Profiles Management
  在kpp插件中上传：keychain和provisioning profile
  3.1获取login.keychain：终端输入：cd ~/Library/Keychains   然后输入ls
    拷贝出login.keychain-db并删除-db保存
    code signing identifier就是在本地钥匙串中证书的名字，复制出来即可，一定要先在本地钥匙串添加证书再导出
  3.2获取profile：路径：/Users/用户名/Library/MobileDevice/Provisioning Profiles
    按时间排序找到自己的描述文件
 4、开始配置任务：
   4.1创建一个自由风格的任务，在general中添加’丢弃旧的的构建’策略
   4.2源码管理:如果用gitlab等工具管理工程则需要添加ssh密钥和账号密码
   4.3构建触发器：按需选择，各项详细配置请google
   4.4构建环境：
     a勾选Keychains and Code Signing Identities和Mobile Provisioning Profiles，
           Keychains and Code Signing Identities是打包需要的证书，
           Mobile Provisioning Profiles是打包需要的配置文件
         b分别上传之前导出的keychain和profile





















 */
