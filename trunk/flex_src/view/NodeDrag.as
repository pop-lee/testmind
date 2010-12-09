// ActionScript file

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