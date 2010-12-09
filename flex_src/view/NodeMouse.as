// ActionScript file
private function mouseDownHandle(event : MouseEvent) : void
{
    setFocusNode();
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
    }
}
private function mouseOutHandle(event : MouseEvent) : void
{
    this.setStyle("backgroundAlpha",1);
    this.setStyle("borderStyle","none");
}