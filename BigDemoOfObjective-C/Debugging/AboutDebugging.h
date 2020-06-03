/**
 1.常用LLDB命令:
    p: print
    po: print object
    expression:打印或修改值 expression width or expression width = 100
        print 其实是expression -- 的简写
        e.g:// 改变颜色
        (lldb) expression -- self.view.backgroundColor = [UIColor redColor]
        // 刷新界面
        (lldb) expression -- (void)[CATransaction flush]
 
 
    call:调用方法 打印方法的返回值
    bt(thread backtrace):打印堆栈信息 可加个数限制,如:bt 10
    frame select num:调到bt返回的帧
    frame variable :查看帧变量
    thread return:立即返回 thread return value
 
    image lookup -a(address): 查找崩溃位置
    image lookup -n(name): 查找方法来源
    image lookup -t(type):查看某类的成员及属性
    
 流程控制:
    c:continue
    n:next
    s:step
    f:finish
 
 
 
 
 
 
 
 */
