// ActionScript file
import flash.events.MouseEvent;

import mx.core.Application;
import mx.core.DragSource;
import mx.core.UIComponent;
import mx.events.DragEvent;
import mx.managers.DragManager;

import view.Node;

//private var _dragSource : DragSource = new DragSource();

//private function dragSource(event : MouseEvent, data : Object , format : String) : void
//{
//    mainModel.dragNode = this;
//    
//    mainModel.main.stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandle);
//    if(this == TestMindMap.mainNode)
//        _dragSource.addData(data,'main');
//    else 
//        _dragSource.addData(data,format);
//        
//    DragManager.doDrag(this,_dragSource,event);
//}
//
//private function dragEnter(event : DragEvent,format : String) : void
//{
//    if(event.dragSource.hasFormat(format)) 
//        DragManager.acceptDragDrop(event.target as UIComponent);
//}
//
//private function dragDrop(event : DragEvent,format : String) : void
//{
//    mainModel.dragNode = null;
//    var _tempNode : Node ;
//    _tempNode = event.dragSource.dataForFormat(format) as Node;
//    if(event.target != _tempNode) {
//        _tempNode.parentNode.removeChildNode(_tempNode);
//        _tempNode.parentNode = event.target as Node;
//    }
////    mainModel.dragNode.stage.removeEventListener(MouseEvent.MOUSE_MOVE,null);
//}

private function mouseDownHandle(event : MouseEvent) : void
{
    Application.application.setChildIndex(this,0);
    mainModel.dragNode = this;
    mainModel.isDraging = true;
    startDrag();
}

private function mouseMoveHandle(event : MouseEvent) : void
{
    if(mainModel.dragNode != null) {
        mainModel.dragNode.x = event.stageX - mainModel.dragNode.mouseX;
        mainModel.dragNode.y = event.stageY - mainModel.dragNode.mouseY;
        mainModel.dragNode.refreshLine();
    }
}

private function mouseUpHandle(event : MouseEvent) : void
{
    if(mainModel.dragNode.parentNode!=null)
        if(this==mainModel.dragNode) {
                mainModel.dragNode.parentNode.refreshLine();
        } else {
            mainModel.dragNode.parentNode.removeChildNode(mainModel.dragNode);
            mainModel.dragNode.parentNode = this;
        }
    this.setStyle("backgroundAlpha",1);
    this.setStyle("borderStyle","none");
    mainModel.isDraging = false;
    
    stopDrag();
}

private function mouseOverHandle(event : MouseEvent) :void
{
    if(mainModel.isDraging&&mainModel.dragNode!=this) {
        this.setStyle("backgroundAlpha",0);
        this.setStyle("borderStyle","inset");
    }
}
private function mouseOutHandle(event : MouseEvent) : void
{
    this.setStyle("backgroundAlpha",1);
    this.setStyle("borderStyle","none");
}