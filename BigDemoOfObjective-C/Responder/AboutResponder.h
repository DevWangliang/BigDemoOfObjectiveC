/**
 1.UIResponder内部提供了以下方法来处理事件触摸事件
     - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
     - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
     - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
     - (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
 2.事件传递顺序:
    Application->Window->Controller->View->Subview
 3.判断一个view能否响应事件:
    hitTest:withEvent:方法 对Subview分别调用pointInside方法 如果有subview返回subview 否则返回自身(自身作为事件响应的终点)
    pointInside方法 查看事件响应点是否在自己的坐标系内
 4.UITouch
     (CGPoint)locationInView:(UIView *)view;
     // 返回值表示触摸在view上的位置
     // 这里返回的位置是针对view的坐标系的（以view的左上角为原点(0, 0)）
     // 调用时传入的view参数为nil的话，返回的是触摸点在UIWindow的位置

     (CGPoint)previousLocationInView:(UIView *)view;
     // 该方法记录了前一个触摸点的位置
 5.事件响应顺序和事件传递顺序相反
 
 */
