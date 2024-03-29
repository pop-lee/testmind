// ActionScript file
import view.Node;

private function mouseDownHandle(event : MouseEvent) : void
{
    if(!isEditable) {
        setFocusNode();
        Application.application.setChildIndex(this,0);
        mainModel.dragNode = this;
        mainModel.isDraging = true;
        startDrag();
    }
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
    if(mainModel.isDraging) {
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
        mainModel.dragNode = null;
        stopDrag();
    }
}

private function mouseOverHandle(event : MouseEvent) :void
{
    if(mainModel.isDraging&&mainModel.dragNode!=this) {
        this.setStyle("backgroundAlpha",0);
        this.setStyle("borderStyle","inset");
		if(this._parentNode == null)
			mainModel.dragNode._dirFlag = (mouseX > this.width/2?"right":"left");
		else
			mainModel.dragNode._dirFlag = this._direction;
    }
}
private function mouseOutHandle(event : MouseEvent) : void
{
    this.setStyle("backgroundAlpha",1);
    this.setStyle("borderStyle","none");
}

private function expandNodeHandle(_direction : String) : void
{
    if(getChildNodes("right").length + getChildNodes("left") == 0) return;
	if(_parentNode==null) {
		if(_isExpanding) {
			setExpandNodesSpace(getChildNodesSpace("right"),"right");
			setExpandNodesSpace(getChildNodesSpace("left"),"left");
			changeChildNodesSpace(-getExpandNodesSpace("right"),"right");
			changeChildNodesSpace(-getExpandNodesSpace("left"),"left");
			_isExpanding = false;
		} else {
			changeChildNodesSpace(getExpandNodesSpace("right"),"right");
			changeChildNodesSpace(getExpandNodesSpace("left"),"left");
		    setExpandNodesSpace(0,"right");
		    setExpandNodesSpace(0,"left");
			_isExpanding = true;
		}
		hideNodeHandle(getChildNodes("right"),_isExpanding);
		hideNodeHandle(getChildNodes("left"),_isExpanding);
	} else {
		if(_isExpanding) {
			setExpandNodesSpace(getChildNodesSpace(_direction),_direction);
			changeChildNodesSpace(-getChildNodesSpace(_direction),_direction);
	        _isExpanding = false;
	    } else {
			changeChildNodesSpace(getExpandNodesSpace(_direction),_direction);
			setExpandNodesSpace(0,_direction);
	        _isExpanding = true;
	    }
		hideNodeHandle(getChildNodes(this._direction),_isExpanding);
	}
	
    refresh();
}