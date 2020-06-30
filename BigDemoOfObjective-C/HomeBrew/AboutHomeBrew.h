/**
 1.官方网站：https://brew.sh/index_zh-cn
 2.替换源，如中科大：
 替换brew.git：
 cd "$(brew --repo)"
 git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
 替换homebrew-core.git:
 cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
 git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
 替换Homebrew Bottles源：
 就是在~/.bashrc或者~/.zshrc文件末尾加
 export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
 这两个文件可以自己创建，~/.bashrc和~/.bash_profile都可以
 3.切换回官方源：
 重置brew.git
 cd "$(brew --repo)"
 git remote set-url origin https://github.com/Homebrew/brew.git
 重置homebrew-core：
 cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
 git remote set-url origin https://github.com/Homebrew/homebrew-core.git
 4.如替换源之后update没反应：
 ~/ cd usr/local/Homebrew //或者
 ~/ cd "$(brew --repo)"
 git pull origin master //更新homebrew
 brew update
 already up-to-date
 brew upgrade
 5.常用命令：
 安装： brew install 【包名】
 更新服务目录：brew update
 卸载 brew uninstall 【包名】
 升级已安装的包：brew upgrade
 列出已安装的包：brew list
 清理无效项：brew prune
 */
