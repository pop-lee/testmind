// ActionScript file
public function setFocusNode() : void
{
    if(mainModel.focusNode != null&&mainModel.focusNode!=this) 
        mainModel.focusNode.setStyle("backgroundColor",0xffffff);
    mainModel.focusNode = this;
    this.setStyle("backgroundColor",0x66ccff);
}

private function focusInHandle() : void
{
    
}
private function focusOutHandle() : void
{
//    trace(this + "123");
}