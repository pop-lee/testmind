// ActionScript file

public var isFocusIn : Boolean = false;

public function setFocusNode() : void
{
    if(mainModel.focusNode != null&&mainModel.focusNode!=this) 
        mainModel.focusNode.setStyle("backgroundColor",0xffffff);
    mainModel.focusNode = this;
    this.setFocus();
    this.setStyle("backgroundColor",0x66ccff);
}

private function focusInHandle() : void
{
//    isFocusIn = true;
}
private function focusOutHandle() : void
{
//    isFocusIn = false;
    content.editable = this.isEditable = false;
}