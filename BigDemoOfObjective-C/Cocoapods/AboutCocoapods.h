/**
 1. 安装:$sudo gem install cocoapods 替换为 sudo gem install -n /usr/local/bin cocoapods
 2. 升级Gem(如有必要):$sudo gem update --system
 3. 网络太慢或被墙,查看本地源:$gem sources -l
 4. 替换源:$gem sources —remove https://rubygems.org/  $gem sources -a https://ruby.taobao.org/
 5. 启用Pod:)$pod setup(自动)
 6. vim Podfile （终端vim文件 按 i 可编辑 ，esc 退出编辑，：wq  可保存退出）
 7. Podfile文件格式:platform:ios, ‘9.0’ target ‘Demo’ do pod XXX end
 8. import时候没有提示,可以在target-Build Settings下修改“User Header Search Paths”项，新增${SRCROOT}并选择rcursive
 9. 指定版本安装Cocoapods:sudo gem install cocoapods -v 0.37.1
 10. 清空pod缓存后更新由pod管理的libs:$rm -rf "${HOME}/Library/Caches/CocoaPods” $ rm -rf "`pwd`/Pods/“ $ pod update
 11. Cocoapods1.8之后替换为CDN的源,安装时有truck分支错误,解决办法:Podfile中指定源:source 'https://github.com/CocoaPods/Specs.git'
 12. 创建默认的Podfile文件:pod init
 13. 清除过期的gem: sudo gem cleanup
 14. list: gem list
 15. update: sudo gem update
 16. gem uninstall xxxx
 17. source 'https://cdn.cocoapods.org/‘ cdn的源
 18. https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git 清华大学镜像
 19. pod search 一直报错 pod repo remove trunk
 20. gem sources –remove https://rubygems.org // 移除默认源
 21. gem sources -a https://gems.ruby-china.org // 添加新的源
 22. gem sources -l //查看sources源 看是否已经更换

 栗子:
 source 'https://github.com/CocoaPods/Specs.git’
 source 'https://github.com/Artsy/Specs.git'
 platform:ios, ‘9.0'
 use_frameworks!
 target 'GeekTime' do
 pod 'Alamofire', '~> 4.5.1'
 pod 'SwiftyJSON-3.1.1', '~> 3.1.1'
 pod 'Dollar', '~> 7.0.0'
 pod 'SnapKit', '~> 4.0.0'
 pod 'Kingfisher', '~> 4.1.0'
 pod 'R.swift', '~> 4.0.0'
 end

 更详细的栗子:
 # 下面两行是指明依赖库的来源地址
 source 'https://github.com/CocoaPods/Specs.git'
 source 'https://github.com/Artsy/Specs.git'

 # 说明平台是ios，版本是9.0
 platform :ios, '9.0'

 # 忽略引入库的所有警告（强迫症者的福音啊）
 inhibit_all_warnings!

 # 针对MyApp target引入AFNetworking
 # 针对MyAppTests target引入OCMock，
 target 'MyApp' do
     pod 'AFNetworking', '~> 3.0'
     target 'MyAppTests' do
        inherit! :search_paths
        pod 'OCMock', '~> 2.0.1'
     end
 end
 # 这个是cocoapods的一些配置,官网并没有太详细的说明,一般采取默认就好了,也就是不写.
 post_install do |installer|
    installer.pods_project.targets.each do |target|
      puts target.name
    end
 end
 */
