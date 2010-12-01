// ActionScript file
import flash.events.MouseEvent;

import mx.core.DragSource;
import mx.core.UIComponent;
import mx.events.DragEvent;
import mx.managers.DragManager;

import view.Node;

private var _dragSource : DragSource = new DragSource();

private function dragSource(event : MouseEvent, data : Object , format : String) : void
{
    _dragSource.addData(data,format);
    DragManager.doDrag(this,_dragSource,event);
}

private function dragEnter(event : DragEvent,format : String) : void
{
    if(event.dragSource.hasFormat(format)) 
        DragManager.acceptDragDrop(event.target as UIComponent);
}

private function dragDrop(event : DragEvent,format : String) : void
{
    var _tempNode : Node ;
    _tempNode = event.dragSource.dataForFormat(format) as Node;
    _tempNode.parentNode.removeChildNode(_tempNode);
    _tempNode.parentNode = event.target as Node;
    trace(event.target as Node);
}